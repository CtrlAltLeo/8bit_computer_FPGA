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
    
    always @(posedge clk) begin
        
    end