module alu_arithmetic_sv #(parameter N = 1)
								  (input  logic [N-1:0] A, B,
								   input  logic	  	   Cin,
									input  logic	  	   Bin,
								   output logic [N-1:0] S,
									output logic [N-1:0] D,
									output logic		   Cout,
									output logic		   Bout);
									
	
	full_adder_nb #(N) adder(A, B, Cin, S, Cout);
	full_subtractor_nb #(N) subtractor(A, B, Bin, D, Bout);	
									
endmodule 