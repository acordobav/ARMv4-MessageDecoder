module CPU(input  logic clk, rst,
			  input  logic [31:0] Instr, ReadData,
           output logic [31:0] PC, WriteData, Addr, 
			  output logic MemWrite);
			  
localparam N = 13; // Dimension del bus de datos de la memoria ROM, RAM
logic PCSrc, MemtoReg, ALUSrc, RegWrite;
logic [3:0] ALUControl, ALUFlags;
logic [1:0] ImmSrc, RegSrc;

Control_Unit CU(clk, rst, Instr[15:12], Instr[27:26], Instr[6:5], Instr[25:20],
					 Instr[31:28], ALUFlags, MemtoReg, ALUSrc, ImmSrc, RegSrc, ALUControl,
					 PCSrc, RegWrite, MemWrite);
			  
DataPath #(N) DP(clk, rst, PCSrc, MemtoReg, ALUSrc, RegWrite, ALUControl, 
                 ImmSrc, RegSrc, Instr[23:0], ReadData, ALUFlags, PC, WriteData, Addr);
			  
endmodule 