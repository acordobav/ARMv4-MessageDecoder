module aludecodertb();

logic ALUOp;
logic [1:0] sh, FlagW;
logic [5:0] Funct;
logic [3:0] ALUControl;

ALU_Decoder DUT(ALUOp, Funct, sh, ALUControl, FlagW);

initial begin
ALUOp = 1'b0;
sh = 2'b11;
#10;
ALUOp = 1'b1;
Funct = 6'b011110;//NOT
#10;
Funct = 6'b000010;//XOR
#10;
Funct = 6'b011011;//Rotate Right S
#10;

end

endmodule 