module rom_test(
	addr, // 4
	out, // 4
	clk, // 1
	wren // 1
);

input [3:0] addr;
output [7:0] out;
input clk;
output wren;

reg [7:0] data; // dummy to pacify the ROM

rom control_logic(
	.address (addr),
	.clock (clk),
	.data (data),
	.wren (wren),
	.q (out)
);

assign wren = 1'b0;
//assign addr = 4'b0001;

endmodule