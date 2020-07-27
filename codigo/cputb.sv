module cputb();

logic clk, rst;
logic [31:0] Instr, ReadData;
logic [31:0] PC, WriteData, Addr; 
logic MemWrite;


logic [3:0] Cond;
logic [1:0] Op;
logic [5:0] Funct;
logic [3:0] Rn, Rd;
logic [11:0] Src2;

assign Instr = {Cond, Op, Funct, Rn, Rd, Src2};


CPU DUT(clk, rst, Instr, ReadData, PC, WriteData, Addr, MemWrite);

initial begin

rst = 1;
clk = 1;
#10;
rst = 0;
ReadData = 32'd1;

//ADD R6, R8, #5 : 11100010100010000110000000000101

//STR R6, [R11, #77] : 11100100000010110110000001001101


//ADD R7, R8, #4 : 11100010100010000111000000000100


//SUB R5, R6, R7 : 11100000010001100101000000000111

//LDR R4, [R4, #77] : 11100101100101000100000001001101

// B : 11101010000000000000000000001010

$display("%b",Instr);

end

always 
	#5 clk = !clk;

endmodule 