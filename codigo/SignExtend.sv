module SignExtend #(parameter InWidth=24, parameter OutWidth=32)
						 (input  [InWidth-1:0]  in,
						  output [OutWidth-1:0] ext);
logic [InWidth-1:0] w;
assign w = in << 2'b10;						  
assign ext = {{OutWidth-InWidth{w[InWidth-1]}},w[InWidth-1:0]};

endmodule 