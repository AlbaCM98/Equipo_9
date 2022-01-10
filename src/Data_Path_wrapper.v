
module Data_Path_wrapper #(

	parameter DataWidth = 32
	
)
(
	input clk,
	input reset,
	//input	 [7:0]    GPIO_i,
	output [7:0] GPIO_o,
	input  PCWrite,
	input  [1:0]PCSrc,//
	input  RegWrite,
	input  IorD,
	input  MemWrite,
	input  IRWrite,
	input  RegDst,
	input  MemtoReg,//[1:0]
	input  ALUSrcA,
	input  [1:0] ALUSrcB,
	input  [2:0] ALUControl,
	output [5:0] Op,
	output [5:0] Funct,
	output		 Zero

);

data_path DP(


.clk_dp(clk),
.rst(reset),
.IorD(IorD),
.MemWrite(MemWrite),
.IRWrite(IRWrite), 
.RegWrite(RegWrite), 
.PCSrc(PCSrc), 
.ALUSrcA(ALUSrcA), 
.MemtoReg(MemtoReg), 
.RegDst(RegDst), 
.PCene(PCWrite),
.ALUSrcB(ALUSrcB), 
.ALUSControl(ALUControl),
.GPIO_o(GPIO_o),
.op(Op),
.funct(Funct),
.Zero(Zero)

);

endmodule 