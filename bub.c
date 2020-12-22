#include<stdio.h>
#include<stdlib.h>

int* BubbleSort(int[], int) ;
void PrintArray(int[], int) ;

int main() {
        srand((unsigned)"") ;
        const SIZE = 10 ;
        int r[SIZE] ;
        int *sorted ;

        for (int i = 0 ; i < SIZE ; ++i) {
                r[i] = rand()%100 ;
        }

        printf("\nArray of randomly generated numbers:\n") ;
        PrintArray(r, SIZE) ;

        sorted = BubbleSort(r, SIZE) ;
        printf("Sorted array:\n") ;
        PrintArray(sorted, SIZE) ;

        return 0 ;
}

int* BubbleSort(int list[], int size) {
        int temp ;
        for (int i = 1 ; i < size ; ++i) {
                for (int j = i ; j < size ; ++j) {
                        if (list[i-1] > list[j]) {
                                temp = list[j] ;
                                list[j] = list[i-1] ;
                                list[i-1] = temp ;
                        }
                }
        }
        return list ;
}

void PrintArray(int arr[], int length) {
        for (int i = 0 ; i < length ; ++i) {
                printf("%d\n", arr[i]) ;
        }
        printf("\n") ;
}
