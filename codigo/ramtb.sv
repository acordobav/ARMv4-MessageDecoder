module ramtb();

logic [9:0] Addr;
logic CLK, RST;
logic [31:0] Data_In;
logic EN;
logic [31:0] Data_Out;

Ram DUT(Addr, CLK, RST, Data_In, EN, Data_Out);

initial begin

RST = 1;
CLK = 1;
EN = 0;
Addr = 10'd2;
Data_In = 32'd10;
#5;
RST = 0;
#10;
EN = 1;
#10;
EN = 0;
Addr = 10'd10;
#10;
Addr = 10'd2;
#10;

end

always 
	#5 CLK = !CLK;

endmodule 