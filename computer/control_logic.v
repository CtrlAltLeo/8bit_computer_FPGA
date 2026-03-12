module control_logic(
    input clock,
    input reset,
    //control signals
    output reg [15:0] ctrl_wd,
    //HLT MI RI RO | IO II CO CI |
    //CE AO AI ALO | SUB BI DI unused
    
    //instruction input
    input [7:0] instruction
    );
    
    //control counter
    reg [2:0] count = 3'b0;
    reg count_clear = 1'b0;

    always @(negedge clock) begin
        if (count_clear || count == 3'd4)
            count <= 3'b0;
        else
            count <= count + 1;
    end
    
    wire [2:0] count_wire;
    assign count_wire = count;
    
    wire [6:0] address;
    assign address = {instruction[7:4], count};
    
    
    always @(*) begin
        case (address)
            //LDA
            7'b0001000: ctrl_wd = 16'h4200;
            7'b0001001: ctrl_wd = 16'h1480;
            7'b0001010: ctrl_wd = 16'h4800;
            7'b0001011: ctrl_wd = 16'h1020;
            
            //ADD
            7'b0010000: ctrl_wd = 16'h4200;
            7'b0010001: ctrl_wd = 16'h1480;
            7'b0010010: ctrl_wd = 16'h4800;
            7'b0010011: ctrl_wd = 16'h1004;
            7'b0010100: ctrl_wd = 16'h0030;
            
            //OUT
            7'b0011000: ctrl_wd = 16'h4200;
            7'b0011001: ctrl_wd = 16'h1480;
            7'b0011010: ctrl_wd = 16'h0042;
            
            //HLT
            7'b1111000: ctrl_wd = 16'h4200;
            7'b1111001: ctrl_wd = 16'h1480;
            7'b1111010: ctrl_wd = 16'h8000;
            
            //SUB
            7'b0100000: ctrl_wd = 16'h4200;
            7'b0100001: ctrl_wd = 16'h1480;
            7'b0100010: ctrl_wd = 16'h4800;
            7'b0100011: ctrl_wd = 16'h1004;
            7'b0100100: ctrl_wd = 16'h0038;

            //ADDI
            7'b0011000: ctrl_wd = 16'h4200;
            7'b0011001: ctrl_wd = 16'h1480;
            7'b0101010: ctrl_wd = 16'h0804;
            7'b0101011: ctrl_wd = 16'h0030;
            
            
            
            default: ctrl_wd = 16'hFFFF;
        endcase
    end

    
endmodule
