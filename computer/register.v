// 8bit register
module register(
	bus,
	clk,
	data_in,
	data_out,
	clr
);

inout wire [7:0] bus;
input clk;
input data_in;
input data_out;
input clr;

reg [7:0] data;

always @(posedge clk or posedge clr)
begin
	if (data_in)
		data <= bus;
  if (clr)
    data <= 8'h00;
end

assign bus = data_out ? data : 8'bz;

endmodule
