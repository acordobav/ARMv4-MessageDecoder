module RomEM(input logic [6:0] Addr,
		       output logic [31:0] q);

	logic [31:0] ROM[127:0];
	
	integer i;
	initial begin
		for (i=0; i<128; i++) begin
			ROM[i] = 0;
		
		end
		$readmemh("./xor.dat",ROM);
	end
	
	assign q = ROM[Addr];
				 
endmodule
