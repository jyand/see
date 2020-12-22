#include<stdio.h>
#include<stdlib.h>

int IsPrime(int) ;

void main() {
        srand((unsigned)"") ;
        int r = rand() % 1000 ;

        printf("%d ", r) ;
        if (IsPrime(r)) {
                printf("%s", "primo") ;
        }
        printf("\n") ;
}

int IsPrime(int n) {
        int i = 2 ;
        int boolean = 1 ;
        while (i < n) {
                if (n % i == 0) {
                        boolean = 0 ;
                        break ;
                }
                i++ ;
        }
        return boolean ;
}
