module control_logic(
    input clock,
    input reset,
    //control signals
    output HLT,
    output MI,
    output RI,
    output RO,
    output IO,
    output II,
    output CO,
    output CI,
    output CE,
    output AO,
    output AI,
    output ALO,
    output SUB,
    output BI,
    output DI
    );
    
    reg [7:0] instruction;

    //control counter
    reg [5:0] count;
    reg count_clear = 1'b0;

    always @(negedge clock) begin
        if (count_clear || count == 6'b100000)
            count <= 6'b1;
        else
            count << 1;
    end
    
    always @(*) begin
        case (count)
            6'b1: begin
                CO = 1'b1;
                MI = 1'b1;
            end
            
            6'b10: begin
                RO = 1'b1;
                II = 1'b1;
                CE = 1'b1;
            end
            
            default: begin
                CO = 1'b0;
                MI = 1'b0;
                RO = 1'b0;
                II = 1'b0;
                CE = 1'b0;
            end
        endcase
    end

    
endmodule
