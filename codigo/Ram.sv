module Ram(input  logic [9:0] Addr,
			  input  logic CLK, RST,
			  input  logic [31:0] Data_In,
			  input  logic EN,
			  output logic [31:0] Data_Out);
	
	logic [31:0] Memory [0:1023];
	
	integer index;
	always_ff @(negedge CLK, posedge RST) begin
	
		if (RST) begin
			for (index=0; index<1024; index=index+1) begin
				Memory[index] <= 32'b0;
			end
		end else if (EN) begin
			Memory[Addr] <= Data_In;
		end
	end
	
	assign Data_Out = Memory[Addr];
			  
			  
endmodule 