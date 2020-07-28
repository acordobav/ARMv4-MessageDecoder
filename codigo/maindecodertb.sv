module maindecodertb();

logic[1:0] Op;
logic Funct5, Funct0;
logic Branch, RegW, MemW, MemtoReg, ALUSrc, ALUOp;
logic [1:0] ImmSrc, RegSrc;


Main_Decoder DUT(Op,Funct5, Funct0, Branch, RegW, MemW, MemtoReg, ALUSrc, ALUOp, ImmSrc, RegSrc);


initial begin
Op = 2'b00;
Funct5 = 1'b0;
Funct0 = 1'b0;
#10;
Op = 2'b00;
Funct5 = 1'b1;
Funct0 = 1'b1;
#10;
end

endmodule 