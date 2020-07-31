module ALU #(parameter N = 32)
				   (input logic [N-1:0] A, B,
				    input logic [3:0] ALUControl,
				    output logic [N-1:0] result,
				    output logic [3:0] flags);
				 
	logic [N-1:0] W0, W1, W2, W3, W4, W5, W6, W7, W8, W9;
	logic 		  Cout, Bout;

	alu_arithmetic_sv #(N) aluarithmetic (A, B, 1'b0, 1'b0, W0, W1, Cout, Bout);

	alu_logic_sv  #(N) alulogic (A, B, W2, W3, W4, W5, W6);

	alu_shifts_sv  #(N) alushifts (A, B, W7, W8, W9);

	mux11_1_sv #(N) muxcontrol (W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, ALUControl, result);
	
	alu_flags_sv #(N) alubanderas (ALUControl, A[N-1], B[N-1], Cout, Bout, W0, W1, flags);

endmodule 
				