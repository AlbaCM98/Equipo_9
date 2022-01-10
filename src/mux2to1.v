/// MIGUEL BEANVIDES

module mux2to1 #(
		
		parameter DW = 32

)
(
		input select,
		input [DW-1:0] input_a, input_b,
		output [DW-1:0] out

);

assign out = (select) ? input_a : input_b;
 
endmodule
