module PC_Register (input  logic CLK, RST, EN,
						  input  logic [12:0] Data_In,
						  output logic [12:0] Data_Out);
								
	logic [12:0] OUT = 13'b1111111111100;

	always_ff @(negedge CLK) begin
		if      (RST) OUT <= 13'b1111111111100;
		else if (EN) OUT <= Data_In;
	end

	assign Data_Out = OUT;

endmodule 