			;ORG 8100H;
			ORG 9000H
TABLE:		DB 0,1,1,0,1,0,0,1,1,0,0,1,0,1,1,0
			LJMP START
			
			ORG 0FFF3H
			LCALL BLINK
			RETI
			
			ORG 8100H
			
START:		MOV DPH, #90H;
			MOV IE, #10000100B;
			
			
LOOP:		MOV DPL, #0H;
			MOV B, #0H
			MOV R0, #0FH;
			
innerloop:	MOV A, #0H
			MOVC A, @A+DPTR
			MOV P1, B
			JB ACC.0, SETBIT
			CLR P1.4
		    INC B
			INC DPL
			ACALL DELAY
			
			DJNZ R0, innerloop
			SJMP LOOP
			
			
SETBIT:		SETB P1.4
			INC B
			INC DPL
			ACALL DELAY
			DJNZ R0, innerloop
			SJMP LOOP

BLINK:		MOV R0,#0H
			MOV B, #0H
			MOV DPL, #0H;
			MOV P1, #0FFH
			ACALL DELAY
			MOV P1, #0H
			ACALL DELAY
			RET
			
DELAY:		MOV R7, #100d			
L1:			MOV R6, #100d
			DJNZ R7, L2
			RET
L2:			MOV R5, #100d
			DJNZ R6, L3
			SJMP L1 
L3:			DJNZ R5, L3
			SJMP L2
			
ENDPROG:	SJMP $
			END