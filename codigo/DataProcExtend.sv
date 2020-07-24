module DataProcExtend(input  logic [7:0]  Imm,
							 input  logic [3:0]  rot,
							 output logic [31:0] ExtImm);
logic [7:0] w;

BarrelShifter BS(Imm, rot, w);
ZeroExtend #(8,32) ZeroEx(w,ExtImm);

endmodule 