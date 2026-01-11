; R0 servira de stockage pour src
; R1 servira de stockage pour dst
		.ORIG x3000
		LEA R1, src
		LEA R2, dst
loop:		LDR R3, R1, 0		; R3 = mem[src[i]]
		STR R3, R2, 0		; dst[i] = src[i]
		BRz fin			; if(src[i] == '\0') { goto fin }
		ADD R1, R1, 1		; src++
		ADD R2, R2, 1		; dst++
		BR loop			; else { goot loop1 }		 		
src:	 	.STRINGZ "Bonjour"
dst: 		.BLKW 40		; taille réserver arbitraire pour copier dst
ppo:		ADD R2, R2, 8
		AND R2, R2, 0
fin: 		.END
