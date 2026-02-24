module tb_computer();

inout wire [7:0] bus;
reg clk;
reg reset;
reg reg1_in;
reg reg1_out;
reg reg1_clr;

reg [7:0] bus_data;
reg bus_enable;

wire [6:0] digit_test;
reg output_r;

eightbit_computer computer(
  .bus (bus),
  .clk (clk),
  .reg1_data_in (reg1_in),
  .reg1_data_out (reg1_out),
  .reg1_clr (reg1_clr)
);

/*output_register output_test(
  .clk (clk),
  .display (digit_test),
  .clear (reset),
  .bus (bus),
  .input_en (output_r)
);*/

initial begin
  clk = 1'b0;
  forever #1 clk = ~clk;
end

assign bus = bus_enable ? bus_data : 8'bz;

initial begin
  bus_enable = 1'b1;
  bus_data = 8'd118;
  output_r = 1'b1;
  #2
  $display("Time: %h, Output: %b", $time, digit_test);
end 

/*
initial begin
  clk = 1'b0;
  bus_enable = 1'b1;
  bus_data = 8'hCD;
  reg1_out = 1'b0;
  #1 
  $display("Time: %d,  Bus: %h, reg out: %b", $time,  bus, reg1_out);

  reg1_in = 1'b1;


  #1 clk = 1'b1;
  #1 clk = 1'b0;

  reg1_in = 1'b0;
  #1 bus_enable = 1'b0;

  reg1_out = 1'b1;


  $display("Time: %d,  Bus: %h, reg out: %b", $time,  bus, reg1_out);

  bus_enable = 1'b0;
  reg1_out = 1'b0;
  #1

  $display("Time: %d,  Bus: %h, reg out: %b", $time,  bus, reg1_out);
end*/


endmodule
