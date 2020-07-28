module BarrelShifter_tb();

logic [7:0] in, out;
logic [3:0] rot;

BarrelShifter DUT(in, rot, out);

initial begin
	in = 8'b11110001;
	
	// Caso 1 - Rotacion de 0
	rot = 4'b0000;
	#10;
	assert(out === 8'b11110001) else $error("Caso 1 failed");
	
	// Caso 2 - Rotacion de 1
	rot = 4'b0001;
	#10;
	assert(out === 8'b11111000) else $error("Caso 2 failed");
	
	// Caso 3 - Rotacion de 2
	rot = 4'b0010;
	#10;
	assert(out === 8'b01111100) else $error("Caso 3 failed");
	
	// Caso 4 - Rotacion de 3
	rot = 4'b0011;
	#10;
	assert(out === 8'b00111110) else $error("Caso 4 failed");
	
	// Caso 5 - Rotacion de 4
	rot = 4'b0100;
	#10;
	assert(out === 8'b00011111) else $error("Caso 5 failed");
	
	// Caso 6 - Rotacion de 5
	rot = 4'b0101;
	#10;
	assert(out === 8'b10001111) else $error("Caso 6 failed");
	
	// Caso 7 - Rotacion de 6
	rot = 4'b0110;
	#10;
	assert(out === 8'b11000111) else $error("Caso 7 failed");
	
	// Caso 8 - Rotacion de 7
	rot = 4'b0111;
	#10;
	assert(out === 8'b11100011) else $error("Caso 8 failed");
	
	// Caso 9 - Rotacion de 8
	rot = 4'b1000;
	#10;
	assert(out === 8'b11110001) else $error("Caso 9 failed");
	
	// Caso 10 - Rotacion de 9
	rot = 4'b1001;
	#10;
	assert(out === 8'b11111000) else $error("Caso 10 failed");
	
	// Caso 11 - Rotacion de 10
	rot = 4'b1010;
	#10;
	assert(out === 8'b01111100) else $error("Caso 11 failed");
	
	// Caso 12 - Rotacion de 11
	rot = 4'b1011;
	#10;
	assert(out === 8'b00111110) else $error("Caso 12 failed");
	
	// Caso 13 - Rotacion de 12
	rot = 4'b1100;
	#10;
	assert(out === 8'b00011111) else $error("Caso 13 failed");
	
	// Caso 14 - Rotacion de 13
	rot = 4'b1101;
	#10;
	assert(out === 8'b10001111) else $error("Caso 14 failed");
	
	// Caso 15 - Rotacion de 14
	rot = 4'b1110;
	#10;
	assert(out === 8'b11000111) else $error("Caso 15 failed");
	
	// Caso 16 - Rotacion de 15
	rot = 4'b1111;
	#10;
	assert(out === 8'b11100011) else $error("Caso 16 failed");
	
end

endmodule 