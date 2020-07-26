module Main_Decoder(input  logic[1:0] Op,
						  input  logic Funct5, Funct0,
						  output logic Branch, RegW, MemW, MemtoReg,
											ALUSrc, ALUOp,
						  output logic [1:0] ImmSrc, RegSrc);
						  
	logic [3:0] IN;
	assign IN = {Op[1], Op[0], Funct5, Funct0};
	
	logic [9:0] OUT;
	
	always_comb begin
		casez(IN)
			4'b000Z: OUT = 10'b0000ZZ1001;//DP Reg
			4'b001Z: OUT = 10'b0001001Z01;//Dp Imm
			4'b01Z0: OUT = 10'b0X11010100;//STR
			4'b01Z1: OUT = 10'b0101011Z00;//LDR
			4'b10ZZ: OUT = 10'b1001100Z10;//B
			default: OUT = 10'bX;
		endcase
	end
						  
	assign Branch = OUT[9];
	assign MemtoReg = OUT[8];
	assign MemW = OUT[7];
	assign ALUSrc = OUT[6];
	assign ImmSrc = OUT[5:4];
	assign RegW = OUT[3];
	assign RegSrc = OUT[2:1];
	assign ALUOp = OUT[0];
				  
endmodule	