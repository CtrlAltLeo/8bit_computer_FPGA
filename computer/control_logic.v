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
    reg [3:0] count;
    reg count_clear = 1'b0;

    always @(negedge clock) begin
        if (count_clear)
            count <= 4'b0;
        else
            count <= count + 1;
    end
    
endmodule
