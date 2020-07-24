module Extend(input  logic[1:0]  ImmSrc,
				  input  logic[23:0] Instr,
				  output logic[31:0] ExtImm);

logic[31:0] out1, out2, out3;

DataProcExtend DataEx(Instr[7:0],Instr[11:8],out1);
ZeroExtend #(12, 32) ZeroEx(Instr[11:0], out2);
SignExtend #(24, 32) SignEx(Instr,out3);
Mux4 #(32) MuxOut(ImmSrc, out1, out2, out3, 32'b0, ExtImm);

endmodule 