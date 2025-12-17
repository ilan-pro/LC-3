	.ORIG x3000
	AND R0, R0, 0
	LD R0, test	
	BRn	fin
	NOP
	NOP
test:	.FILL -15
fin:	.END	
