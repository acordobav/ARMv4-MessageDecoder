module RegisterFile_tb();

logic clk, rst, WE3;
logic [3:0] A1, A2, A3;
logic [31:0] WD3, R15, RD1, RD2;

RegisterFile DUT(clk, rst, WE3, A1, A2, A3, WD3, R15, RD1, RD2);

initial begin
	clk = 1;
	rst = 0;
	A1 = 0;
	A2 = 0;
	A3 = 0;
	WE3 = 0;
	WD3 = 0;
	R15 = 0;
	#10;
	
	WD3 = 32'b11111111111111111111111111111111;
	A3 = 4'b0001;
	A1 = 4'b0001;
	A2 = 4'b1111;
	R15 = 32'b00000000000000000000000000000100;
	WE3 = 1;
	#10;
	
	WE3 = 0;
	#10;
	
	A3 = 4'b1111;
	WE3 = 1;
	WD3 = 32'b11111000000000000000000000011111;
	#10;
	
end

always
	#5 clk = !clk;

endmodule 