
module MemorySys_wrap #(

	parameter MEMORY_DEPTH = 64,
	parameter DATA_WIDTH = 32

)

(

	input white_Enable_i_w,clk_w,//sel_w,//
	input [(DATA_WIDTH-1):0] Address_i_w, Write_Data_w,
	output wire[(DATA_WIDTH-1):0] Instruction_o_w

);



 MemorySys MEMUT(
   
	//.selec(sel_w),//
	.clk(clk_w),
	.white_Enable_i(white_Enable_i_w),
	.Address_i(Address_i_w), 
	.Write_Data(Write_Data_w),
	.Instruction_o(Instruction_o_w)
);


endmodule 