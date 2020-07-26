module ALU_Decoder(input  logic ALUOp,
						 input  logic [5:0] Funct,
						 input  logic [1:0] sh,
						 output logic [3:0] ALUControl,
						 output logic [1:0] FlagW);
						 
	logic [5:0] OUT;
	logic I;
	assign I = Funct[5];

	always_comb
	if (ALUOp) begin
		case(Funct)
			6'b001000: OUT = 6'b000000;//ADD
			6'b001001: OUT = 6'b000011;//ADDS
			6'b000100: OUT = 6'b000100;//SUB
			6'b000101: OUT = 6'b000111;//SUBS
			6'b000000: OUT = 6'b001000;//AND
			6'b000001: OUT = 6'b001010;//ANDS
			6'b011000: OUT = 6'b001100;//ORR
			6'b011001: OUT = 6'b001110;//ORRS
			6'b000010: OUT = 6'b010000;//XOR
			6'b000011: OUT = 6'b010010;//XORS
			6'b011110: OUT = 6'b010100;//NOT
			6'b011111: OUT = 6'b010110;//NOTS
			default:  OUT = 6'bxxxxxx;
		endcase
		if (Funct == 6'b011010) begin
			if (I == 1'b0 & sh == 2'b00) begin
			OUT = 6'b011110;//Shift Left
			end
			else if (I == 1'b0 & sh == 2'b01) begin
			OUT = 6'b100010;//Logical Shift Right
			end
			else if (I == 1'b0 & sh == 2'b10) begin
			OUT = 6'b100110;//Arithmetic Shift Right
			end
		end
	end else begin
		OUT = 6'b000000;//NotDP
	end
	
	assign ALUControl = OUT[5:2];
	assign FlagW = OUT[1:0];
	 
endmodule 						