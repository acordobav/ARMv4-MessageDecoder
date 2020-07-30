module BarrelShifterALU(input  logic [7:0]  A, 
								input  logic [3:0]  Rot, 
								output logic [31:0] Out);

logic [7:0] shifted;

BarrelShifter BS(A, Rot, shifted);
ZeroExtend #(8,32) ZE(shifted, Out);

endmodule 