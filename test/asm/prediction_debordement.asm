                .ORIG x3700

;; Convention d'appel
;;  Entrées: R1 = a, R2 = b
;;  Sortie: R0 = prédiction du débordement
;; Registres modifiés: R0

predi_debord:   
                ;; Sauvegarde de R1 et R2
                ADD R6, R6, -2
                STR R1, R6, 0
                STR R2, R6, 1

                LD R1, arg1
                LD R2, arg2

                JSR clz         ; calcul de clz(a)
                ADD R1, R2, 0   ; R1 <- b
                ADD R2, R0, 0   ; R2 <- R0
                JSR clz         ; calcul de clz(b)
                ADD R0, R0, R2  ; R0 <- clz(a) + clz(b)
                ADD R0, R0, -15 ; R0 <- (clz(a) + clz(b)) - 15

                ;; Restauration de R1 et R2
                LDR R1, R6, 0
                LDR R2, R6, 1
                ADD R6, R6, 2

                TRAP x25

clz:            AND R0, R0, 0
                BRn clz_endloop
clz_loop:       ADD R0, R0, 1
                ADD R1, R1, R1
                BRzp clz_loop
clz_endloop:    RET

arg1:           .FILL 738
arg2:           .FILL 188

                .END
