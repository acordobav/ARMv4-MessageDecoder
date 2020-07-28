module Register_tb();

logic clk, rst, en;
logic [3:0] data_in, data_out;

Register #(4) DUT(clk, rst, en, data_in, data_out);

initial begin
	clk = 1;
	rst = 0;
	en = 0;
	data_in = 0;
	#10;
	
	data_in = 1100;
	#10;
	
	en = 1;
	#10;
	
	en = 0;
	data_in = 1111;
	#20;
	
	en = 1;
	#10;
	
	en = 0;
	#20;
	
	rst = 1;
	
end

always
	#5 clk = !clk;

endmodule 