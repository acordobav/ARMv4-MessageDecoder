module full_adder_1b(input logic a, b, cin,
							output logic s, cout);
							
	logic w1, w2, w3;
					
	always_comb begin
		w1 = a ^ b;
		w2 = w1 & cin;
		w3 = a & b; 			
		
	end
				
	assign s = w1 ^ cin;
	assign cout = w2 | w3; 	
			
endmodule						
							
							