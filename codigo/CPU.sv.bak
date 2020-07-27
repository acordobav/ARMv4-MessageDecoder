module CPU(input  logic clk, rst,
			  input  logic [31:0] Instr, ReadData,
           output logic [31:0] PC, WriteData, Addr, 
			  output logic MemWrite);
			  
localparam N = 13; // Dimension del bus de datos de la memoria ROM, RAM
logic PCSrc, MemtoReg, ALUSrc, RegWrite;
logic [3:0] ALUControl, ALUFlags;
logic [1:0] ImmSrc, RegSrc;
			  
DataPath #(N) DP(clk, rst, PCSrc, MemtoReg, ALUSrc, RegWrite, ALUControl, 
                 ImmSrc, RegSrc, Instr[23:0], ReadData, ALUFlags, PC, WriteData, Addr);
			  
endmodule 