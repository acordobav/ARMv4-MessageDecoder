		MOV		R0, #1600      
		MOV		R2, #4		
		MOV		R4, #2000 	
		MOV		R5, #0xFF   
		LDR		R1, [R0]
		CMP		R1, #0x00		
		BEQ		DC_XOR
		
		CMP		R1, #0x01		
		BEQ		DC_NOT
		
		B		DC_CIR	
		
		
DC_XOR	
		LDR		R3, [R0, R2]	
		
while_xor
		ADD		R2, R2, #4	
		LDR		R1, [R0, R2]  
		CMP		R1, R5		
		BEQ		FIN			
		EOR		R1, R1, R3	
		STR		R1, [R4, R2]	
		B		while_xor
		
		
DC_NOT
		LDR		R1, [R0, R2]   
		CMP		R1, R5		
		BEQ		FIN		
		MVN		R1, R1		
		AND		R1, R1, #0xFF  
		STR		R1, [R4, R2]	
		ADD		R2, R2, #4
		B		DC_NOT
		
DC_CIR
		LDR		R3, [R0, R2]
		
while_cir
		ADD		R2, R2, #4	
		LDR		R1, [R0, R2]   
		CMP		R1, R5		
		BEQ		FIN			
		ROR		R1, R1, R3    
		STR		R1, [R4, R2]	
		B		while_cir
		