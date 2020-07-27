module Cond_Check(input logic [3:0] Cond,
						input logic [3:0] Flags,
						output logic CondEx);
	
	logic N, Z, C, V;
	assign N = Flags[3];
	assign Z = Flags[2];
	assign C = Flags[1];
	assign V = Flags[0];
	
	always_comb begin
		case(Cond)
			4'b0000: CondEx = Z;					//EQ 
			4'b0001: CondEx = ~Z;				//NE
			4'b0010: CondEx = C;             //CS
			4'b0011: CondEx = ~C;            //CC
			4'b0100: CondEx = N;					//MI
			4'b0101: CondEx = ~N;				//PL
			4'b0110: CondEx = V;             //VS
			4'b0111: CondEx = ~V;				//VC
			4'b1000: CondEx = ~Z & C;			//HI
			4'b1001: CondEx = Z | ~C;			//LS
			4'b1010: CondEx = ~(N ^ V);		//GE
			4'b1011: CondEx = N ^ V;         //LT
			4'b1100: CondEx = ~Z & ~(N ^ V); //GT
			4'b1101: CondEx = Z | (N ^ V);   //LE
			4'b1110: CondEx = 1'b1;				//Always
			default: CondEx = 1'bx;
		endcase
	end
						
endmodule 