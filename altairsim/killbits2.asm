;
;  KILL THE BIT GAME BY DEAN MCDANIEL, MAY 15, 1975
;
;  OBJECT: KILL THE ROTATING BIT. IF YOU MISS THE LIT BIT, ANOTHER
;          BIT TURNS ON LEAVING TWO BITS TO DESTROY. QUICKLY 
;          TOGGLE THE SWITCH, DON'T LEAVE THE SWITCH IN THE UP
;          POSITION. BEFORE STARTING, MAKE SURE ALL THE SWITCHES
;          ARE IN THE DOWN POSITION.
;
;  MODIFIED BY MIKE DOUGLAS, JULY 2019, TO DEMONSTRATE USE OF THe
;  INCREMENTER/DECREMENTER IN THE 8080, WHICH AS A SIDE EFFECT,
;  DRIVES THE ADDRESS BUS, AND HENCE, THE FRONT PANEL LEDS, DURING
;  THE EXECUTE CYCLE OF 16 BIT INCREMENT AND DECREMENT INSTRUCTIONS.
;
        ORG     0

        LXI     H,0             ;INITIALIZE COUNTER
        MVI     D,080H          ;SET UP INITIAL DISPLAY BIT
        LXI     B,0EH           ;HIGHER VALUE = FASTER
BEG:    INX     D               ;DISPLAY BIT PATTERN ON
        INX     D               ;...UPPER 8 ADDRESS LIGHTS
        INX     D
        DCX     D
        DCX     D
        DCX     D
        DAD     B               ;INCREMENT DISPLAY COUNTER
        JNC     BEG
        IN      0FFH            ;INPUT DATA FROM SENSE SWITCHES
        XRA     D               ;EXCLUSIVE OR WITH A
        RRC                     ;ROTATE DISPLAY RIGHT ONE BIT
        MOV     D,A             ;MOVE DATA TO DISPLAY REG
        JMP     BEG             ;REPEAT SEQUENCE

        END