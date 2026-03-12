// "Frame" of the computer were parts are mounted
module computer(input clock,
				input reset_btn,
				input fast_clock, //for output_register
				inout wire [7:0] bus,
				output MI, // MAR In
				output RI, //RAM In
				output RO, //RAM out
				output HLT, // Halt Clock
				output CLR, // Clear MAR
				output [6:0] SS_Out, // 7 segment display out
				output [2:0] SS_Sel, // 7 segment display selector
				output NEG, // Add minus sign to display
				output wire [3:0] led
				);
					
//these are deprecated through use of control word wire
/*
wire Instruction_In;
wire Instruction_Out;
wire Load_A;
wire Write_A;
wire Load_B;
wire Write_ALU;
wire Sub;
wire Load_O;
wire Enable_Counter;
wire Counter_Out;
wire Counter_In;
*/
wire Counter_Clear; //not sure where this goes in control word
wire Output_Clear; //also currently still in use
/*
wire Output_In;*/

wire Reset;

wire [15:0] control_word;
//HLT MI RI RO | IO II CO CI | CE AO AI ALO | SUB BI DI unused
//15  14 13 12   11 10  9  8    7  6  5   4     3  2  1  0

assign MI = control_word[14];
assign RI = control_word[13];
assign RO = control_word[12];
assign HLT = control_word[15];
//assign CLR =
//^^^not sure what this one maps to tbh


// Temp Drivers
assign Enable_Counter = 1;

// Program Counter
program_counter pc(
	.clock(clock), 
	.bus(bus), 
	.enable(control_word[7]),
	.c_out(control_word[9]), 
	.c_in(control_word[8]), 
	.clear(Counter_Clear), 
	.reset(Reset), 
	.led(led)
);

// Wire for connection between instruction register and control logic
wire [7:0] inst_reg_to_ctrl;

// Instruction Register
instruction_register ir(
	.clock(clock),
	.bus(bus),
	.reset(Reset),
	.read(control_word[10]),
	.write(control_word[11]),
	.clear(Reset), //clear mapped to reset for now, not sure if we need both
	.instruction(inst_reg_to_ctrl)
	);

//Control logic
control_logic ctrl(
	.clock(clock),
	.reset(Reset),
	.ctrl_wd(control_word),
	.instruction(inst_reg_to_ctrl)
	);


// A, B and ALU
a_b_alu ab_alu(
  .clock(clock),
  .bus(bus),
  .a_in(control_word[5]),
  .a_out(control_word[6]),
  .a_clear(Reset), //mapping both to Reset for now
  .a_reset(Reset), //mapping both to Reset for now
  .b_in(control_word[2]),
  //this is not used in original eight bit control scheme, currently not enabled
  //.b_out(),
  .b_clear(Reset), //both to reset for now
  .b_reset(Reset), //both to reset for now
  .alu_out(control_word[4]),
  .subract(control_word[3])
);

// Output Register
output_register out(
	.clk(clock),
	.fast_clk(fast_clock),
	.clear(Output_Clear),
	.bus(bus),
	.input_en(control_word[1]),
	.display(SS_Out),
	.display_en(SS_Sel)
);

assign Reset = ~reset_btn;			

endmodule
