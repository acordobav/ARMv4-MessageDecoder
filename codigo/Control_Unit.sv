module Control_Unit(input logic clk, rst,
						  input logic [3:0] Rd,
						  input logic [1:0] Op, sh,
						  input logic [5:0] Funct,
						  input logic [3:0] Cond, ALUFlags,
						  output logic MemtoReg, ALUSrc,
						  output logic [1:0] ImmSrc, 
						  output logic [2:0] RegSrc,
						  output logic [3:0] ALUControl,
						  output logic PCSrc, RegWrite, MemWrite);

	logic [1:0] FlagW;
	logic PCS, RegW, MemW;
	
	Decoder CONTROLDECODER(Rd, Op, sh, Funct, PCS, RegW, MemW, MemtoReg,
								  ALUSrc, ImmSrc, FlagW, RegSrc, ALUControl);
								  
	Conditional_Logic CLOGIC(clk, rst, PCS, RegW, MemW, FlagW, Cond,
									 ALUFlags, PCSrc, RegWrite, MemWrite);
						  
						  
endmodule 