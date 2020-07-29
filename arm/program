		;		Almacenamiento del mensaje codificado en memoria
		MOV		R0, #1600
		MOV		R2, #0
		
		;-----------	Mensaje CIR: Mens
		
		;MOV		R1, #0x03		; 0
		;STR		R1, [R0, R2]
		;ADD		R2, R2, #4
		
		;MOV		R1, #0xA		; 1
		;STR		R1, [R0, R2]
		;ADD		R2, R2, #4
		
		;MOV		R1, #0x35		; 2
		;STR		R1, [R0, R2]
		;ADD		R2, R2, #4
		
		;MOV		R1, #0x95		; 3
		;STR		R1, [R0, R2]
		;ADD		R2, R2, #4
		
		;MOV		R1, #0xB9		; 4
		;STR		R1, [R0, R2]
		;ADD		R2, R2, #4
		
		;MOV		R1, #0xCD		; 5
		;STR		R1, [R0, R2]
		;ADD		R2, R2, #4
		
		;MOV		R1, #0xFF		; 6
		;STR		R1, [R0, R2]
		;ADD		R2, R2, #4
		
		;-----------	Mensaje XOR: Men saje
		
		
		;MOV		R1, #0x01		; 0
		;STR		R1, [R0, R2]
		;ADD		R2, R2, #4
		
		;MOV		R1, #0xB2		; 1
		;STR		R1, [R0, R2]
		;ADD		R2, R2, #4
		
		;MOV		R1, #0x9A		; 2
		;STR		R1, [R0, R2]
		;ADD		R2, R2, #4
		
		;MOV		R1, #0x91		; 3
		;STR		R1, [R0, R2]
		;ADD		R2, R2, #4
		
		;MOV		R1, #0xDF		; 4
		;STR		R1, [R0, R2]
		;ADD		R2, R2, #4
		
		;MOV		R1, #0x9E		; 5
		;STR		R1, [R0, R2]
		;ADD		R2, R2, #4
		
		;MOV		R1, #0x95		; 6
		;STR		R1, [R0, R2]
		;ADD		R2, R2, #4
		
		;MOV		R1, #0x9A		; 7
		;STR		R1, [R0, R2]
		;ADD		R2, R2, #4
		
		;MOV		R1, #0xFF		; 8
		;STR		R1, [R0, R2]
		;ADD		R2, R2, #4
		
		;-----------	Mensaje XOR: Mensaje
		
		;MOV		R1, #0x00		; 0
		;STR		R1, [R0, R2]
		;ADD		R2, R2, #4
		
		;MOV		R1, #0xF3		; 1
		;STR		R1, [R0, R2]
		;ADD		R2, R2, #4
		
		;MOV		R1, #0xBE		; 2
		;STR		R1, [R0, R2]
		;ADD		R2, R2, #4
		
		;MOV		R1, #0x96		; 3
		;STR		R1, [R0, R2]
		;ADD		R2, R2, #4
		
		;MOV		R1, #0x9D		; 4
		;STR		R1, [R0, R2]
		;ADD		R2, R2, #4
		
		;MOV		R1, #0x80		; 5
		;STR		R1, [R0, R2]
		;ADD		R2, R2, #4
		
		;MOV		R1, #0x92		; 6
		;STR		R1, [R0, R2]
		;ADD		R2, R2, #4
		
		;MOV		R1, #0x99		; 7
		;STR		R1, [R0, R2]
		;ADD		R2, R2, #4
		
		;MOV		R1, #0x96		; 8
		;STR		R1, [R0, R2]
		;ADD		R2, R2, #4
		
		;MOV		R1, #0xFF		; 21
		;STR		R1, [R0, R2]
		;ADD		R2, R2, #4
		
		
		
		;		Decodificacion del mensaje
		MOV		R0, #1600      ; Direccion de memoria del mensaje codificado
		MOV		R2, #4		; Espacio en memoria entre caracteres
		MOV		R4, #2000 	; En R4 se empieza a guardar la decodificacion
		MOV		R5, #0xFF      ; R5 = caracter de finalizacion
		LDR		R1, [R0]
		CMP		R1, #0x00		; Codigo del XOR
		BEQ		DC_XOR
		
		CMP		R1, #0x01		; Codigo del NOT
		BEQ		DC_NOT
		
		B		DC_CIR		; Rotacion circular
		
		
DC_XOR	;		Algoritmo de decodificacion para el XOR
		LDR		R3, [R0, R2]	; En R3 se almacena la llave
		
while_xor
		ADD		R2, R2, #4	; i = i + 1
		LDR		R1, [R0, R2]   ; R1 = caracter
		CMP		R1, R5		; if R1 == R5
		BEQ		FIN			; break
		EOR		R1, R1, R3	; R1 = R1 ^ R3
		STR		R1, [R4, R2]	; Guardar en R4+R2 el valor de R1
		B		while_xor
		
		
DC_NOT	;		Algoritmo de decodificacion para el NOT
		LDR		R1, [R0, R2]   ; R1 = caracter
		CMP		R1, R5		; if R1 == R5
		BEQ		FIN			; break
		MVN		R1, R1		; R1 = ~R1
		STR		R1, [R4, R2]	; Guardar en R4+R2 el valor de R1
		ADD		R2, R2, #4	; i = i + 1
		B		DC_NOT
		
DC_CIR
		LDR		R3, [R0, R2]	; En R3 se almacena la cantidad de rotaciones
		
while_cir
		ADD		R2, R2, #4	; i = i + 1
		LDR		R1, [R0, R2]   ; R1 = caracter
		CMP		R1, R5		; if R1 == R5
		BEQ		FIN			; break
		ROR		R1, R1, R3     ; Rotacion circular de R1 un total de R3 veces
		STR		R1, [R4, R2]	; Guardar en R4+R2 el valor de R1
		B		while_cir
		
FIN
