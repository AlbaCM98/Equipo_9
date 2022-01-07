
module Sign_extend(

	input[15:0] in,
	output  [31:0] out

);

assign out = { {16{in[15]}}, in};

endmodule


//always @(*) begin
//
//	if (in[15] == 1'b0)
//	begin
//			out <= {16'b0, in};
//	end
//	else 
//	begin
//			out <= {16'b1, in};
//	end
//end
//
//endmodule 


//siempre consatntes complemento 2

//tomar bit[15] y replicarlo 16 veces