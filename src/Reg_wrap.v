//MIGUEL BENAVIDES
// Wrapper Register File

module Reg_wrap#(

	parameter N = 32
)
(
	input clk, reset, Reg_write_in,
	input [4:0] Write_Register_1, Read_Register_1, Read_Register_2,
	input [N-1:0] Write_Data,
	output [N-1:0] Read_Data_1, Read_Data_2	
);

Register_File register(

		.clk(clk), 
		.reset(reset), 
		.Reg_write_in(Reg_write_in),
		.Write_Register_1(Write_Register_1), 
		.Read_Register_1(Read_Register_1), 
		.Read_Register_2(Read_Register_2),
		.Write_Data(Write_Data),
		.Read_Data_1(Read_Data_1), 
		.Read_Data_2(Read_Data_2)
);

endmodule 