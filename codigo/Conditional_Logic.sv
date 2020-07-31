module Conditional_Logic(input logic clk, rst, PCS, RegW, MemW,
								 input logic [1:0] FlagW,
								 input logic [3:0] Cond, ALUFlags,
								 output logic PCSrc, RegWrite, MemWrite);
	
	logic CondEx;
	logic [1:0] FlagWrite;
	logic [3:0] Flags;

	logic N, Z, C, V;
	assign N = Flags[3];
	assign Z = Flags[2];
	assign C = Flags[1];
	assign V = Flags[0];
	
	always_comb begin
		case(Cond)
			4'b0000: CondEx = Z; 
			4'b0001: CondEx = ~Z;
			4'b0010: CondEx = C;
			4'b0011: CondEx = ~C;
			4'b0100: CondEx = N;
			4'b0101: CondEx = ~N;
			4'b0110: CondEx = V;
			4'b0111: CondEx = ~V;
			4'b1000: CondEx = ~Z & C;
			4'b1001: CondEx = Z | ~C;
			4'b1010: CondEx = ~(N ^ V);
			4'b1011: CondEx = N ^ V;
			4'b1100: CondEx = ~Z & ~(N ^ V);
			4'b1101: CondEx = Z | (N ^ V);
			4'b1110: CondEx = 1'b1;
			default: CondEx = 1'bx;
		endcase
	end
	
	assign FlagWrite = FlagW & {2{CondEx}};
	
	Register #(2) REGISTER1(clk, rst, FlagWrite[1], ALUFlags[3:2], Flags[3:2]);
	Register #(2) REGISTER2(clk, rst, FlagWrite[0], ALUFlags[1:0], Flags[1:0]);
	
	
	assign PCSrc = PCS & CondEx;
	assign RegWrite = RegW & CondEx;
	assign MemWrite = MemW & CondEx;
	
								 
endmodule 