	.ORIG x3000	
	LEA R1, test ; devrait donc faire la somme de PC + 3 (3002 + 3 = 3005 ou 0005 en logisim)
	AND R1, R1, R1
	AND R2, R2, 0
	AND R3, R3, 0 
test: 	.FILL 2
	.END
