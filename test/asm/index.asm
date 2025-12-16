            .ORIG x3000

            ; R0 : adresse de la première apparition 
            ; R1 : adresse du début de chaîne à parcourir
            ; R2 : caractère à chercher
            ; R3 : temporaire pour lire le caractère courant et pour la comparaison

            AND R0, R0, 0   ; R0 <- 0, valeur par défaut
            LEA R1, chaine  ; R1 <- adresse du premier caractère de la chaîne
            LD  R2, char    ; R2 <- caractère à chercher

loop:       LDR R3, R1, 0   ; R3 <- valeur à l'adresse courante de la chaîne
            BRz fin         ; si R3 = 0, on est arrivé à la fin de la chaîne sans succès

            NOT R3, R3      ; { R3 <- complément à 2 du caractère à chercher
            ADD R3, R3, 1   ; }
            ADD R3, R3, R2  ; R3 <- différence entre le caractère à chercher et le courant
            BRz trouve      ; si 0 => égalité des caractères, on a trouvé et on peut sortir de la boucle
            
            ADD R1, R1, 1   ; on passe au prochain caractère de la chaîne
            BRnzp loop      ; on boucle

trouve:     ADD R0, R0, R1  ; R0 <- adresse du caractère courant
fin:        RET

chaine:     .STRINGZ "tour de france"
char:       .FILL x0020

            .END