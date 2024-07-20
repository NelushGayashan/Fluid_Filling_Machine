P1_0 BIT 90H      ; Start button
P1_1 BIT 91H      ; Presence of an empty bottle at the filling point
P1_2 BIT 92H      ; Cylinder 1 empty status
P1_3 BIT 93H      ; Cylinder 2 empty status
P1_4 BIT 94H      ; Empty bottle detection
P1_5 BIT 95H      ; Maximum filling point
P1_6 BIT 96H      ; Correct type of bottle
P1_7 BIT 97H      ; Bottle opening free check
P2_0 BIT 0A0H     ; Valve control for cylinder 1
P2_1 BIT 0A1H     ; Valve control for cylinder 2
P2_2 BIT 0A2H     ; Cylinder 1 status
P2_3 BIT 0A3H     ; Cylinder 2 status
P2_4 BIT 0A4H     ; Motor control
P2_5 BIT 0A5H     ; Alarm control
P3_1 BIT 0B1H     ; General control bit
P3_2 BIT 0B2H     ; General control bit
P3_3 BIT 0B3H     ; General control bit

ORG 100H          ; Program start address

; Initialize registers and ports
MOV R0, #0        ; Initialize rejected bottles counter
MOV R1, #0        ; Initialize accepted bottles counter
SETB P1_0         ; Initialize start button

; Main program loop
L1: JNB P1_0, L1      ; Wait until the start button is pressed
L4: CLR P2_4          ; Start motor
    ACALL DELAY1      ; Call delay subroutine

L2: JNB P1_1, L2      ; Wait until an empty bottle is detected at the filling point
    SETB P2_4         ; Stop motor
    ACALL DELAY1      ; Call delay subroutine

    JNB P1_6, L3      ; Check for correct type of bottle
    JNB P1_7, L3      ; Check if the bottle opening is free
    JNB P1_2, L5      ; Check if cylinder 1 is empty
    CLR P2_2          ; Clear cylinder 1 status bit
    JNB P1_3, L9      ; Check if cylinder 2 is empty
    CLR P2_3          ; Clear cylinder 2 status bit
    CLR P2_5          ; Clear alarm
    CLR P3_1          ; Clear general control bit

; Rejected bottles handling
L3: ACALL COUNT_REJECTED

; Cylinder 1 filling process
L5: JNB P1_4, L6      ; Wait until an empty bottle is detected
    CLR P2_0          ; Start filling from cylinder 1
    ACALL DELAY2      ; Call longer delay subroutine
L8: SETB P2_0         ; Stop filling from cylinder 1
    ACALL COUNT_ACCEPTED

L6: CLR P2_0          ; Clear valve control for cylinder 1
L7: JNB P1_5, L7      ; Wait until maximum filling point is reached
    SJMP L8           ; Jump to complete filling

; Cylinder 2 filling process
L9: JNB P1_4, L10     ; Wait until an empty bottle is detected
    CLR P2_1          ; Start filling from cylinder 2
    ACALL DELAY2      ; Call longer delay subroutine
L12: SETB P2_1        ; Stop filling from cylinder 2
    ACALL COUNT_ACCEPTED

L10: CLR P2_1         ; Clear valve control for cylinder 2
L11: JNB P1_5, L11    ; Wait until maximum filling point is reached
    SJMP L12          ; Jump to complete filling

; Subroutines

COUNT_REJECTED:
    INC R0            ; Increment rejected bottles counter
    SJMP L4           ; Restart the process

COUNT_ACCEPTED:
    INC R1            ; Increment accepted bottles counter
    SJMP L4           ; Restart the process

DELAY1:               ; Short delay subroutine
    MOV R0, #20       ; Outer loop count
S2: MOV R1, #255      ; Inner loop count
S1: DJNZ R1, S1       ; Decrement R1 until zero
    DJNZ R0, S2       ; Decrement R0 until zero
    RET               ; Return from subroutine

DELAY2:               ; Longer delay subroutine
    MOV R0, #2        ; Outer loop count
S6: MOV R1, #255      ; Inner loop count
S5: MOV R2, #255      ; Nested inner loop count
S4: DJNZ R2, S4       ; Decrement R2 until zero
    DJNZ R1, S5       ; Decrement R1 until zero
    DJNZ R0, S6       ; Decrement R0 until zero
    RET               ; Return from subroutine

END                   ; End of program
