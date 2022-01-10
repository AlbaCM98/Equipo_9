module Control_Unit
(


	input clk,reset,Zero,
	input [5:0] Op, Funct, 
	
	output PCWrite,
	output reg I_or_D, Mem_Write, IR_Write,
	output reg PC_Src, Reg_Write, Mem_to_Reg, Reg_Dst, ALUSrcA,
	output reg [1:0]ALUSrcB,
	output reg [2:0] ALU_Control 
   //output reg  GPIO_I

);
	
	parameter
				FETCH = 4'b0000,
				DECODE = 4'b0001,
				EXECUTION_I = 4'b0010,
				EXECUTION_R = 4'b0011,
				EXECUTION_B = 4'b0100,//
				EXECUTION_J = 4'b0101,//
				EXECUTION_Iori = 4'b0110,//SW
				WRITEBACK_I = 4'b0111,
				WRITEBACK_R = 4'b1000;
	
	
	reg [3:0] state, next_state;
	reg PC_Write, Branch;//
	
	assign PCWrite = PC_Write | (Branch & Zero);//
	
  
  always @ (posedge clk) begin
    if (!reset)
      	state <= FETCH;
    else 
         state <= next_state;
  end
	
	
always @(*) begin
	case (state) 
	FETCH:begin
	
				PC_Write= 1;
				I_or_D = 0;
				Mem_Write = 0;
				IR_Write = 1;
				Reg_Write =0;
				ALUSrcA = 0;
				ALUSrcB = 2'b01;
				ALU_Control  = 3'b000;
				PC_Src = 2'b00;
				Reg_Dst = 1'b0; 		//no
				Mem_to_Reg = 1'b0;	//no
				//GPIO_I = 1'b0;			//SW
			
		next_state = DECODE;
			end
			
	DECODE:begin
	
				PC_Write = 0;
				Mem_Write = 0;
				IR_Write = 0;//1
				Reg_Write =0;			
				I_or_D = 1'b0; 		//no
				Reg_Dst = 1'b0;		//no
				Mem_to_Reg = 1'b0;	//no
				ALUSrcA = 1'b1;		//no
				ALUSrcB = 2'b10;	//no
				ALU_Control  = 3'b000;//no	
				PC_Src = 2'b00;		//no
				
				//GPIO_I = 1'b0;	//SW
				
		
				if(Op == 6'b000000)
					next_state = EXECUTION_R;		
				else if (Op == 6'b000100)
					next_state = EXECUTION_B;		
				else if (Op == 6'b000010)
					next_state = EXECUTION_J;		
				else if (Op == 6'b001101)
					next_state = EXECUTION_Iori; 
				else
					next_state = EXECUTION_I;		
          end
		
	EXECUTION_I:begin
	
				ALUSrcA = 1;				
				ALUSrcB = 2'b10;		//
				ALU_Control= 3'b000;
				PC_Write = 0;				//no
				I_or_D = 1'b0;				//no
				Mem_Write = 0;				//no
				IR_Write = 0;				//no
				Reg_Dst = 1'b0;			//no
				Mem_to_Reg = 1'b0;		//no
				Reg_Write =0;				//no
				PC_Src = 2'b00;			//no
				
				//GPIO_I = 1'b0;	//SW
			next_state = WRITEBACK_I;
		  end
		  
		EXECUTION_R:  begin
			ALUSrcA = 1;
			ALUSrcB = 2'b00;
			ALU_Control= 3'b000; 
		
			PC_Write = 0;				//no
			I_or_D = 1'b0;				//no
			Mem_Write = 0;				//no
			IR_Write = 0;				//no
			Reg_Dst = 1'b0;			//no
			Mem_to_Reg = 1'b0;		//no
			Reg_Write =0;				//no		
			PC_Src = 2'b00;			//no
			
			//GPIO_I = 1'b0;	//SW
		next_state = WRITEBACK_R;
		end
		
		EXECUTION_B:  begin
			ALUSrcA = 1;
			ALUSrcB = 2'b00;
			ALU_Control= 3'b110; //a-b
			PC_Src = 2'b01;				
			Branch = 1;
			//GPIO_I = 1'b0;//SW			
			
			
		next_state = FETCH;
		end
		
		EXECUTION_J:begin

			PC_Src = 2'b10;	
			PC_Write = 1;
			//GPIO_I = 1'b0;	//SW			
			
			
		next_state = FETCH;
		end
		
		EXECUTION_Iori:begin
				
				Reg_Dst = 1'b0;			//1
				Mem_to_Reg = 1'b0;		//10
				Reg_Write =0;				//1
				
				PC_Write = 0; 
				I_or_D = 1'b0; 
				Mem_Write = 0; 
				IR_Write = 0; 
				ALUSrcA = 1;
				ALUSrcB = 2'b10;
				ALU_Control= 3'b010;
				PC_Src = 2'b00; 
				//GPIO_I = 1'b1;	//SW
			next_state = WRITEBACK_I;
		  end
		  


	WRITEBACK_I:begin
	         Reg_Dst = 0;//1	
            Mem_to_Reg = 0;
            Reg_Write = 1;
				
				PC_Write = 0;				//no
				I_or_D = 1'b0;				//no
				Mem_Write = 0;				//no
				IR_Write = 0;				//no
				ALUSrcA = 1'b1;			//no
				ALUSrcB = 2'b00;		//no
				ALU_Control= 3'b010;		//no
				PC_Src = 2'b00;			//no
				//GPIO_I = 1'b0;	//SW
				
			next_state = FETCH;
			end
	
	
	WRITEBACK_R: begin
	
				Reg_Dst = 1;			//0	
            Mem_to_Reg = 0;
            Reg_Write = 1;
				
				PC_Write = 0;				//no
				I_or_D = 1'b0;				//no
				Mem_Write = 0;				//no
				IR_Write = 0;				//no				
				ALUSrcA = 1'b1;			//no
				ALUSrcB = 2'b00;		//no
				ALU_Control= 3'b010;		//no
				PC_Src = 2'b00;			//no
				
				//GPIO_I = 1'b0;	//			
			next_state = FETCH;
			end

		endcase 
	end
	
endmodule 
