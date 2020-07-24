module SignExtend #(parameter InWidth=2, parameter OutWidth=4)
						 (input  [InWidth-1:0]  in,
						  output [OutWidth-1:0] ext);
						  
assign ext = {{OutWidth-InWidth{in[InWidth-1]}},in[InWidth-1:0]};

endmodule 