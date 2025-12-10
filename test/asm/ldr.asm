	.ORIG x3000
	AND R0, R0, 0
	AND R1, R1, 0
	LEA R1, test
	LDR R0, R1, 0 ;R0 devrait donc être égale à 18 
test:	.FILL 18
	.END
