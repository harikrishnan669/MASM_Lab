DATA SEGMENT 
M1 DB 13,10,"ENTER 2 NUMBERS  $" 
M2 DB 13,10,"PRODUCT IS $" 
DATA ENDS 
 

PRTMSG MACRO MESSAGE
    LEA DX, MESSAGE
    MOV AH,09
    INT 21H
    ENDM
GETDCM MACRO
    MOV AH, 01
    INT 21H
    SUB AL, 30H
    71
    ENDM

CODE SEGMENT 
ASSUME CS:CODE , DS:DATA 
 START:MOV AX,DATA 
        MOV DS,AX 
        PRTMSG M1
        GETDCM
        MOV BL,AL 
        GETDCM
        MOV AH,00H 
        MUL BL 
        AAM 
        MOV BX,AX 
	 	PRTMSG M2
        MOV DL,BH 
        OR DL,30H 
        MOV AH,02H 
        INT 21H 
        MOV DL,BL 
        ADD DL,30H 
        INT 21H 
        MOV AH,4CH 
        INT 21H 
 
CODE ENDS 
END START