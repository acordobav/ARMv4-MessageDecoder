module BarrelShifter (input logic[7:0] in, 
                      input logic [3:0] rot, 
							 output logic [7:0] out);
logic[7:0] w;

always_comb begin
	casex(rot)
		4'b?000: w = in;                  // No rotar
		4'b?001: w = {in[0],  in[7:1]};   // Rotacion 1 vez
		4'b?010: w = {in[1:0],in[7:2]};   // Rotacion 2 veces
		4'b?011: w = {in[2:0],in[7:3]};   // Rotacion 3 veces
		4'b?100: w = {in[3:0],in[7:4]};   // Rotacion 4 veces
		4'b?101: w = {in[4:0],in[7:5]};   // Rotacion 5 veces
		4'b?110: w = {in[5:0],in[7:6]};   // Rotacion 6 veces
		4'b?111: w = {in[6:0],in[7]};     // Rotacion 7 veces
		default: w = 0;
	endcase
end

assign out = w;

endmodule 