.global _start             @ Entry point for the program

.equ amark, 90            @ Constant for grade A threshold
.equ bmark, 75            @ Constant for grade B threshold
.equ cmark, 50            @ Constant for grade C threshold

_start:
    LDR R5, #99           @ Load the percentage grade into R5 (You can modify this to take input from the command line if needed)
    LDR R6, =amark        @ Load the address of the grade A threshold (amark) into R6
    LDR R7, =bmark        @ Load the address of the grade B threshold (bmark) into R7
    LDR R8, =cmark        @ Load the address of the grade C threshold (cmark) into R8

    @ Check if the percentage grade is greater than or equal to 90 (Grade A)
    CMP R5, R6
    BGE grade_A

    @ Check if the percentage grade is greater than or equal to 75 but less than 90 (Grade B)
    CMP R5, R7
    BGE grade_B

    @ Check if the percentage grade is greater than or equal to 50 but less than 75 (Grade C)
    CMP R5, R8
    BGE grade_C

    @ If none of the conditions above are true, the grade is an F
    LDR R1, =fmessage     @ Load the address of the "Sorry, you got an F." message
    LDR R2, =flen         @ Load the length of the message
    MOV R7, #4            
    SWI 0                 @ Execute the system call

    B end_program         @ Jump to the end of the program

grade_A:
    @ Print "Congratulations! You got an A."
    LDR R1, =amessage     @ Load the address of the "Congratulations! You got an A." message
    LDR R2, =alen         @ Load the length of the message
    MOV R7, #4          
    SWI 0                 @ Execute the system call

    B end_program         @ Jump to the end of the program

grade_B:
    @ Print "Good job! You got a B."
    LDR R1, =bmessage     @ Load the address of the "Good job! You got a B." message
    LDR R2, =blen         @ Load the length of the message
    MOV R7, #4          
    SWI 0                 @ Execute the system call

    B end_program         @ Jump to the end of the program

grade_C:
    @ Print "Not bad, you got a C."
    LDR R1, =cmessage     @ Load the address of the "Not bad, you got a C." message
    LDR R2, =clen         @ Load the length of the message
    MOV R7, #4           
    SWI 0                 @ Execute the system call

end_program:
    MOV R7, #1            
    SWI 0                 @ Terminate the program

.data
amessage:
    .asciz "Congratulations! You got an A. \n"
alen = .-amessage

bmessage:
    .asciz "Good job! You got a B. \n"
blen = .-bmessage

cmessage:
    .asciz "Not bad, you got a C. \n"
clen = .-cmessage

fmessage:
    .asciz "Sorry, you got an F. \n"
flen = .-fmessage
