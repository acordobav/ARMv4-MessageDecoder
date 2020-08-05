module ComputerTB();

int fd; 

logic clk, rst;
logic [31:0] PC, Instr, WriteRAM, RAMData, Addr, MuxData, Msj;
logic MemWrite, RAMEnable, S;

RomIM IM(PC[5:0], Instr);
Ram DM(Addr[9:0], clk, rst, WriteRAM, RAMEnable, RAMData);
CPU Processor(clk, rst, Instr, MuxData, PC, WriteRAM, Addr, MemWrite);
Chipset Chip(MemWrite, Addr[10:0], RAMEnable, S);
RomEM EMM(Addr[6:0], Msj);
Mux2 #(32) MuxChipset(S, Msj, RAMData, MuxData);

initial begin

rst = 1;
clk = 0;
#5;
rst = 0;

end

always begin
	#5 clk = !clk;

//	if(RAMData !== 32'b0 && RAMEnable === 1) begin
//		$display ("%c",  RAMData);
//		fd = $fopen("./DM.txt", "a+");
//		$fdisplay (fd, "%c",  RAMData);
//		$fclose(fd);
//	end
	
end
	

endmodule 