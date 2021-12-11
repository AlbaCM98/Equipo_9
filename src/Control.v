/Control Unit MIPS multicycle

module Control_unit (
input clk,reset,
input [5:0] OP, Funct, 
output IorD, MemWrite, IRWrite,
output PCWrite, PCSrc, RegWrite, MemtoReg, RegDst, ALUSrcA,
output [1:0]ALUSrcB,
output reg [2:0] ALUControl 
//output branch
);

wire R, I;
wire J;
reg funct; 
reg [3:0] state, nextstate;

//assign [0]OP = R;
//assign [1]OP = I;
//assign [2]OP = J;
	parameter FETCH = 4'b0000;
	parameter DECODE = 4'b0001;
	parameter MEMADRCOMP = 4'b0010;
	parameter MEMACCESSL = 4'b0011;//L1
	parameter MEMREADEND = 4'b0100;//L2
	parameter MEMACCESSS = 4'b0101;//S
	parameter EXECUTION = 4'b0110;
	parameter WRITEBACK = 4'b0111;

	localparam add = 20;//revisar
	localparam jr = 8;
	localparam andd 24;
	localparam orr 25;

//localparam addi = 8;

 always@(posedge clk)
    if (reset)
		state <= FETCH;
    else
		state <= nextstate;


	always@(state or OP) begin
      	case (state)
        FETCH:  nextstate = DECODE;
        DECODE:  case(OP)
					//OpCode
                   6'b100011:	nextstate = MEMADRCOMP;//lw
                   6'b101011:	nextstate = MEMADRCOMP;//sw
                   6'b000000:	nextstate = EXECUTION;//r
                   6'b000100:	nextstate = BEQ;//beq
                   default: nextstate = FETCH;
                 endcase
        MEMADRCOMP:  case(OP)
                   6'b100011:      nextstate = MEMACCESSL;//lw
                   6'b101011:      nextstate = MEMACCESSS;//sw
                   default: nextstate = FETCH;
                 endcase
        MEMACCESSL:    nextstate = MEMREADEND;
        MEMREADEND:    nextstate = FETCH;
        MEMACCESSS:    nextstate = FETCH;
        EXECUTION: nextstate = WRITEBACK;
        WRITEBACK: nextstate = FETCH;
        BEQ:   nextstate = FETCH;
        default: nextstate = FETCH;
      endcase
    end




always @ (*) begin
	
	MemWrite = 1'b0;
	RegWrite = 1'b0;
	IorD = 1'b0; 
	IRWrite = 1'b0; 
	ALUSrcB = 2'b00;
	ALUSrcA = 1'b0;  
	RegDst = 1'b0; 
	PCWrite = 1'b0;
	PCSrc = 1'b0;
	MemtoReg = 1'b0;
	ALUControl = 1'b0;
	
	
	case(state)
		
		FETCH:
          begin
            MemRead = 1'b1;
            IRWrite = 1'b1;
            ALUSrcB = 2'b01;
            PCWrite = 1'b1;
          end
        DECODE:
				ALUSrcB = 2'b11;
        MEMADRCOMP:
          begin
            ALUSrcA = 1'b1;
            ALUSrcB = 2'b10;
          end
        MEMACCESSL:
          begin
            MemRead = 1'b1;
            IorD    = 1'b1;
          end
        MEMREADEND:
          begin
            RegWrite = 1'b1;
	         MemtoReg = 1'b1;
            RegDst = 1'b0;
          end
        MEMACCESSS://
          begin
            MemWrite = 1'b1;
            IorD     = 1'b1;
          end
        EXECUTION:
          begin
            ALUSrcA = 1'b1;
				ALUSrcB = 1'b00;
            //ALUOp   = 2'b10;
				//ALUControl
          end
		  WRITEBACK:
          begin
            //RegDst   = 1'b1;
				MemtoReg = 1'b1;
            RegWrite = 1'b1;
          end
        BEQ:
          begin
            ALUSrcA = 1'b1;
				ALUSrcB = 1'b1;
            //ALUOp   = 2'b01;
            //PCWriteCond = 1'b1;
				PCSrc = 2'b01;
          end
      endcase
    end
			
	
	
//ALUCONTROL////////////////////////////	
	case(OP)
	
		6'b000000: begin
			case(funct)
	
			add: AluControl <= 3'b000;// R[rd]=R[rs]+R[rt]
			andd: AluControl <= 3'b001;//and
			orr: AluControl <= 3'b010;//or
			//jr: AluControl <= 3'b000;//jr
			
			endcase
	    end
		6'b001000: begin//addi
			
			AluControl <= 3'b000; //R[rt]=R[rs]+SignExtImm
			end
		
		6'b001010: begin //slti - R[rt] = (R[rs] < SignExtImm)? 1 : 0
	
			AluControl <= 3'b100;
			
			end
			
		6'b101011: begin 	//SW M[R[rs]+SignExtImm] = R[rt]
		
			AluControl <= 3'b000;
			
			end
			
//		6'b000100: begin	//BEQ if(R[rs]==R[rt]) PC=PC+4+BranchAddr
//			AluControl <= 3'b000;
//			end
			
				
		endcase
	
	endcase
end
 //assign funct = Funct;
endmodule
///////////////////////////////////////////////////////////////


