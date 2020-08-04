module Computer(input logic clk, rst);

logic [31:0] PC, Instr, WriteRAM, RAMData, Addr, MuxData, Msj;
logic MemWrite, RAMEnable, S;

RomIM IM(PC[5:0], Instr);
Ram DM(Addr[9:0], clk, rst, WriteRAM, RAMEnable, RAMData);
CPU Processor(clk, rst, Instr, MuxData, PC, WriteRAM, Addr, MemWrite);
Chipset Chip(MemWrite, Addr[10:0], RAMEnable, S);
RomEM EMM(Addr[6:0], Msj);
Mux2 #(32) MuxChipset(S, Msj, RAMData, MuxData);

endmodule 