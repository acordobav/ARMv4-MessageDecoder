module ZeroExtend #(parameter InWidth=2, parameter OutWidth=4)
						 (input  [InWidth-1:0]  in,
						  output [OutWidth-1:0] ext);
						  
logic [OutWidth-InWidth-1:0] zeros = 0;						  
assign ext = {zeros, in};

endmodule  