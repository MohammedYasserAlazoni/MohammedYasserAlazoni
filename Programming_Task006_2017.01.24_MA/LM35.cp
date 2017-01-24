#line 1 "C:/Users/moh64_000/Desktop/Programming_Task006_2017.01.24_MA/LM35.c"
 int temp;
 void main() {
 ADC_Init();
 TRISB=0;
 PORTB=0;
 while(1)
 {
 temp=ADC_Read(0);
 if(temp<40){ portb.B0=1;}else{portb.B0=0;}
 if(temp>62){ portb.B1=1;}else{portb.B1=0;}

 }
}
