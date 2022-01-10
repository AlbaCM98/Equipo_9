
module mux4to1 #(

		parameter N = 32

)
(
		input[N-1:0] I0,I1,I2,I3,
		input[1:0] s,
		output reg[N-1:0] out

);

always @(*) begin

		case(s)
			2'b00: out = I0;
			2'b01: out = I1;
			2'b10: out = I2;
			2'b11: out = I3;
		endcase
	end	

endmodule 