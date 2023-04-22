
			ORG 9000H;
			DB 3FH, 06H, 5BH, 4FH, 66H, 6DH, 7DH, 07H, 7FH, 67H;

			ORG 9200H;
			DB 3FH, 06H, 5BH;
			

			; Activating the output port
			ORG 8100H	
			MOV A,#80H;
			MOV DPTR,#0E803H;
			MOVX @DPTR,A;
			
			; INITIALIZING THE TIMER
			MOV IE, #83H;
			MOV TMOD, #01H;
			MOV TL0, #00H;
			MOV TH0, #00H;
			
			; Loop for the oscillator
			MOV R1, #00H;
INNERSTART:	MOV R0, #00H;
			
OSCINIT:	MOV R7, #08H;
			SETB TR0
OSC:    	
			MOV DPTR, #0E801H;
			MOV A, #0FFH
			MOVX @DPTR, A;
			
 			MOV DPTR, #9000H;
			MOV A, R0;
			MOVC A, @A+DPTR;
			MOV DPTR, #0E800H;
			MOVX @DPTR, A
			
			MOV DPTR, #0E801H;
			MOV A, #0FDH
			MOVX @DPTR, A;
			
			
			MOV DPTR, #0E801H;
			MOV A, #0FFH
			MOVX @DPTR, A;
			
 			MOV DPTR, #9200H;
			MOV A, R1;
			MOVC A, @A+DPTR;
			MOV DPTR, #0E800H;
			MOVX @DPTR, A
			
			MOV DPTR, #0E801H;
			MOV A, #0FBH; selecting maximum significant display
			MOVX @DPTR, A;
			
			JB TF0, REPEAT
			SJMP OSC
		
EXIT:		
			CJNE R0, #09H, INCR0
			CJNE R1, #02H, INCR1
			MOV R1, #00H
			SJMP INNERSTART
			
INCR1:      INC R1;
			SJMP INNERSTART
			
INCR0:		INC R0;

CONT:		SJMP OSCINIT

REPEAT:     CLR TR0
			CLR TF0
			SETB TR0
			DJNZ R7, OSC
			SJMP EXIT

			END
			
			
			
			
	
			
			
			