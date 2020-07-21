module srl_n_sv #(parameter N=3)
				     (input logic[N-1:0] A, B,
				      output logic[N-1:0] C);
						
	assign C = A >> B;
	
endmodule 