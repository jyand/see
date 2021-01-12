#include<stdio.h>
#include<stdint.h>

int main() {
        const N = 4 ;
        const char* alph[] = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"} ;
        uint8_t ALPH_SIZE = sizeof(alph)/sizeof(alph[0]) ;
        // should probably weight a little more towards vowels rather than max entropy
        srand((unsigned)"") ;
        for (uint8_t j = 0 ; j < N ; ++j) {
                for (uint8_t i = 0 ; i < N ; ++i) {
                        uint8_t r = rand()%(ALPH_SIZE) ;
                        printf("[%s]", alph[r]) ;
                }
                printf("\n") ;
        }

        return 0 ;
}
