      .ORIG x3500

            ;; Convention d'appel
            ;;  Entrée: R1 = x
            ;;  Sortie: R0 = clz(x)
            ;; Registres modifiés:
            ;;  R0, R1
            
clz:        AND R0, R0, 0   ; Résultat initialisé à 0
            LD R1, arg      ; Chargement de l'argument
            BRn clz_endloop ; Avant d'entrer dans la boucle, premier test de la présence d'un 1 dans le MSB de l'argument
                            ; Utilisation de l'équivalence
                            ; while (cond) { x }
                            ; if (cond) { do { x } while (cond); }

clz_loop:   ADD R0, R0, 1   ; Résultat <- Résultat + 1
            ADD R1, R1, R1  ; Argument <- Argument * 2 (shift gauche)
            BRzp clz_loop       ; On ne boucle que s'il n'y a pas de 0 dans le MSB de R1

clz_endloop:    TRAP x25
arg:        .FILL 512

            .END