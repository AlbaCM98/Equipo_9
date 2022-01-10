
module PC #(

      parameter N = 32
)
(
		input enable , clk, reset,
		input [N-1:0] PCin,
		output reg [N-1:0] PCout
);


always @(posedge clk or negedge reset) begin
		
		if(!reset)begin	
			PCout <= 32'h400000;
		end
		
		else if(enable) begin
			PCout <= PCin; 
		end


end 

endmodule 

