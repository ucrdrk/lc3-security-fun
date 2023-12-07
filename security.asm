.ORIG x3000

LEA R1, src1_str
LEA R2, dst_str
JSR strcpy
LEA R1, dst_STR
JSR strlen

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

strlen 

AND R0, R0, #0
STRLEN_LOOP
LDR R2, R1, #0
BRz STRLEN_RET
ADD R0, R0, #1
ADD R1, R1, #1
BR STRLEN_LOOP
STRLEN_RET
RET

.END

.ORIG x3100
strcpy

STRCPY_LOOP 
LDR R3, R1, #0
BRz RETURN
STR R3, R2, #0
ADD R1, R1, #1
ADD R2, R2, #1
BR STRCPY_LOOP

RETURN
RET
.END