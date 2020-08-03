`timescale 1 ns / 1 ns
module cputb();

logic clk, rst;
logic [31:0] PC, Instr, WriteData, Addr, ReadData;
logic MemWrite;

Rom IM(PC, clk, Instr);
Ram DM(Addr, clk, rst, WriteData, MemWrite, ReadData);
CPU Processor(clk, rst, Instr, ReadData, PC, WriteData, Addr, MemWrite);

initial begin

rst = 1;
clk = 1;
#5;
rst = 0;

end

always 
	#5 clk = !clk;

endmodule 