; -----------------------------------------------------------------------
; Template source file generated by piklab
    #include <p12f615.inc>

; -----------------------------------------------------------------------
; Configuration bits: adapt to your setup and needs
    __CONFIG _INTRC_OSC_NOCLKOUT & _WDT_OFF & _PWRTE_OFF & _MCLRE_OFF & _CP_OFF & _IOSCFS_4MHZ & _BOR_ON

; -----------------------------------------------------------------------
; Változó értékadás
INT_VAR UDATA_SHR
w_saved      RES 1 ; variable used for context saving
status_saved RES 1 ; variable used for context saving

var1         RES 1 ; példa változó
ido1	RES 1
ido2	RES 1
ido3	RES 1


; -----------------------------------------------------------------------
; reset vector
STARTUP CODE 0x000

    movlw	b'11111000'
    bsf		STATUS,RP0
    movwf	TRISIO
    clrf	ANSEL
    bcf		STATUS,RP0
focik    
    movlw	b'00000110'
    movwf	GPIO
    call	idoz1
    movlw	b'00000010'
    movwf	GPIO
    call	idoz1
    movlw	b'00000100'
    movwf	GPIO
    call	idoz1
    movlw	b'00000111'
    movwf	GPIO
    movlw	0x08
    movwf	ido2
    call	idoz1c
    goto	focik

idoz1
    movlw	0x04
    movwf	ido2
idoz1c
    incfsz	ido1,f
    goto	idoz1c
    decfsz	ido2
    goto	idoz1c
    return

END
