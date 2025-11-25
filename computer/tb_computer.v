module tb_computer;

  inout wire [7:0] bus;
  reg clk = 1'b0;
  reg reset = 1'b0;
  reg reg1_in = 1'b0;
  reg reg1_out = 1'b0;
  reg reg1_clr = 1'b0;
  reg reg2_in = 1'b0;
  reg reg2_out = 1'b0;
  reg reg2_clr = 1'b0;

  reg [7:0] bus_data;
  reg bus_enable;


  eightbit_computer computer(
    .bus (bus),
  	.clk (clk),
  	.reg1_data_in (reg1_in),
  	.reg1_data_out (reg1_out),
  	.reg1_clr (reg1_clr),
  	.reg2_data_in (reg2_in),
  	.reg2_data_out (reg2_out),
  	.reg2_clr (reg2_clr)
  );


  assign bus = bus_enable ? bus_data : 8'bz;

  //set the clock period to every ten time steps
  always #5 clk = !clk;

  initial begin
    #0 bus_data = 8'hCD;
    #0 bus_enable = 1'b1;
    
    #1 reg1_in = 1'b1;
    
    #6 bus_enable = 1'b0;
    #6 reg1_in = 1'b0;
    #6 reg1_out = 1'b1;
    #6 reg2_in = 1'b1;

    #16 reg1_out = 1'b0;
    #16 reg2_in = 1'b0;
	#16 reg2_out = 1'b1;

	#26 reg1_clr = 1'b1;
    #26 reg2_clr = 1'b1;

	#27 $finish;
  end


	initial
      $monitor("Time: %d,  Bus: %b (%h), reg1 out: %b, reg2 out: %b", $time,  bus, bus, reg1_out, reg2_out);

endmodule
/*initial begin
  clk = 1'b0;
  bus_enable = 1'b1;
  bus_data = 8'hCD;
  reg1_out = 1'b0;
  #1 
  $display("Time: %d,  Bus: %b (%h), reg out: %b", $time,  bus, bus, reg1_out);

  reg1_in = 1'b1;


  #1 clk = 1'b1;
  #1 clk = 1'b0;

  reg1_in = 1'b0;
  #1 bus_enable = 1'b0;

  reg1_out = 1'b1;


  $display("Time: %d,  Bus: %h, reg out: %b", $time,  bus, bus, reg1_out);

  bus_enable = 1'b0;
  reg1_out = 1'b0;
  #1

  $display("Time: %d,  Bus: %h, reg out: %b", $time,  bus, bus, reg1_out);
end
*/
