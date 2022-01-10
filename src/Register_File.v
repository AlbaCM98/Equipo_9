//MIGULE BENAVIDES
//Register File


module Register_File
#(
	parameter N = 32
)
(
	input clk, reset, Reg_write_in,
	
	input [4:0] Write_Register_1, Read_Register_1, Read_Register_2,
	input [N-1:0] Write_Data,
	output wire [N-1:0] Read_Data_1, Read_Data_2

);

wire [32 * N - 1: 0] q;
wire [32:0] t; //out, out2;

	

Pri_deco decoprioridad(.Wregister(Write_Register_1), .out(t));

Register zero (.D(Write_Data), .clk(clk), .rst(reset), .en(Reg_write_in & t[0]), .Q(q[N-1:0]));
Register at (.D(Write_Data), .clk(clk), .rst(reset), .en(Reg_write_in & t[1]), .Q(q[2*N-1:1*N]));
Register v0 (.D(Write_Data), .clk(clk), .rst(reset), .en(Reg_write_in & t[2]), .Q(q[3*N-1:2*N]));
Register v1 (.D(Write_Data), .clk(clk), .rst(reset), .en(Reg_write_in & t[3]), .Q(q[4*N-1:3*N]));
Register a0 (.D(Write_Data), .clk(clk), .rst(reset), .en(Reg_write_in & t[4]), .Q(q[5*N-1:4*N]));
Register a1 (.D(Write_Data), .clk(clk), .rst(reset), .en(Reg_write_in & t[5]), .Q(q[6*N-1:5*N]));
Register a2 (.D(Write_Data), .clk(clk), .rst(reset), .en(Reg_write_in & t[6]), .Q(q[7*N-1:6*N]));
Register a3 (.D(Write_Data), .clk(clk), .rst(reset), .en(Reg_write_in & t[7]), .Q(q[8*N-1:7*N]));
Register t0 (.D(Write_Data), .clk(clk), .rst(reset), .en(Reg_write_in & t[8]), .Q(q[9*N-1:8*N]));
Register t1 (.D(Write_Data), .clk(clk), .rst(reset), .en(Reg_write_in & t[9]), .Q(q[10*N-1:9*N]));
Register t2 (.D(Write_Data), .clk(clk), .rst(reset), .en(Reg_write_in & t[10]), .Q(q[11*N-1:10*N]));
Register t3 (.D(Write_Data), .clk(clk), .rst(reset), .en(Reg_write_in & t[11]), .Q(q[12*N-1:11*N]));
Register t4 (.D(Write_Data), .clk(clk), .rst(reset), .en(Reg_write_in & t[12]), .Q(q[13*N-1:12*N]));
Register t5 (.D(Write_Data), .clk(clk), .rst(reset), .en(Reg_write_in & t[13]), .Q(q[14*N-1:13*N]));
Register t6 (.D(Write_Data), .clk(clk), .rst(reset), .en(Reg_write_in & t[14]), .Q(q[15*N-1:14*N]));
Register t7 (.D(Write_Data), .clk(clk), .rst(reset), .en(Reg_write_in & t[15]), .Q(q[16*N-1:15*N]));
Register s0 (.D(Write_Data), .clk(clk), .rst(reset), .en(Reg_write_in & t[16]), .Q(q[17*N-1:16*N]));
Register s1 (.D(Write_Data), .clk(clk), .rst(reset), .en(Reg_write_in & t[17]), .Q(q[18*N-1:17*N]));
Register s2 (.D(Write_Data), .clk(clk), .rst(reset), .en(Reg_write_in & t[18]), .Q(q[19*N-1:18*N]));
Register s3 (.D(Write_Data), .clk(clk), .rst(reset), .en(Reg_write_in & t[19]), .Q(q[20*N-1:19*N]));
Register s4 (.D(Write_Data), .clk(clk), .rst(reset), .en(Reg_write_in & t[20]), .Q(q[21*N-1:20*N]));
Register s5 (.D(Write_Data), .clk(clk), .rst(reset), .en(Reg_write_in & t[21]), .Q(q[22*N-1:21*N]));
Register s6 (.D(Write_Data), .clk(clk), .rst(reset), .en(Reg_write_in & t[22]), .Q(q[23*N-1:22*N]));
Register s7 (.D(Write_Data), .clk(clk), .rst(reset), .en(Reg_write_in & t[23]), .Q(q[24*N-1:23*N]));
Register t8 (.D(Write_Data), .clk(clk), .rst(reset), .en(Reg_write_in & t[24]), .Q(q[25*N-1:24*N]));
Register t9 (.D(Write_Data), .clk(clk), .rst(reset), .en(Reg_write_in & t[25]), .Q(q[26*N-1:25*N]));
Register k0 (.D(Write_Data), .clk(clk), .rst(reset), .en(Reg_write_in & t[26]), .Q(q[27*N-1:26*N]));
Register k1 (.D(Write_Data), .clk(clk), .rst(reset), .en(Reg_write_in & t[27]), .Q(q[28*N-1:27*N]));
Register gp (.D(Write_Data), .clk(clk), .rst(reset), .en(Reg_write_in & t[28]), .Q(q[29*N-1:28*N]));
Register sp (.D(Write_Data), .clk(clk), .rst(reset), .en(Reg_write_in & t[29]), .Q(q[30*N-1:29*N]));
Register fp (.D(Write_Data), .clk(clk), .rst(reset), .en(Reg_write_in & t[30]), .Q(q[31*N-1:30*N]));
Register ra (.D(Write_Data), .clk(clk), .rst(reset), .en(Reg_write_in & t[31]), .Q(q[32*N-1:31*N]));

