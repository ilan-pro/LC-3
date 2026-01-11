        ; résultat final stocké dans R5
        .ORIG x3000
        LD R0, value 
        AND R1, R1, 0
        AND R5, R5, 0
        ADD R1, R1, 1 ; va servir de valeur à ajouter si il y a bien un 1 présent dans le chiffre
        LEA R2, power

loop:   LDR R3, R2, 0
        AND R4, R0, R3
        BRp add_v 
        ADD R2, R2, 1
        ADD R1, R1, R1
        BRz fin
        BR loop

add_v:  ADD R5, R5, R1
        ADD R2, R2, 1
        ADD R1, R1, R1
        BR loop

value:  .FILL 24

power:  .FILL x8000   ; 2^15 = 32768
        .FILL x4000   ; 2^14 = 16384
        .FILL x2000   ; 2^13 = 8192
        .FILL x1000   ; 2^12 = 4096
        .FILL x0800   ; 2^11 = 2048
        .FILL x0400   ; 2^10 = 1024
        .FILL x0200   ; 2^9  = 512
        .FILL x0100   ; 2^8  = 256
        .FILL x0080   ; 2^7  = 128
        .FILL x0040   ; 2^6  = 64
        .FILL x0020   ; 2^5  = 32
        .FILL x0010   ; 2^4  = 16
        .FILL x0008   ; 2^3  = 8
        .FILL x0004   ; 2^2  = 4
        .FILL x0002   ; 2^1  = 2
        .FILL x0001   ; 2^0 = 1
fin:    .END