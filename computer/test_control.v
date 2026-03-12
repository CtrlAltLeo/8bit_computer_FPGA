module test_control();

inout wire [7:0] bus;
reg clk = 1'b0;
reg reset = 1'b0;
reg read = 1'b0;
reg write = 1'b0;
reg clear = 1'b0;

reg [7:0] bus_data;
reg bus_enable;

wire [15:0] control;

reg [7:0] instruction;

control_logic ctrl(
	.clock (clk),
	.reset (reset),
	.ctrl_wd (control),
	.instruction (instruction)
	);

initial begin
  clk = 1'b0;
  forever #1 clk = ~clk;
end


initial begin
	#1 instruction = 8'b00011111;
  	$monitor("Time: %h; ctrlwd: %h", $time, control);

	#10 instruction = 8'b00101111;
  
end 



endmodule
