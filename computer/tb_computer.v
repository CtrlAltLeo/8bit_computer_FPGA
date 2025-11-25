module tb_computer();

inout wire [7:0] bus;
reg clk;
reg reset;
reg reg1_in;
reg reg1_out;
reg reg1_clr;


eightbit_computer computer(
  .bus (bus),
  .clk (clk),
  .reg1_data_in (reg1_in),
  .reg1_data_out (reg1_out),
  .reg1_clr (reg1_clr)
);

/*
initial begin
  clk = 1'b0;
  forever #1 clk = ~clk;
end
*/

initial begin
  clk = 1'b0;

  bus = 8'bz;

  $monitor("time=%3d, clock=%b", $time, clk);

  $finish;
end


endmodule
