module DataPath (input logic         clk, rst,
					  input logic  [12:0]  Control,
					  output logic [19:0] InstrControl,
					  output logic [3:0]  ALUFlags);

// Senales de control
logic [1:0] ImmSrc;
logic [2:0] RegSrc;
logic [3:0] ALUControl;
logic PCSrc, MemtoReg, MemWrite, ALUSrc, RegWrite;

assign PCSrc = Control[12];
assign MemtoReg = Control[11];
assign MemWrite = Control [10];
assign ALUControl = Control[9:6];
assign ALUSrc = Control[5];
assign ImmScr = Control[4:3];
assign RegWrite = Control[2];
assign RegSrc = Control[1:0];

// Conexiones internas
logic [31:0] Result, Instr, RD1, RD2, ExtImm, SrcB, ALUResult, ReadData;
logic cout1, cout2;
logic [3:0] RA1, RA2;

//Conexiones memoria de instrucciones
logic [12:0] PC = 0;
logic [12:0] PCPlus4, PC1, PCPlus8;


Mux2 #(13) PCSrcMux(PCSrc, PCPlus4, Result, PC1);
Register #(13) PCReg(clk, rst, 1'b1, PC1, PC);
full_adder_nb #(13) PCAdder1(PC, 3'b100, 1'b0, PCPlus4, cout1); 
full_adder_nb #(13) PCAdder2(PCPlus4, 3'b100, 1'b0, PCPlus8, cout2);
Rom InstructionMemory(PC, clk, Instr);
Mux2 #(4) RegSrcMux0(RegSrc[0], Instr[19:16], 4'b1111, RA1);
Mux2 #(4) RegSrcMux1(RegSrc[1], Instr[3:0], Instr[15:12], RA2);
RegisterFile #(32) RegFile(clk, rst, RegWrite, RA1, RA2, Instr[15:12], Result, PCPlus8, RD1, RD2);
Mux2 #(32) SrcBMux(ALUSrc, RD2, ExtImm, SrcB);
ALU #(32) Alu(RD1, SrcB, ALUControl, ALUResult, ALUFlags);
ram DataMemory(ALUResult, clk, RD2, MemWrite, ReadData);
Mux2 MemtoRegMux(MemtoReg, ALUResult, ReadData, Result);

assign InstrControl = Instr[31:12];

endmodule 