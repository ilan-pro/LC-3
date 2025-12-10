	.ORIG x3000
	AND R0, R0, 0
	AND R1, R1, 0
	ADD R1, R1, 9
	LEA R0, test
	STR R1, R0, -1
	AND R2, R2, 0
	ADD R2, R2, 19 ;ne devrait donc jamais être fait car nous mettons la valeur du registre R1 à la place donc à l'adresse x3006 (ou 0006 sur logi) il y a 9
test: 	.FILL 5
	.END
