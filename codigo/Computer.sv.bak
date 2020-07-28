module Computer(input logic clk, rst);

localparam N = 13;
logic [31:0] PC, Instr, ALUResult, WriteData, ReadData, Addr;
logic MemWrite;

Rom InstructionMemory(PC, clk, Instr);
ram DataMemory(ALUResult, clk, WriteData, MemWrite, ReadData);
CPU Processor(clk, rst, Instr, ReadData, PC, WriteData, Addr, MemWrite);

endmodule 