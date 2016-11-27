// Part 1 buuble sort
/*
#include <stdio.h>

void bubble(int* list, int length);
int swap(int* list, int j);

int main(void) {
        int a[10] = {1,2,3,4,5,16,16,16,9,10};
        int i;
        bubble(a,10);
        for (i = 0; i<10; i++)
            printf("%d ", a[i]);
        printf("\n");
        return 0;
}


void bubble(int* list, int length)
{
    int i=0, j, flag, temp;
    do
    {
        flag = 0;
        for (j = 0; j < length -i - 1; j++)
        {
            temp = swap(list, j);
            if (flag == 0)
                flag = temp;
        }
        i++;
    }while(flag == 1);
}

int swap(int* list, int j)
{
    int flag = 0, temp;
    if (list[j] < list[j+1])
    {
        temp = list[j];
        list[j] = list[j+1];
        list[j+1] = temp;
        flag = 1;
    }
    return flag;
}
*/
.text
.global _start
_start:
    LDR R10, = LIST
    LDR R6,[R10]     // Load length into R1

MAIN:
    MOV R7, #0      // i = 0
    SUB R6, #1
WHILE: 
          
    MOV R9, #0      // set flag = 0
    ADD R4, R10, #4
    MOV R8, #0      // j = 0
    SUB R5, R6, R7  // length - i

FORLOOP:
    CMP R8, R5     // checks j == length - i
    BEQ END_FORLOOP
    BL SWAP
    ADD R8, #1
    ADD R4, R4, #4
    CMP R9, #0
    MOVEQ R9, R1
    B FORLOOP

END_FORLOOP:
    ADD R7, #1      // i++
    CMP R9, #1
    BEQ WHILE
    
    B END 

END:
    B END
/*  This subroutine checks the element [R4] and [R4 + 4], 
    if [R4] < [R4 + 4], swap [R4] and [R4 + 4].
    input: R4 which points to the current element
    output: R1, flag, set to one if swap happens, otherwise 0
    local: R0, R2
*/
SWAP:
    MOV R1, #0      // set flag equal to zero initially
    LDR R0, [R4]
    LDR R2, [R4, #4]
    CMP R0, R2
    BGE END_SWAP
    MOV R1, #1      // if [R4] < [R4 + 4], set flag to 1
    STR R2, [R4]
    STR R0, [R4,#4]
END_SWAP:
    MOV PC, LR
    
    

    
    
LIST: .word 10, 1400, 45, 23, 5, 3, 8, 17, 4, 20, 33