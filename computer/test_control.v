module test_control();

inout wire [7:0] bus;
reg clk = 1'b0;
reg reset = 1'b0;
reg read = 1'b0;
reg write = 1'b0;
reg clear = 1'b0;

reg [7:0] bus_data;
reg bus_enable;

control_logic ctrl(
	.clock (clk),
	.reset (reset),
	.bus (bus),
	.read (read),
	.write (write),
	.clear (clear)
	);

initial begin
  clk = 1'b0;
  forever #1 clk = ~clk;
end

assign bus = bus_enable ? bus_data : 8'bz;

initial begin
  	$monitor("Time: %h, Bus: %b", $time, bus);
  	bus_data = 8'd128;
  	bus_enable = 1'b1;
  	read = 1'b1;

  	#2
	bus_data = 8'd255;
  	bus_enable = 1'b1;
	read = 1'b0;

	#4
	bus_enable = 1'b0;
	write = 1'b1;

	#6
	write = 1'b0;

  
end 



endmodule
