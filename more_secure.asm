.ORIG x3000

LEA R1, src3_str
LEA R2, dst_str
ADD R3, R3, #10
JSR strncpy

LEA R1, dst_STR
AND R2, R2, #0
ADD R2, R2, #10
JSR strnlen

HALT

src1_str .STRINGZ "Allan"
src2_str .STRINGZ "Allan Harvey Knight"
src3_str .FILL x53
         .FILL x54
         .FILL x52
         .FILL x4F
         .FILL x46
         .FILL x44
         .FILL x45
         .FILL x41
         .FILL x54
         .FILL x48
         .FILL xE002
         .FILL xF022
         .FILL xF025
         .FILL x70
         .FILL x77
         .FILL x6E
         .FILL x65
         .FILL x64
         .FILL x21
         .FILL x0
dst_str .BLKW 10

strnlen 

AND R0, R0, #0
NOT R3, R2
ADD R3, R3, #1
STRLEN_LOOP
ADD R4, R0, R3
BRzp STRLEN_RET
LDR R2, R1, #0
BRz STRLEN_RET
ADD R0, R0, #1
ADD R1, R1, #1
BR STRLEN_LOOP
STRLEN_RET
RET

.END

.ORIG x3100
strncpy

AND R4, R4, #0
NOT R3, R3
ADD R3, R3, #1

STRCPY_LOOP 
ADD R5, R4, R3
BRzp RETURN
LDR R6, R1, #0
BRz RETURN
STR R6, R2, #0
ADD R4, R4, #1
ADD R1, R1, #1
ADD R2, R2, #1
BR STRCPY_LOOP

RETURN
RET
.END