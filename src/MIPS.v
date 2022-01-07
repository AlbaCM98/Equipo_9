

module MIPS
(
input clk_m,
input reset_m,
//input [7:0]GPIO_i,
output [7:0] GPIO_m
);

wire [5:0] OP;
wire [5:0] FUNCT;
wire PCWRITE;
wire IORD;
wire MEMWRITE;
wire IRWRITE;
wire REGDST;
wire MEMREG;
wire REGWRITE;
wire ALUSRCA;
wire [1:0]ALUSRCB;
wire [2:0]ALUCONTROL;
wire [1:0] PCSRC;
wire 			ZERO;

Control_Unit cu(

	.clk(clk_m),
	.reset(reset_m),
	.Zero(ZERO),
	.Op(OP), 
	.Funct(FUNCT), 
	.PCWrite(PCWRITE),
	.I_or_D(IORD), 
	.Mem_Write(MEMWRITE), 
	.IR_Write(IRWRITE),
	.PC_Src(PCSRC), 
	.Reg_Write(REGWRITE), 
	.Mem_to_Reg(MEMREG), 
	.Reg_Dst(REGDST), 
	.ALUSrcA(ALUSRCA),
	.ALUSrcB(ALUSRCB),
	.ALU_Control(ALUCONTROL) 
   //.GPIO_I()
);


Data_Path_wrapper dpw(

	.clk(clk_m),
	.reset(reset_m),
	//.GPIO_i,
	.GPIO_o(GPIO_m),
	.PCWrite(PCWRITE),
	.PCSrc(PCSRC),//
	.RegWrite(REGWRITE),
	.IorD(IORD),
	.MemWrite(MEMWRITE),
	.IRWrite(IRWRITE),
	.RegDst(REGDST),
	.MemtoReg(MEMREG),
	.ALUSrcA(ALUSRCA),
	.ALUSrcB(ALUSRCB),
	.ALUControl(ALUCONTROL),
	.Op(OP),
	.Funct(FUNCT),
	.Zero(ZERO)

);

endmodule 