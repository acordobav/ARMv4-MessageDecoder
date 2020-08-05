		MOV		R2, #1		
		LDR		R1, [R0]
		CMP		R1, #0x00		
		BEQ		DC_XOR	
		CMP		R1, #0x01		
		BEQ		DC_NOT
		B		DC_CIR	
DC_XOR	LDR		R3, [R0, R2]	
while_xor	ADD		R2, R2, #1	
		LDR		R1, [R0, R2]  
		CMP		R1, #0xFF   		
		BEQ		FIN			
		EOR		R1, R1, R3	
		STR		R1, [R2, #200]	
		B		while_xor
DC_NOT	LDR		R1, [R0, R2]   
		CMP		R1, #0xFF   		
		BEQ		FIN		
		MVN		R1, R1		
		AND		R1, R1, #0xFF  
		STR		R1, [R2, #200]	
		ADD		R2, R2, #1
		B		DC_NOT
DC_CIR	LDR		R3, [R0, R2]
while_cir	ADD		R2, R2, #1	
		LDR		R1, [R0, R2]   
		CMP		R1, #0xFF   		
		BEQ		FIN			
		ROR		R1, R1, R3    
		STR		R1, [R2, #200]	
		B		while_cir
FIN		B		FIN


