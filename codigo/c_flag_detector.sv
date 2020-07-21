module c_flag_detector (input  logic [3:0] alucontrol, 
								input  logic       cout,
								output logic       flag);

logic c_flag;

assign c_flag = ~alucontrol[3] & ~alucontrol[2] & ~alucontrol[1] & cout;
assign flag = c_flag;

endmodule 