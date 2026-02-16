// "Frame" of the computer were parts are mounted
module computer(input clock,
					inout wire [7:0] bus,
					output MI, // MAR In
					output RI, //RAM In
					output RO, //RAM out
					output HLT, // Halt Clock
					output CLR, // Clear MAR
					output [6:0] SS_Out, // 7 segment display out
					output [3:0] SS_Sel, // 7 segment display selector
					output NEG, // Add minus sign to display
					output [3:0] led
					);
					
wire Load_Instruction;
wire Load_A;
wire Write_A;
wire Load_B;
wire Write_ALU;
wire Sub;
wire Load_O;
wire Enable_Counter;
wire Write_Counter;	

// Program Counter

// Instruction Register + Control Logic

// A, B and ALU				

// Output Register			
endmodule
