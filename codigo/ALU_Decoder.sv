module ALU_Decoder(input  logic ALUOp,
						 input  logic [5:0] Funct,
						 input  logic [1:0] sh,
						 output logic [3:0] ALUControl,
						 output logic [1:0] FlagW);
						 
	logic [5:0] OUT;

	always_comb
	if (ALUOp) begin
		if (Funct == 6'b011010 && sh == 2'b00) begin
				OUT = 6'b011100;//Shift Left
		end
		else if (Funct == 6'b011010 && sh == 2'b01) begin
			OUT = 6'b100000;//Logical Shift Right
		end
		else if (Funct == 6'b011010 && sh == 2'b10) begin
			OUT = 6'b100100;//Arithmetic Shift Right
		end
		else if (Funct == 6'b011010 && sh == 2'b11) begin
			OUT = 6'b101000;//Rotate Right			
		end
		else if (Funct == 6'b011011 && sh == 2'b00) begin
			OUT = 6'b011110;//Shift Left S
		end
		else if (Funct == 6'b011011 && sh == 2'b01) begin
			OUT = 6'b100010;//Logical Shift Right S
		end
		else if (Funct == 6'b011011 && sh == 2'b10) begin
			OUT = 6'b100110;//Arithmetic Shift Right S
		end
		else if (Funct == 6'b011011 && sh == 2'b11) begin
			OUT = 6'b101010;//Rotate Right S			
		end else
			casex(Funct)
				6'b?01000: OUT = 6'b000000;//ADD
				6'b?01001: OUT = 6'b000011;//ADDS
				6'b?00100: OUT = 6'b000100;//SUB
				6'b?00101: OUT = 6'b000111;//SUBS
				6'b?00000: OUT = 6'b001000;//AND
				6'b?00001: OUT = 6'b001010;//ANDS
				6'b?11000: OUT = 6'b001100;//ORR
				6'b?11001: OUT = 6'b001110;//ORRS
				6'b?00010: OUT = 6'b010000;//XOR
				6'b?00011: OUT = 6'b010010;//XORS
				6'b?11110: OUT = 6'b011000;//NOT
				6'b?11111: OUT = 6'b011010;//NOTS
				6'b111010: OUT = 6'b000000;//MOV
				6'b111011: OUT = 6'b000010;//MOVS
				6'b?10101: OUT = 6'b000111;//CMP
				default:  OUT = 6'bxxxxxx;
			endcase
	end else begin
		OUT = 6'b000000;//NotDP
	end
	
	assign ALUControl = OUT[5:2];
	assign FlagW = OUT[1:0];
	 
endmodule 						