		
			
			ORG 8100H
			
			CLR P1.0
			CLR P1.1
			CLR P1.2
			CLR P1.3
			
LOOP:
			SETB P1.0
			ACALL DELAY
			CLR P1.0
			SETB P1.1
			ACALL DELAY
			CLR P1.1
			SETB P1.2
			ACALL DELAY
		    CLR P1.2
			SETB P1.3
			ACALL DELAY
			CLR P1.3
			SJMP LOOP

			;1 machine cycle period = 1.085 us
DELAY:		MOV R7, #100d	

CALL1:		MOV R6, #100d
			DJNZ R7, CALL2
			RET
CALL2:		MOV R5, #100d
			DJNZ R6, CALL3
			SJMP CALL1 
CALL3:		DJNZ R5, CALL3
			SJMP CALL2

endprog:	SJMP $
		
			END