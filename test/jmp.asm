	.ORIG x3000
	AND R1, R1, 0
	LEA R1, adam ; devrait donc faire la somme de PC + 3 ?
	AND R1, R1, R1
	AND R2, R2, 0
	AND R3, R3, 0 
adam: 	.FILL 2
	.END
