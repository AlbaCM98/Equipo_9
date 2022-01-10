//1 second counter

module Counter1s
	(
		input mclk, reset,
		output reg SEGUNDO
		//output integer conteo,

  	);
			
  localparam CUENTA= 25000000; 
  integer conteo;			
  wire w1; 					 
  
  always@ (negedge reset, posedge mclk)
	begin
	   if (reset == 1'b0 ) conteo <= 0;		
	   else
				if (conteo == CUENTA) conteo <=0; 
				else conteo <= conteo + 1;			
		end
	assign w1 = (conteo == CUENTA) ? 1'b1 : 1'b0 ; 
	
	
	always@(negedge reset, posedge mclk)
	begin
		if(reset == 1'b0) SEGUNDO <= 1'b0;	
		else 
			if (w1) SEGUNDO <= ~(SEGUNDO); 
			else    SEGUNDO <= SEGUNDO;		
	end
	
	//assign RCO = w1;  // Ripple Carry Output
	
	endmodule
	