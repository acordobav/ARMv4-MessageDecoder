module alu_shifts_sv #(parameter N = 32)
							 (input  logic [N-1:0] A, B,
							  output logic [N-1:0] X7, X8, X9, X10);

	sl_n_sv  #(N) S1 (A, B, X7);
	srl_n_sv #(N) S2 (A, B, X8);
	sra_n_sv #(N) S3 (A, B, X9);
	BarrelShifterALU S4 (A[7:0], B[3:0], X10);
					 
endmodule 