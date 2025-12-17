    .ORIG x3000
    AND R2, R2, 0
    ADD R2, R2, 3
    AND R2, R2, 0
    BRz fin
    AND R1, R1, 0
    ADD R1, R1, -2
fin: .END