module RegisterFile #(N=32) (input  logic         clk, rst, WE3,
									  input  logic [3:0]   A1, A2, A3,
							        input  logic [N-1:0] WD3, R15,
									  output logic [N-1:0] RD1, RD2);

// Salidas de cada registro
logic[N-1:0] r00_out, r01_out, r02_out, r03_out, r04_out, r05_out;
logic[N-1:0] r06_out, r07_out, r08_out, r09_out, r10_out, r11_out;
logic[N-1:0] r12_out, r13_out, r14_out, r15_out;

// Enable de cada registro
logic[15:0] reg_en;
Demux_1to16 DEMUX(WE3, A3, reg_en);


// Registros									  
Register #(N) REG00(clk,rst,reg_en[0], WD3,r00_out);
Register #(N) REG01(clk,rst,reg_en[1], WD3,r01_out);
Register #(N) REG02(clk,rst,reg_en[2], WD3,r02_out);
Register #(N) REG03(clk,rst,reg_en[3], WD3,r03_out);
Register #(N) REG04(clk,rst,reg_en[4], WD3,r04_out);
Register #(N) REG05(clk,rst,reg_en[5], WD3,r05_out);
Register #(N) REG06(clk,rst,reg_en[6], WD3,r06_out);
Register #(N) REG07(clk,rst,reg_en[7], WD3,r07_out);
Register #(N) REG08(clk,rst,reg_en[8], WD3,r08_out);
Register #(N) REG09(clk,rst,reg_en[9], WD3,r09_out);
Register #(N) REG10(clk,rst,reg_en[10],WD3,r10_out);
Register #(N) REG11(clk,rst,reg_en[11],WD3,r11_out);
Register #(N) REG12(clk,rst,reg_en[12],WD3,r12_out);
Register #(N) REG13(clk,rst,reg_en[13],WD3,r13_out);
Register #(N) REG14(clk,rst,reg_en[14],WD3,r14_out);
Register #(N) REG15(clk,rst,1'b1,R15,r15_out);

// Selector de la salida correspondiente
Mux_16 #(N) MUX_OUT_RD1(A1, r00_out, r01_out, r02_out, r03_out, r04_out,
				            r05_out, r06_out, r07_out, r08_out, r09_out,
						      r10_out, r11_out, r12_out, r13_out, r14_out,
						      r15_out, RD1);
Mux_16 #(N) MUX_OUT_RD2(A2, r00_out, r01_out, r02_out, r03_out, r04_out,
				            r05_out, r06_out, r07_out, r08_out, r09_out,
						      r10_out, r11_out, r12_out, r13_out, r14_out,
						      r15_out, RD2);

endmodule 									  
