module full_subtractor_nb #(parameter n = 4)
									(input logic  [n-1:0] a, b,
									 input logic          bin,
									 output logic [n-1:0] d,
									 output logic         bout);

	logic [n-1:0] w;
		  
	assign w[0] = bin;

	genvar i;
	generate
		for(i = 0; i < n-1; i++)
			begin : generate_subtractor
				full_subtractor_1b subtractor(a[i], b[i], w[i], d[i], w[i+1]);
			end	
	endgenerate

	full_subtractor_1b subtractor(a[n-1], b[n-1], w[n-1], d[n-1], bout);
	  
endmodule 