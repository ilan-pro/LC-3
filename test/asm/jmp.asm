		.ORIG x0000 
		LEA R0, fin 
		JMP R0 
		AND R1, R1, 0 
		ADD R1, R1, 1 
fin:	AND R1, R1, 0 
		ADD R1, R1, 2 
		.END
