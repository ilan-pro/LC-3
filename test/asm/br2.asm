        .ORIG x3000
        AND R0, R0, 0
        AND R1, R1, 0
        LEA R1, test
loop:   LDR R0, R1, 0	
        BRz fin
        ADD R1, R1, 1
        BR loop
test:	.STRINGZ "p"
fin:    .END	
