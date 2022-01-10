// MIGUEL BENAVIDES


module Register #(
	parameter N=32
)

(	
	input [N-1:0] D,
	input clk, rst, en,  
	output reg [N-1:0] Q	
);

//always@(posedge clk, negedge rst) begin
always@(negedge rst or posedge clk) begin	
	if(rst==0)
		Q <= 1'b0;
		
	else if (en==1)
		Q <= D;
	end
endmodule 

//module Register #(
//	parameter N=32
//)
//
//(	
//	input [N-1:0] D,
//	input clk, rst, en,  
//	output reg [N-1:0] Q	
//);
//
////always@(posedge clk, negedge rst) begin
//always@(posedge clk or negedge rst) begin	
//	if(!rst)
//		Q <= 1'b0;
//		
//	else if (en)
//		Q <= D;
//	end
//endmodule 