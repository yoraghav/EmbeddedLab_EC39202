				
				
				
				
		
			ORG 9000H
			DB 3FH, 06H, 5BH, 4FH, 66H, 6DH, 7DH, 07H, 7FH, 67H;
			
			ORG 8100H
			MOV A,#80H;
			MOV DPTR,#0E803H;
			MOVX @DPTR,A;
			
START:		MOV B, #00H;
LOOP:   	MOV DPTR, #9000H;
			MOV A, B;
			MOVC A, @A+DPTR;
			MOV DPTR, #0E800H;
			MOVX @DPTR, A
			ACALL DELAY;
			MOV R0, B;
			CJNE R0, #09H, INCR
			SJMP START
INCR:		INC B;
CONT:		SJMP LOOP
			
			
DELAY:		MOV R7, #50d			
L1:			MOV R6, #100d
			DJNZ R7, L2
			RET
L2:			MOV R5, #100d
			DJNZ R6, L3
			SJMP L1 
L3:			DJNZ R5, L3
			SJMP L2
			
			
								
			END