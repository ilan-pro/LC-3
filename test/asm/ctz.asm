        .ORIG x3600

        ;; Convention d'appel
        ;;  Entrée: R0 = x
        ;;  Sortie: R0 = ctz(x)
        ;; Registres modifiés:
        ;;  R0, R1

ctz:    LD R0, arg      ; Chargement de l'argument, x
        ADD R1, R0, -1  ; Calcul de x-1
        XOR R0, R0, R1  ; x XOR x-1
        POPCNT R0, R0   ; POPCNT (x)
        ADD R0, R0, -1  ; Décrémentation
        TRAP x25
arg:    .FILL -8

        .END