Mux32to1 MUX1 (.I0(q[N-1:0]),
					.I1(q[2*N-1:1*N]),
					.I2(q[3*N-1:2*N]),
					.I3(q[4*N-1:3*N]),
					.I4(q[5*N-1:4*N]),
					.I5(q[6*N-1:5*N]),
					.I6(q[7*N-1:6*N]),
					.I7(q[8*N-1:7*N]),
					.I8(q[9*N-1:8*N]),
					.I9(q[10*N-1:9*N]),
					.I10(q[11*N-1:10*N]),
					.I11(q[12*N-1:11*N]),
					.I12(q[13*N-1:12*N]),
					.I13(q[14*N-1:12*N]),
					.I14(q[15*N-1:14*N]),
					.I15(q[16*N-1:15*N]),
					.I16(q[17*N-1:16*N]),
					.I17(q[18*N-1:17*N]),
					.I18(q[19*N-1:18*N]),
					.I19(q[20*N-1:19*N]),
					.I20(q[21*N-1:20*N]),
					.I21(q[22*N-1:21*N]),
					.I22(q[23*N-1:22*N]),
					.I23(q[24*N-1:23*N]),
					.I24(q[25*N-1:24*N]),
					.I25(q[26*N-1:25*N]),
					.I26(q[27*N-1:26*N]),
					.I27(q[28*N-1:27*N]),
					.I28(q[29*N-1:28*N]),
					.I29(q[30*N-1:29*N]),
					.I30(q[31*N-1:30*N]),
					.I31(q[32*N-1:31*N]),
					.Sel(Read_Register_1), 
					.Data_out(Read_Data_1));
					
Mux32to1 MUX2 (.I0(q[N-1:0]),
					.I1(q[2*N-1:1*N]),
					.I2(q[3*N-1:2*N]),
					.I3(q[4*N-1:3*N]),
					.I4(q[5*N-1:4*N]),
					.I5(q[6*N-1:5*N]),
					.I6(q[7*N-1:6*N]),
					.I7(q[8*N-1:7*N]),
					.I8(q[9*N-1:8*N]),
					.I9(q[10*N-1:9*N]),
					.I10(q[11*N-1:10*N]),
					.I11(q[12*N-1:11*N]),
					.I12(q[13*N-1:12*N]),
					.I13(q[14*N-1:12*N]),
					.I14(q[15*N-1:14*N]),
					.I15(q[16*N-1:15*N]),
					.I16(q[17*N-1:16*N]),
					.I17(q[18*N-1:17*N]),
					.I18(q[19*N-1:18*N]),
					.I19(q[20*N-1:19*N]),
					.I20(q[21*N-1:20*N]),
					.I21(q[22*N-1:21*N]),
					.I22(q[23*N-1:22*N]),
					.I23(q[24*N-1:23*N]),
					.I24(q[25*N-1:24*N]),
					.I25(q[26*N-1:25*N]),
					.I26(q[27*N-1:26*N]),
					.I27(q[28*N-1:27*N]),
					.I28(q[29*N-1:28*N]),
					.I29(q[30*N-1:29*N]),
					.I30(q[31*N-1:30*N]),
					.I31(q[32*N-1:31*N]),
					.Sel(Read_Register_2), 
					.Data_out(Read_Data_2));					

//Mux32to1 MUX2 (.I0(q[0]),.I1(q[1]),.I2(q[2]),.I3(q[3]),.I4(q[4]),.I5(q[5]),.I6(q[6]),.I7(q[7]),.I8(q[8]),.I9(q[9]),.I10(q[10]),
			 //.I11(q[11]),.I12(q[12]),.I13(q[13]),.I14(q[14]),.I15(q[15]),.I16(q[16]),.I17(q[17]),.I18(q[18]),.I19(q[19]),.I20(q[20]),
			 //.I21(q[21]),.I22(q[22]),.I23(q[23]),.I24(q[24]),.I25(q[25]),.I26(q[26]),.I27(q[27]),.I28(q[28]),.I29(q[29]),.I30(q[30]),
          //.I31(q[31]),.Sel(Read_Register_2), .Data_out(Read_Data_2));
			 
//assign Read_Data_1 = out;
//assign Read_Data_2 = out2;			 


endmodule 