// 1 bit register

module one_bit_reg (
	bus,
	clk,
	data_in,
	data_out
	// , clear function
);

inout bus; 

input clk;
input data_in;
input data_out;


reg data;

always @(posedge clk)
begin
	if (data_in)
		data <= bus;
end

assign bus = data_out ? data : 1'bz;

endmodule