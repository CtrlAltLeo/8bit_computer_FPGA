module test_control();

inout wire [7:0] bus;
reg clk = 1'b0;
reg reset = 1'b1;
reg read = 1'b0;
reg write = 1'b0;
reg clear = 1'b0;
reg RI;

reg [7:0] bus_data = 8'hED;
reg bus_enable = 1'b0;

computer comp(
	.clock(clk),
	.reset_btn(reset),
	.bus(bus),
	.RI(test)
	);

initial begin
  clk = 1'b0;
  forever #1 clk = ~clk;
end


initial begin
  	$monitor("Time: %h; RI: %b", $time, RI);
end 

assign bus = bus_enable ? bus_data : 8'bz;



endmodule
