module Register #(N=4) (input  logic clk,rst,en,
						   	input  logic [N-1:0] data_in,
							   output logic [N-1:0] data_out);
logic [N-1:0] data = 0;
logic [N-1:0] out = 0;

assign neg_clk = ~clk;


always_ff @(posedge clk, posedge rst, posedge neg_clk) begin
	// Reset del registro
	if(rst) begin
		data = 0;
		out = 0;
	end
	// Lectura del registro
	else if(clk) out = data;
	// Escritura en el registro
	else if(neg_clk) begin
		if(en) data = data_in;
	end 
end
assign data_out = out;

endmodule 