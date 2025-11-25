module tb_computer();

inout wire [7:0] bus;
reg clk;
reg reset;
reg reg1_in;
reg reg1_out;
reg reg1_clr;

reg [7:0] bus_data;
reg bus_enable;


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

assign bus = bus_enable ? bus_data : 8'bz;

initial begin
  clk = 1'b0;

  bus_enable = 1'b1;
  bus_data = 8'h00;

  #10

  bus_data = 8'hAA;
  
  #5 bus_enable = 1'b1;

  #20

  clk = 1'b1;
  $monitor("time=%3d, bus=%b, clock=%b", $time, bus_data, clk);

  bus_enable = 1'b0;
end


endmodule
