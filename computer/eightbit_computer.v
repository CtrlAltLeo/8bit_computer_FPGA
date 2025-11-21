// Top level module with bus and submodules

module eightbit_computer(
	bus, // 8 bit wide bus
	clk, // Clock signal external
	reg_1_di, //data in
	reg_1_do, //data out
	led1,
	led2,
	led3
);

//inout wire [7:0] bus;
inout wire [1:0] bus;

input clk;
input reg_1_di;
input reg_1_do;

output led1;
output led2;
output led3;

two_bit_reg r1(
	.bus (bus),
	.clk (clk),
	.data_in (reg_1_di),
	.data_out (reg_1_do)
);

/*
always @(posedge clk)
begin
	reg_1_do <= reg_1_di;
end	

assign bus = reg_1_do;
*/

//assign led1 = 1'b0;
assign led1 = ~clk;
assign led2 = ~reg_1_di;
assign led3 = ~reg_1_do;

endmodule
