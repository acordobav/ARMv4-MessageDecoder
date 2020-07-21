module z_flag_detector #(parameter N = 4)
								(input  logic [N-1:0] result, 
								 output logic         flag);

	logic value;
			  
	always_comb begin
		if (result == 0) value <= 1;
		else value <= 0;
	end

	assign flag = value;

endmodule 