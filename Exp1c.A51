			ORG 9000H
			
			
string1:    DB "arc ",0
			
			ORG 9200H

string2:    DB "Loya",0

			ORG 8100H
			
			MOV R7, #00H
			MOV R6, #00H
			MOV A, #0FFH
			MOV DPTR, #9500H
			
			MOVX @DPTR, A

MAINLOOP:
			
			LCALL GETCHARS
			MOV A, R4
			CJNE A, #00H, MLCont 
			
			SJMP endprog


MLCont:
			MOV A, R5
			MOV B, R4
			
			CJNE A, B, NOTEQUAL
			SJMP EQUAL

NOTEQUAL:
			INC R6
			
			SJMP MAINLOOP

EQUAL:
			MOV A, R6
			MOV R3, A
			INC R3; to jump back
EQcont1:
			INC R6
			INC R7
			LCALL GETCHARS
			
			MOV A, R5
			CJNE A, #00H, EQcont2
			SJMP SUBSTRING
EQcont2:
			MOV A, R4
			CJNE A, #00H, EQcont3
			SJMP NOTSUBSTRING
			
EQcont3: 	
			MOV A, R5
			MOV B, R4
			
			CJNE A, B, NOTSUBSTRING
			SJMP EQcont1 

SUBSTRING:
			MOV A, R3
			MOV DPTR, #9500H
			
			MOVX @DPTR, A
			SJMP endprog


NOTSUBSTRING:
			MOV R7, #00H
			MOV A, R3
			
			MOV R6, A
			
			SJMP MAINLOOP

GETCHARS:
			MOV DPH, #90H
			MOV DPL, R7
			MOV A, #0H
			
			MOVC A, @A+DPTR
			MOV R5, A
			MOV DPH, #92H
			MOV DPL, R6
			MOV A, #0H
			MOVC A, @A+DPTR
			MOV R4, A
			RET

endprog: 	SJMP $
			END

			