module a_b_alu(clock, bus, a_in, a_out, a_clear, a_reset, b_in, b_out, b_clear, b_reset, alu_out, subtract);

// Computer syncronization 
input clock;
inout [7:0] bus;

// A
input a_in;
input a_out;
input a_clear;
input a_reset;
reg [7:0] a_reg;

// B
input b_in;
input b_out;
input b_clear;
input b_reset;
reg [7:0] b_reg;

//ALU
input alu_out;
input subtract;
wire [7:0] alu_value;

// A Logic
always @(posedge clock)
begin
	if (a_reset || a_clear)
		a_reg <= 8'h00;
	if (a_in)
		a_reg <= bus;
end

// B Logic
always @(posedge clock)
begin
	if (b_reset || b_clear)
		b_reg <= 8'h00;
	if (b_in)
		b_reg <= bus;
end

// ALU Driver
assign alu_value = subtract == 0 ? a_reg + b_reg : a_reg - b_reg;

assign bus = a_out ? a_reg : 8'bz;
assign bus = b_out ? b_reg : 8'bz;
assign bus = alu_out ? alu_value : 8'bz;

endmodule