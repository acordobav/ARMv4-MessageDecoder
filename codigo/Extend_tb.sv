module Extend_tb();

logic[1:0] ImmSrc;
logic[31:0] ExtImm;
logic[23:0] Instr;

Extend DUT(ImmSrc, Instr, ExtImm);

initial begin
	ImmSrc = 2'b00; // Procesamiento de Datos
	
	// Caso 1 - Procesamiento de Datos
	Instr = 24'b010001100000001010010011;
	#10;
	assert(ExtImm === 32'b00000000000000000000000001001110) else $error("Caso 1 failed"); 
	
	// Caso 2 - Procesamiento de Datos
	Instr = 24'b010000011000011010110100;
	#10;
	assert(ExtImm === 32'b00000000000000000000000000101101) else $error("Caso 2 failed"); 
	
	// Caso 3 - Procesamiento de Datos
	Instr = 24'b001110000000010000000110;
	#10;
	assert(ExtImm === 32'b00000000000000000000000001100000) else $error("Caso 3 failed"); 
	
	ImmSrc = 2'b01; // Memoria
	
	// Caso 4 - Memoria
	Instr = 24'b110111000010101010010011;
	#10;
	assert(ExtImm === 32'b00000000000000000000101010010011) else $error("Caso 4 failed"); 
	
	// Caso 5 - Memoria
	Instr = 24'b101111001010000000010011;
	#10;
	assert(ExtImm === 32'b00000000000000000000000000010011) else $error("Caso 5 failed"); 
	
	// Caso 6 - Memoria
	Instr = 24'b010011001010000000010000;
	#10;
	assert(ExtImm === 32'b00000000000000000000000000010000) else $error("Caso 6 failed"); 
	
	ImmSrc = 2'b10; // Salto
	
	// Caso 7 - Salto
	Instr = 24'b111110000010101010010011;
	#10;
	assert(ExtImm === 32'b11111111111000001010101001001100) else $error("Caso 7 failed"); 
	
	// Caso 8 - Salto
	Instr = 24'b110100011010000000010011;
	#10;
	assert(ExtImm === 32'b00000000010001101000000001001100) else $error("Caso 8 failed"); 
	
	// Caso 9 - Salto
	Instr = 24'b000101001010000000010000;
	#10;
	assert(ExtImm === 32'b00000000010100101000000001000000) else $error("Caso 9 failed"); 
	
	
	/*
	$display("%b",Instr[11:8]); $display("%b",Instr[7:0]);
	
	$display("%b",ExtImm[7:0]);
	*/
end

endmodule 