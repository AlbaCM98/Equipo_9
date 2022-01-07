//MIGUEL BENAVIDES

module MemorySys #(

	parameter DATA_WIDTH = 32

)

(

	input white_Enable_i,clk, //selec,//
	input [(DATA_WIDTH-1):0] Address_i, Write_Data,
	output[(DATA_WIDTH-1):0] Instruction_o
	     

);

wire [DATA_WIDTH-1:0] out1,out2;
wire selec;
reg [(DATA_WIDTH-1):0] addr = 32'h1000_0000;

assign selec = (Address_i < addr) ? 0 : 1;

RAM RAMUT(

	.data(Write_Data),
	.addr(Address_i),
	.we(white_Enable_i), 
	.clk(clk),
	.q(out1)
);

ROM ROMUT(

	.Address_i(Address_i),
	.Instruction_o(out2)

);

mux2to1 muxut (

	.select(selec),
	.input_a(out1),
	.input_b(out2),
   .out(Instruction_o)

);

endmodule 