module Chipset (input logic MemWrite,
					 input logic [10:0] Addr,
					 output logic WRA, S);
					 
	logic [1:0] OUT;
					
	always_comb	begin		
		if (MemWrite) begin
			if (Addr <= 11'h7F) OUT = 2'b00;
			else OUT = 2'b11;
		end else begin
			if (Addr <= 11'h7F) OUT = 2'b00;
			else OUT = 2'b01;
		end
	end
	
	assign WRA = OUT[1];
	assign S = OUT[0];
					 		 			 
endmodule 