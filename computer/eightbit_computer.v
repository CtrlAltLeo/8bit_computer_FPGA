// Top level module with bus and submodules
module eightbit_computer(
	bus, // 8 bit wide bus
	clk, // Clock signal external
  reg1_data_in,
  reg1_data_out,
  reg1_clr
);

inout wire [7:0] bus;
input clk;
input reg1_data_in;
input reg1_data_out;
input reg1_clr;

register reg1(
  .bus (bus),
  .clk (clk),
  .data_in (reg1_data_in),
  .data_out (reg1_data_out),
  .clr (reg1_clr)
);

endmodule
