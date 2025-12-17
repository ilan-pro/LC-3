; R0 stock la première chaîne
; R1 la seconde 
; R2 sera la taille de R0
		.ORIG x3000
		LEA R0, chaine1
		ADD R2, R2, 0
loop:   	LDR R2,R0,0     ; Chargement dans R2 du caractère pointé par R0
        	BRz fini        ; Test de fin de chaîne
	        ADD R0,R0,1     ; Incrémentation du pointeur : p++
        	ADD R2,R2,1     ; Incrémentation du compteur : c++
        	BR loop
strcpy:
	
fini:
; Ici j'ajoute 1 pour le charactère de fin
	ADD R2, R2, 1
	;BRp strcpy

chaine1: 	.STRINGZ "Bonjour"
chaine2: 	.STRINGZ ""
		.END
