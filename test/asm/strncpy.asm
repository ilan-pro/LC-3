.ORIG x3000

            ; R0 : nombre de caractères à copier
            ; R1 : adresse du début de la chaîne src
            ; R2 : adresse du début de la chaîne dst
            ; R3 : temporaire pour lire et écrire le caractère courant

            LD  R0, n       ; R0 <- la longueur de src à copier
            LEA R1, src     ; R1 <- adresse du premier caractère de la chaîne src
            LEA R2, dst     ; R2 <- adresse du premier caractère de la chaîne dst

loop:       AND R0, R0, R0  ; mise à jour NZP
            BRnz fin        ; si n <= 0 => on sort de la boucle
            LDR R3, R1, 0   ; R3 <- caractère à l'adresse courante de src
            BRz fin         ; caractère nul => on sort de la boucle

            STR R3, R2, 0   ; R2 <- caractère courant de src
            
            ADD R1, R1, 1   ; on avance dans src
            ADD R2, R2, 1   ; on avance dans dst
            ADD R0, R0, -1  ; décrémentation de n
            BRnzp loop      ; on boucle

fin:        AND R3, R3, 0   ; on met dans R3 le caractère nul
            STR R3, R2, 0   ; on écrit à la fin de dst ce caractère
            NOP

src:        .STRINGZ "tour de france"
dst:        .BLKW 32
n:          .FILL -7
            .END
