// "Frame" of the computer were parts are mounted
module computer(input clock,
					 input reset_btn,
					inout wire [7:0] bus,
					output MI, // MAR In
					output RI, //RAM In
					output RO, //RAM out
					output HLT, // Halt Clock
					output CLR, // Clear MAR
					output [6:0] SS_Out, // 7 segment display out
					output [3:0] SS_Sel, // 7 segment display selector
					output NEG, // Add minus sign to display
					output wire [3:0] led,
					input [3:0] pc_drive //TEMP FOR TESTING PC
					);
					
wire Load_Instruction;
wire Load_A;
wire Write_A;
wire Load_B;
wire Write_ALU;
wire Sub;
wire Load_O;
wire Enable_Counter;
wire Counter_Out;
wire Counter_In;
wire Counter_Clear;

wire Reset;

// Temp Drivers
assign Enable_Counter = pc_drive[0];
assign Counter_Out = pc_drive[1];
assign Counter_In = pc_drive[2];
assign Counter_Clear = pc_drive[3];


// Program Counter
program_counter pc(
	.clock(clock), 
	.bus(bus), 
	.enable(Enable_Counter), 
	.c_out(Counter_Out), 
	.c_in(Counter_In), 
	.clear(Counter_Clear), 
	.reset(Reset), 
	.led(led)
);

// Instruction Register + Control Logic

// A, B and ALU				

// Output Register

assign Reset = ~reset_btn;			

endmodule
