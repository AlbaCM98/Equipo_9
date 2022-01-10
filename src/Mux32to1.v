// MIGUEL BENAVIDES
// Multiplexer 32 to 1
 
module Mux32to1 #(
	parameter WIDTH=32
)
(
	input [4:0] Sel,
	input [WIDTH-1:0] I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15,I16,I17,I18,I19,I20,
							I21,I22,I23,I24,I25,I26,I27,I28,I29,I30,I31,
   output reg [WIDTH-1:0] Data_out
); 
 
always@(*) begin
	
      case(Sel)
         0: Data_out = I0;
         1: Data_out = I1;
         2: Data_out = I2;
			3: Data_out = I3;
         4: Data_out = I4;
         5: Data_out = I5;
			6: Data_out = I6;
         7: Data_out = I7;
         8: Data_out = I8;
			9: Data_out = I9;
         10: Data_out = I10;
			11: Data_out = I11;
         12: Data_out = I12;
			13: Data_out = I13;
         14: Data_out = I14;
         15: Data_out = I15;
			16: Data_out = I16;
         17: Data_out = I17;
         18: Data_out = I18;
			19: Data_out = I19;
         20: Data_out = I20;
			21: Data_out = I21;
         22: Data_out = I22;
			23: Data_out = I23;
         24: Data_out = I24;
         25: Data_out = I25;
			26: Data_out = I26;
         27: Data_out = I27;
         28: Data_out = I28;
			29: Data_out = I29;
         30: Data_out = I30;
			31: Data_out = I31;
			endcase
		end
endmodule
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
