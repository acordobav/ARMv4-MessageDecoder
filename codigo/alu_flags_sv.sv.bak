module alu_flags_sv #(parameter W = 1)
							(input  logic [3:0]   ALUControl,
							 input  logic 			 A, B, Cout, Bout,
							 input  logic [W-1:0] S, D,
							 output logic [3:0]   flags);
							 
	logic [W-1:0] result;
	logic			  carryout;
	logic         N, Z, C, V;
	
	always_comb begin
		case(ALUControl)
			4'b0000: begin result = S; carryout = Cout; end
			4'b0001: begin result = D; carryout = Bout; end
			default: begin result = 1; carryout = 0; end
		endcase
	end
	
	v_flag_detector 		v_flag (ALUControl, A, B, result[W-1], V);
	c_flag_detector 		c_flag (ALUControl, carryout, C);
	z_flag_detector #(W) z_flag (result, Z);
	n_flag_detector 		n_flag (result[W-1], N);

	assign flags = {N, Z, C, V};
	
endmodule 