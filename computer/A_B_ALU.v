module A_B_ALU(
    input clk,
    inout [7:0] bus,
    input load_a,
    input write_a,
    input load_b,
    input write_alu,
    input enable_sub,
    input clear
    );
    
    reg [7:0] reg_a;
    reg [7:0] reg_b;
    
    //assign bus = write_a ? reg_a : 8'bz;
    
    initial begin
        reg_a = 8'b01101001;
    end

    always @(posedge clk) begin
        reg_a <= ~reg_a;
    end
    
    assign bus = reg_a;

endmodule