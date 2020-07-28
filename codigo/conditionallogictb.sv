module conditionallogictb();

logic clk, rst, PCS, RegW, MemW;
logic [1:0] FlagW;
logic [3:0] Cond, ALUFlags;
logic PCSrc, RegWrite, MemWrite;

Conditional_Logic DUT(clk, rst, PCS, RegW, MemW, FlagW, Cond, ALUFlags,
		                PCSrc, RegWrite, MemWrite);
							 
initial begin

rst = 0;
clk = 0;
#10;
rst = 1;
#10;
rst = 0;
PCS = 0;
RegW = 0;
MemW = 0;

FlagW = 2'b11;
Cond = 4'b0000;
ALUFlags = 4'b0100;
#10;
PCS = 1;
MemW = 1;
#10;


end

always 
	#5 clk = !clk;

endmodule 