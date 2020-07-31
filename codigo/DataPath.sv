module DataPath #(parameter N=13) (input  logic clk, rst, PCSrc, MemtoReg, ALUSrc, RegWrite, 
					                    input  logic [3:0]  ALUControl,
											  input  logic [1:0]  ImmSrc, 
											  input  logic [2:0]  RegSrc,
											  input  logic [23:0] Instr,
											  input  logic [31:0] ReadData,
					                    output logic [3:0]  ALUFlags,
											  output logic [N-1:0] AddrIM,
											  output logic [31:0] WriteData, Addr);

// Conexiones internas
logic [31:0] Result, RD1, RD2, ExtImm, SrcB, ALUResult;
logic cout1, cout2;
logic [3:0] RA1, RA2;

//Conexiones memoria de instrucciones
logic [N-1:0] PC = 0;
logic [N-1:0] PCPlus4, PC1, PCPlus8;

Mux2 #(N) PCSrcMux(PCSrc, PCPlus4, Result, PC1);
PC_Register PCReg(clk, rst, 1'b1, PC1, PC);
full_adder_nb #(N) PCAdder1(PC, 13'd1, 1'b0, PCPlus4, cout1); 
full_adder_nb #(N) PCAdder2(PCPlus4, 13'd1, 1'b0, PCPlus8, cout2);
Mux4 #(4) RegSrcMux0(RegSrc[1:0], Instr[19:16], 4'b1111, Instr[11:8], 0, RA1);
Mux2 #(4) RegSrcMux1(RegSrc[2], Instr[3:0], Instr[15:12], RA2);
RegisterFile #(32) RegFile(clk, rst, RegWrite, RA1, RA2, Instr[15:12], Result, PCPlus8, RD1, RD2);
Extend Ext(ImmSrc, Instr[23:0], ExtImm);
Mux2 #(32) SrcBMux(ALUSrc, RD2, ExtImm, SrcB);
ALU #(32) Alu(RD1, SrcB, ALUControl, ALUResult, ALUFlags);
Mux2 #(32) MemtoRegMux(MemtoReg, ALUResult, ReadData, Result);

assign AddrIM = PC; // Address memoria de instrucciones
assign WriteData = RD2;
assign Addr = ALUResult;

endmodule  