.MODEL SMALL
.STACK 100H
.DATA

CR EQU 0DH
LF EQU 0AH

MSG1 DB 'ENTER A LOWER CASE LETTER: $'
MSG2 DB 0DH,0AH, 'IN UPPER CASE ITS IS: '
CHAR DB ?,'$'

.CODE

MAIN PROC
    ;INITALIZE DS
    MOV AX, @DATA
    MOV DS,AX
    
    ;print user prompt
    LEA DX,MSG1
    MOV AH,9
    INT 21H
   
    ;input a char and cover to upper case
    MOV AH,1
    INT 21H
    SUB AL, 20H
    MOV CHAR, AL
    
    ;display on the next line
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    
    ;EXIT
    MOV AH,4CH
    INT 21H
    
MAIN ENDP
    END MAIN