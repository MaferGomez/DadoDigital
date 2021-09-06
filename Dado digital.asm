    #include "p16F628a.inc"    ;incluir librerias relacionadas con el dispositivo
 __CONFIG _FOSC_INTOSCCLK & _WDTE_OFF & _PWRTE_OFF & _MCLRE_OFF & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _CP_OFF    
;configuración del dispositivotodo en OFF y la frecuencia de oscilador
;es la del "reloj del oscilador interno" (INTOSCCLK)     
RES_VECT  CODE    0x0000            ; processor reset vector
    GOTO    START                   ; go to beginning of program
; TODO ADD INTERRUPTS HERE IF USED
MAIN_PROG CODE                      ; let linker place main program
;variables para el contador:
 j equ 0x31
 k equ 0x32
 i equ 6
;inicio del programa: 
START
MOVLW 0x07 ;Apagar comparadores
MOVWF CMCON
BCF STATUS, RP1 ;Cambiar al banco 1
BSF STATUS, RP0 
MOVLW b'00000000' ;Establecer puerto B como salida (los 8 bits del puerto)
MOVWF TRISB 
MOVLW b'00000001' ;Establecer puerto B como salida (los 8 bits del puerto)
MOVWF TRISA
BCF STATUS, RP0 ;Regresar al banco 0

INICIO
    
    BTFSC PORTA, 0
    GOTO $+4
    GOTO $-2
     
    BTFSS PORTA, 0
    GOTO $-4
    MOVLW i
    MOVWF PORTB
    DECFSZ PORTB,i
    BTFSS PORTA, 0
    GOTO $-9 ;BTFSC va a BTFSS PORTA, 0
    GOTO $-4 ;Regresa a MOVWF PORTB 
    ;BTFSC PORTA, 0 ;Salta si PORTA es abajo (Si es arriba sí lo hace)
    ;GOTO $-12 ;BTFSC va a BTFSS PORTA, 0
    ;GOTO $-8 ;Regresa a MOVLW i
    
    
    
    ;$ Instrucción actual
    ; otra forma de escribir el código
    ;MOVLW b'10001101'
    ;MOVWF PORTB
    ;GOTO $
    
    ;2.Enciende segun un boton
    ;BTFSC PORTA,7
    ;Esta en 0 el bit? Si es así omite la siguiente instrucción (salta)
    ;BSF PORTB,7
    ;Prende
    ;BTFSS PORTA,7
    ;Doble candado
    ;BCF PORTB,7
    ;Apaga
   
    ;GOTO $-4
    
    
 
 
 ;BTFSS PORTA,7
 ;GOTO $-1
 ;INCF PORTB
 ;BTFSC PORTA,7
 ;GOTO $-1
 ;GOTO $-5
 
    END