module sra_n_sv #(parameter N=3)
				     (input  logic signed[N-1:0] A,
					   input  logic [N-1:0] B,
				      output logic signed [N-1:0] C);
						
	assign C = A >>> B;
	
endmodule 