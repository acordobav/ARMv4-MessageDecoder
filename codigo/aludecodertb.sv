module aludecodertb();

logic ALUOp;
logic [1:0] sh, FlagW;
logic [5:0] Funct;
logic [3:0] ALUControl;

ALU_Decoder DUT(ALUOp, Funct, sh, ALUControl, FlagW);

initial begin
ALUOp = 1'b0;
#10;
ALUOp = 1'b1;
Funct = 6'b001000;//Add
#10;
Funct = 6'b000101;
#10;
Funct = 6'b011010;
sh = 2'b01;
#10;

end

endmodule 