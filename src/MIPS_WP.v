
module MIPS_WP(

	input   MAX10_CLK1_50;
	input   [9:0]SW;
	output  [7:0] LEDR;
);
	
	wire mclk = MAX10_CLK1_50;
	wire clk;
	wire Rst = SW[9];
	wire [7:0] gpio_o = LEDR;
	assign LEDR = gpio;
																	
	Counter1s Seconds (
	
		.mclk(mclk), 
		.reset(Rst), 
		.SEGUNDO(clk));  
	
	
	MIPS mips(
	
		.clk_m(clk),
		.reset_m(Rst),
		.GPIO_m(gpio)
	);
	
endmodule
