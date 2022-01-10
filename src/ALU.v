////// ALU MIGUEL BENAVIDES ///////


module ALU #(
	
	parameter WIDTH = 32
)

(
	output reg [WIDTH -1: 0] y,
	output zero, 
	input [WIDTH -1: 0] a, b,
	input [2:0] select,
	input c_in
);

reg cero;

always @(*) begin
		
		case ({select, c_in})
		
			4'b000_0: y = a + b;
			4'b001_0: y = a & b;
			4'b010_0: y = a | b;
			4'b011_0: y = a - b;
			4'b100_0: y = $signed(a) < $signed(b) ? 1 : 0;   // SLT
			4'b101_0: y = a << 1;
			4'b110_0: y = a >> 1;
			4'b111_0: y = 32'h0;
			 
			
			default:		y = 32'h0;
		endcase
		
		cero = (y == 32'h0) ? 1 : 0;// revisar
	end	
		assign zero = cero;

endmodule	
	




//module ALU	 // ARITHMETIC UNIT
//	#(parameter WIDTH = 32)
//	(output reg	[WIDTH -1: 0] 	y,
//	input		[WIDTH -1: 0]	a, b,
//	input					c_in,
//	input		[3: 0]	select);
//	//input		[WIDTH: 0]	select);
//	//reg	[WIDTH -1: 0]	y);
//
//always @ (*)
//begin
//y= 4'b0;
//case ({select, c_in})
//6'b00000_0:	y = a;
//6'b00000_1:	y = a + 1'b1;
//6'b00001_0:	y = a + b;
//6'b00001_1:	y = a + b + 1'b1;
//6'b00010_0:	y = a + ~b;
//6'b00010_1:	y = a + (~b) + 1'b1;
//6'b00011_0:	y = a - 1'b1;
//6'b00011_1:	y = b;
//6'b00100_0:	y = a & b;
//6'b00101_0:	y = a | b;
//6'b00110_0: y = a ^ b;
//6'b00111_0:	y = ~a;
//6'b01000_0:	y = a << 1;
//6'b10000_0:	y = a >> 1;		
//6'b11000_0:	y = 0;  
//6'b11001_0:	y = ~b;  //25 nuevo caso NOT b
//6'b11001_1:	y = a ^~ b;  //25 nuevo caso  XNOR       
//default:		y = 4'b0;
//endcase
//end
//endmodule
