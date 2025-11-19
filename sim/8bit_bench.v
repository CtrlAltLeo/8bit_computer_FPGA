module test;
	
	reg reset = 0;

	initial
	begin
		#0 reset = 1;
		#1 reset = 0;
	end

	reg clk = 0;
	always #10 clk = !clk;

	wire [3:0] count_out;

	initial
	begin
		#200 $finish;
	end

	program_counter c1 (clk, reset, count_out);

	initial
	begin
		$monitor("Time:\t%t\tCounter: %b", $time, count_out);
	end
endmodule

/*module test;

	reg reset = 0;
	initial begin
		# 17 reset = 1;
		# 11 reset = 0;
		# 29 reset = 1;
		# 100 $stop;
	end

	reg clk = 0;
	always #5 clk = !clk;

	wire [7:0] value;
	counter c1 (value, clk, reset);

	initial
		$monitor("At time %t, value = %h (%0d)", $time, value, value);
endmodule*/
