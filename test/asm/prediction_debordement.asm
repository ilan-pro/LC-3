                .ORIG x3000

                ;; Convention d'appel
                ;;  Entrées: R1 = a, R2 = b
                ;;  Sortie: R0 = la prédiction du débordement
                ;; Registres modifiés:
                ;;  R0, R1, R2

                AND R0, R0, 0   ; résultat initialisé à 0
                LD R1, arg1     ; chargement de a
                LD R2, arg2     ; chargement de b
                
                JSR clz         ; calcul de clz(a)
                ADD R1, R2, 0   ; copie dans R1 de b
                ADD R2, R0, 0   ; copie du résultat dans R2
                JSR clz         ; calcul de clz(b)
                ADD R0, R0, R2  ; calcul de clz(a) + clz(b)
                ADD R0, R0, -15  ; calcul de (clz(a) + clz(b)) - 15
                TRAP x25
clz:            AND R0, R0, 0
                ADD R1, R1, 0
                BRn clz_endloop
clz_loop:       ADD R0, R0, 1
                ADD R1, R1, R1
                BRzp clz_loop
clz_endloop:    RET
arg1:           .FILL 604
arg2:           .FILL 189

                .END
