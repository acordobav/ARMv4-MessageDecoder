module not_n_sv #(parameter N=3)
				     (input logic[N-1:0] A,
				      output logic[N-1:0] B);
						
	assign B = ~A;
	
endmodule 