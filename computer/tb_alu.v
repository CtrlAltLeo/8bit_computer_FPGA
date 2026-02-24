module tb_alu();

inout wire [7:0] bus;
reg clk;
reg load_a;
reg write_a;
reg load_b;
reg write_alu;
reg enable_sub;
reg clear;

A_B_ALU alu(
    .clk(clk),
    .bus(bus),
    .load_a(load_a),
    .write_a(write_a),
    .load_b(load_b),
    .write_alu(write_alu),
    .enable_sub(enable_sub),
    .clear(clear)
);

initial begin
    clk = 1'b0;
    forever #1 clk = ~clk;
end

initial begin
    $monitor("Time: %d, Bus: %h", $time, bus);
end

endmodule