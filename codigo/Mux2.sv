module Mux2 #(N=2) (input  logic S,
						  input  logic [N-1:0] D0, D1,
						  output logic [N-1:0] Y);
						  
assign Y = S ? D1 : D0;

endmodule 