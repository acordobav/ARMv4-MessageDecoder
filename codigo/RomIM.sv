module RomIM(input logic [5:0] Addr,
		       output logic [31:0] q);

	logic [31:0] ROM[63:0];
	
	integer i;
	initial begin
		for (i=0; i<64; i++) begin
			ROM[i] = 0;
		
		end
		$readmemh("./InstructionMemory.dat",ROM);
	end
	
	assign q = ROM[Addr];
				 
endmodule