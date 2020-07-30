module BarrelShifterALU_tb();

logic [7:0] A; 
logic [3:0] Rot;
logic [31:0] out;

BarrelShifterALU DUT(A,Rot,out);

initial begin

	A = 8'b11110001;
	
	// Caso 1 - Rotacion de 0
	Rot = 4'b0000;
	#10;
	assert(out === 32'b00000000000000000000000011110001) else $error("Caso 1 failed");
	
	// Caso 2 - Rotacion de 1
	Rot = 4'b0001;
	#10;
	assert(out === 32'b00000000000000000000000011111000) else $error("Caso 2 failed");
	
	// Caso 3 - Rotacion de 2
	Rot = 4'b0010;
	#10;
	assert(out === 32'b00000000000000000000000001111100) else $error("Caso 3 failed");
	
	// Caso 4 - Rotacion de 3
	Rot = 4'b0011;
	#10;
	assert(out === 32'b00000000000000000000000000111110) else $error("Caso 4 failed");
	
	// Caso 5 - Rotacion de 4
	Rot = 4'b0100;
	#10;
	assert(out === 32'b00000000000000000000000000011111) else $error("Caso 5 failed");
	
	// Caso 6 - Rotacion de 5
	Rot = 4'b0101;
	#10;
	assert(out === 32'b00000000000000000000000010001111) else $error("Caso 6 failed");
	
	// Caso 7 - Rotacion de 6
	Rot = 4'b0110;
	#10;
	assert(out === 32'b00000000000000000000000011000111) else $error("Caso 7 failed");
	
	// Caso 8 - Rotacion de 7
	Rot = 4'b0111;
	#10;
	assert(out === 32'b00000000000000000000000011100011) else $error("Caso 8 failed");
	
	// Caso 9 - Rotacion de 8
	Rot = 4'b1000;
	#10;
	assert(out === 32'b00000000000000000000000011110001) else $error("Caso 9 failed");
	
	// Caso 10 - Rotacion de 9
	Rot = 4'b1001;
	#10;
	assert(out === 32'b00000000000000000000000011111000) else $error("Caso 10 failed");
	
	// Caso 11 - Rotacion de 10
	Rot = 4'b1010;
	#10;
	assert(out === 32'b00000000000000000000000001111100) else $error("Caso 11 failed");
	
	// Caso 12 - Rotacion de 11
	Rot = 4'b1011;
	#10;
	assert(out === 32'b00000000000000000000000000111110) else $error("Caso 12 failed");
	
	// Caso 13 - Rotacion de 12
	Rot = 4'b1100;
	#10;
	assert(out === 32'b00000000000000000000000000011111) else $error("Caso 13 failed");
	
	// Caso 14 - Rotacion de 13
	Rot = 4'b1101;
	#10;
	assert(out === 32'b00000000000000000000000010001111) else $error("Caso 14 failed");
	
	// Caso 15 - Rotacion de 14
	Rot = 4'b1110;
	#10;
	assert(out === 32'b00000000000000000000000011000111) else $error("Caso 15 failed");
	
	// Caso 16 - Rotacion de 15
	Rot = 4'b1111;
	#10;
	assert(out === 32'b00000000000000000000000011100011) else $error("Caso 16 failed");


end


endmodule 