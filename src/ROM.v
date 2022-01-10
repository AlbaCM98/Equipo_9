//MIGUEL BENAVIDES

module ROM
#
(
	parameter MEMORY_DEPTH = 64,
	parameter DATA_WIDTH = 32
)
(

	input [(DATA_WIDTH-1):0] Address_i,
	output reg [(DATA_WIDTH-1):0] Instruction_o
);

	reg [DATA_WIDTH-1:0] rom [MEMORY_DEPTH-1:0];
	reg [DATA_WIDTH-1:0] addr_reg = 32'h400_000;

	initial
	begin
		$readmemh("C:/ARQUI/MIPS_BENAVIDES_MIGUEL/ttext.dat", rom); 
		//$readmemh("C:/ARQUI/Sistema de Memoria/src/text.dat", rom); 
		
	end

	always @ (Address_i)
	begin
	
		Instruction_o = rom[(Address_i- addr_reg)>>2];
	end

endmodule
