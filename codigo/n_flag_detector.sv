module n_flag_detector (input  logic result_msb,
								output logic flag);

	logic n;
	assign n = result_msb;
	assign flag = n;								
				
endmodule 