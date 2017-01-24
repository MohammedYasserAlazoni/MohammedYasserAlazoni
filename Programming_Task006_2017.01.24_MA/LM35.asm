
_main:

;LM35.c,2 :: 		void main() {
;LM35.c,3 :: 		ADC_Init();
	CALL       _ADC_Init+0
;LM35.c,4 :: 		TRISB=0;
	CLRF       TRISB+0
;LM35.c,5 :: 		PORTB=0;
	CLRF       PORTB+0
;LM35.c,6 :: 		while(1)
L_main0:
;LM35.c,8 :: 		temp=ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _temp+0
	MOVF       R0+1, 0
	MOVWF      _temp+1
;LM35.c,9 :: 		if(temp<40){ portb.B0=1;}else{portb.B0=0;}
	MOVLW      128
	XORWF      R0+1, 0
	MOVWF      R2+0
	MOVLW      128
	SUBWF      R2+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main7
	MOVLW      40
	SUBWF      R0+0, 0
L__main7:
	BTFSC      STATUS+0, 0
	GOTO       L_main2
	BSF        PORTB+0, 0
	GOTO       L_main3
L_main2:
	BCF        PORTB+0, 0
L_main3:
;LM35.c,10 :: 		if(temp>62){ portb.B1=1;}else{portb.B1=0;}
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _temp+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main8
	MOVF       _temp+0, 0
	SUBLW      62
L__main8:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
	BSF        PORTB+0, 1
	GOTO       L_main5
L_main4:
	BCF        PORTB+0, 1
L_main5:
;LM35.c,12 :: 		}
	GOTO       L_main0
;LM35.c,13 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
