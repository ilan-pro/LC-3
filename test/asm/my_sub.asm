    .ORIG x3000
    ;; R0 <- R1 - R2
    ;; R1 <- opérande 1
    ;; R2 <- opérande 2

    AND R1, R1, 0
    ADD R1, R1, 30

    AND R2, R2, 0
    ADD R2, R2, 13

    NOT R2, R2
    ADD R2, R2, 1

    ADD R0, R1, R2

    NOP
    .END