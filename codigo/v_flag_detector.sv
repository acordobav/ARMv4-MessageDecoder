module v_flag_detector(input  logic [3:0] alucontrol,
							  input  logic a_msb, b_msb, result_msb,
							  output logic flag);

	logic w1, w2, w3;

	assign w1 = ~(alucontrol[0] ^ a_msb ^ b_msb);
	assign w2 = result_msb ^ a_msb;
	assign w3 = ~alucontrol[3] & ~alucontrol[2] & ~alucontrol[1];

	assign flag = w1 && w2 && w3;
				  
endmodule				  
							  