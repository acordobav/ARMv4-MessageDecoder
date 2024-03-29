module Decoder(input  logic [3:0] Rd,
					input  logic [1:0] Op, sh,
					input  logic [5:0] Funct,
					output logic PCS, RegW, MemW, MemtoReg, ALUSrc,
					output logic [1:0] ImmSrc, FlagW,
					output logic [2:0] RegSrc,
					output logic [3:0] ALUControl);

	logic Branch, ALUOp;
	
	Main_Decoder MAINDECODER(Op, Funct[5], Funct[0], Funct[4:1], Branch, RegW, MemW,
									 MemtoReg, ALUSrc, ALUOp, ImmSrc, RegSrc);
	
	ALU_Decoder	ALUDECODER(ALUOp, Funct, sh, ALUControl, FlagW);
	
	PC_Logic PCLOGIC(Rd, Branch, RegW, PCS);
					
endmodule 