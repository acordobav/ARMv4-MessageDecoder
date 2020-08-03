`timescale 1 ns / 1 ns
module romemtb();

logic clk;
logic [6:0] addr;
logic [5:0] pc;
logic [31:0] data;
logic [31:0] instr;

EM DUT(addr, clk, data);
Rom DUT2(pc, clk, instr);

initial begin

clk = 1;
addr = 6'd0;
pc = 5'd0;
#10;
addr = 6'd1;
pc = 5'd1;
#10;
addr = 6'd2;
pc = 5'd2;
#10;

end

always 
	#5 clk = !clk;

endmodule 