module alu_logic_sv #(parameter N = 1)
							(input  logic [N-1:0] A, B,
							 output logic [N-1:0] X2, X3, X4, X5, X6);		 

	and_n_sv #(N) U1 (A, B, X2);
	or_n_sv  #(N) U2 (A, B, X3);
	xor_n_sv #(N) U3 (A, B, X4);
	not_n_sv #(N) U4 (A, X5);
	not_n_sv #(N) U5 (B, X6);
							 							 
endmodule 