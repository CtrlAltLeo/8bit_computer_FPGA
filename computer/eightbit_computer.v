// Top level module with bus and submodules
module eightbit_computer(
	bus, // 8 bit wide bus
	clk, // Clock signal external
  reg1_data_in,
  reg1_data_out,
  reg1_clr,
  reg2_data_in,
  reg2_data_out,
  reg2_clr
);

inout wire [7:0] bus;
input clk;
input reg1_data_in;
input reg1_data_out;
input reg1_clr;
input reg2_data_in;
input reg2_data_out;
input reg2_clr;

register reg1(
  .bus (bus),
  .clk (clk),
  .data_in (reg1_data_in),
  .data_out (reg1_data_out),
  .clr (reg1_clr)
);

register reg2(
  .bus (bus),
  .clk (clk),
  .data_in (reg2_data_in),
  .data_out (reg2_data_out),
  .clr (reg2_clr)
);
	

/*
always @(posedge clk)
begin
	reg_1_do <= reg_1_di;
end	

assign bus = reg_1_do;


//assign led1 = 1'b0;
assign led1 = ~clk;
assign led2 = ~reg_1_di;
assign led3 = ~reg_1_do;
*/
endmodule
