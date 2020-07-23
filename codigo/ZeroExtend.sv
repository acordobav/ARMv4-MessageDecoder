module ZeroExtend(input  [11:0] Imm,
						output [31:0] ExtImm);
assign ExtImm = {20'b00000000000000000000, Imm};
endmodule 