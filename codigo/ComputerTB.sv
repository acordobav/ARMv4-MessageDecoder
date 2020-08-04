`timescale 1 ns / 1 ns
module ComputerTB();

logic clk, rst;

Computer DUT(clk, rst);

initial begin

rst = 1;
clk = 1;
#5;
rst = 0;

end

always 
	#5 clk = !clk;

endmodule 