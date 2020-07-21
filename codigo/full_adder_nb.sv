module full_adder_nb #(parameter n = 4)
							 (input  logic [n-1:0] a, b,
							  input  logic  		  cin,
							  output logic [n-1:0] s,
							  output logic 		  cout);
	  
	logic [n-1:0] w;
		  
	assign w[0] = cin;

	genvar i;
	generate
		for(i = 0; i < n-1; i++)
			begin : generate_adder
				full_adder_1b adder(a[i], b[i], w[i], s[i], w[i+1]);
			end	
	endgenerate

	full_adder_1b adder(a[n-1], b[n-1], w[n-1], s[n-1], cout);
		  
endmodule 