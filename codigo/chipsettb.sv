module chipsettb();

logic MemWrite;
logic [10:0] Addr;
logic WRA, S;

Chipset DUT(MemWrite, Addr, WRA, S);

initial begin

MemWrite = 0;
Addr = 11'h6A;
#10;
Addr = 11'h9A;
#10;
MemWrite = 1;
#10;
Addr = 11'h6A;
#10;

end

endmodule 