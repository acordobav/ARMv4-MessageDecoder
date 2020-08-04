module romtb();


logic [6:0] Addr;
logic [31:0] q;

RomEM DUT(Addr, q);

initial begin

Addr = 6'd0;
#10;
Addr = 6'd1;
#10;
Addr = 6'd2;
#10;
Addr = 6'd126;
#10;



end

endmodule 