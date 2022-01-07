// MIGUEL BENAVIDES 
// Single port RAM with single read/write address 

module RAM
#
(
		parameter DATA_WIDTH=32,
		parameter ADDR_WIDTH=32,
		parameter MEMORY_DEPTH = 64
	
)
(
	input [(DATA_WIDTH-1):0] data,
	input [(ADDR_WIDTH-1):0] addr,
	input we, clk,
	output [(DATA_WIDTH-1):0] q
);

	reg [DATA_WIDTH-1:0] ram[MEMORY_DEPTH-1:0];
	reg [ADDR_WIDTH-1:0] addr_reg = 32'h1001_0000;

	always @ (posedge clk)
	begin
	
		if (we)
		
			ram[(addr-addr_reg) >> 2] <= data;
		
	end
 
	assign q = ram[(addr - addr_reg) >> 2];

endmodule
