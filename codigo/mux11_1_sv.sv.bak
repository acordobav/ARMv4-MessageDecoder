module mux11_1_sv #(parameter N = 1)
						 (input  logic [N-1:0] A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, 
						  input  logic [3:0] S,
						  output logic [N-1:0] X);
	always_comb begin
		case(S)
			4'b0000: X = A0;
			4'b0001: X = A1;
			4'b0010: X = A2;
			4'b0011: X = A3;
			4'b0100: X = A4;
			4'b0101: X = A5;
			4'b0110: X = A6;
			4'b0111: X = A7;
			4'b1000: X = A8;
		   4'b1001: X = A9;
			default: X = 0;
		endcase
	end
			
endmodule 