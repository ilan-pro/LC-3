#include <stdio.h>

/* 
 * Version ultra-simple pour traduction LC-3
 * Correspond directement au code assembleur
 */
unsigned short reverse_simple(unsigned short x) {
    unsigned short result = 0;  // R1
    int counter = 16;           // R2
    unsigned short temp;        // R3 (temporaire)
    
    while (counter > 0) {
        // 1. result = result << 1  (decalage gauche)
        //    En LC-3: ADD R1, R1, R1
        result = result << 1;
        
        // 2. temp = x & 1  (bit de poids faible)
        //    En LC-3: AND R3, R0, #1
        temp = x & 1;
        
        // 3. if (temp != 0) result = result | 1
        //    En LC-3: BRz SKIP_ADD; ADD R1, R1, #1; SKIP_ADD: ...
        if (temp != 0) {
            result = result | 1;
        }
        
        // 4. x = x >> 1  (decalage droit LOGIQUE)
        //    Pour LC-3: traitement special car pas d'instruction >>
        //    Deux cas: si x >= 0, x = x / 2
        //              si x < 0, enlever bit de signe puis x = x / 2
        if (x >= 32768) {  // Si bit de signe = 1 (négatif en C signé)
            // Enlever le bit de signe
            x = x & 32767;  // 0x7FFF
            // Diviser par 2
            x = x / 2;
            // Remettre un 0 à gauche (décalage logique)
            // Pas besoin d'ajouter de bit de signe
        } else {
            // x positif, simple division par 2
            x = x / 2;
        }
        
        // 5. counter--
        //    En LC-3: ADD R2, R2, #-1
        counter--;
    }
    
    return result;
}

/* 
 * Version avec décalage logique explicite
 * Pour mieux comprendre la traduction LC-3
 */
unsigned short reverse_lc3_style(unsigned short x) {
    unsigned short result = 0;
    int i;
    
    for (i = 0; i < 16; i++) {
        // Decalage gauche du resultat
        result = result + result;  // ADD R1, R1, R1  (pas de << en LC-3!)
        
        // Tester bit de poids faible
        if (x & 1) {
            result = result + 1;   // ADD R1, R1, #1
        }
        
        // Decalage droit LOGIQUE de x
        // En LC-3, on doit:
        // 1. Sauvegarder/traiter le bit de signe
        // 2. Diviser par 2
        
        // Methode: x = x / 2 avec gestion du bit de signe
        unsigned short sign_bit = x & 0x8000;  // Bit 15
        
        // Enlever le bit de signe si present
        if (sign_bit) {
            x = x & 0x7FFF;  // Masquer le bit de signe
        }
        
        // Diviser par 2
        x = x / 2;  // En LC-3: implémenter division
        
        // Pour décalage logique, on insère 0 à gauche
        // Donc on ne remet PAS le bit de signe
        // (contrairement au décalage arithmétique)
    }
    
    return result;
}

int main() {
    // Test de la version simple
    unsigned short test = 24;  // 0000 0000 0001 1000
    
    printf("Test avec x = %u (0x%04X)\n", test, test);
    
    unsigned short res1 = reverse_simple(test);
    printf("reverse_simple(%u) = %u (0x%04X)\n", test, res1, res1);
    
    unsigned short res2 = reverse_lc3_style(test);
    printf("reverse_lc3_style(%u) = %u (0x%04X)\n", test, res2, res2);
    
    // Verification
    if (res1 == 6144 && res2 == 6144) {
        printf("SUCCES! Les deux fonctions retournent 6144 (0x1800)\n");
    }
    
    return 0;
}