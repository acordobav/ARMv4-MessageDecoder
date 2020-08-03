`timescale 1 ns / 1 ns
module ComputerTB();

logic clk, rst;
logic [31:0] PC, Instr, WriteRAM, RAMData, Addr, MuxData, Msj;
logic MemWrite, RAMEnable, S;

Rom IM(PC[5:0], clk, Instr);
Ram DM(Addr[9:0], clk, rst, WriteRAM, RAMEnable, RAMData);
CPU Processor(clk, rst, Instr, MuxData, PC, WriteRAM, Addr, MemWrite);
Chipset Chip(MemWrite, Addr[10:0], RAMEnable, S);
EM EMM(Addr[6:0], clk, Msj);
Mux2 #(32) MuxChipset(S, Msj, RAMData, MuxData);


initial begin

rst = 1;
clk = 1;
#5;
rst = 0;

end

always 
	#5 clk = !clk;

endmodule 