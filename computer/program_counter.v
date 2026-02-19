module program_counter(clock, bus, enable, c_out, c_in, clear, reset, led);

inout [7:0] bus;

input clock;
input enable;
input c_out;
input c_in;
input clear;
input reset;

output wire [3:0] led;

reg [3:0] counter;

always @(posedge clock or posedge clear or posedge reset) 
begin
	if (reset || clear)
		counter <= 4'h0;
	else if (c_in)
		counter <= bus[3:0];
	else if (enable)
		counter <= counter + 1;
end

assign led = ~counter;

assign bus = c_out ? {4'b0000, counter} : 8'bz;

endmodule
