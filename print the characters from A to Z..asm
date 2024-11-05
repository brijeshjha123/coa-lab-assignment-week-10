ORG 100h                    ; Program starts at offset 100h (COM file format)

; Initialize register with ASCII code for 'A'
MOV CX, 'A'                 ; Start with ASCII code for 'A'

print_loop:
    MOV DL, CL              ; Move the current character to DL for printing
    MOV AH, 02h             ; DOS interrupt function 02h to print a character
    INT 21h                 ; Call DOS to print the character in DL

    ; Print a space after each letter for readability
    MOV DL, ' '             ; ASCII code for space
    INT 21h                 ; Call DOS to print the space

    ; Increment to the next character
    INC CX                  ; Move to the next letter
    CMP CX, 'Z' + 1         ; Check if we have reached after 'Z'
    JNE print_loop          ; If not, repeat the loop

done:
    ; Exit program
    MOV AH, 4Ch             ; DOS interrupt function 4Ch to terminate the program
    INT 21h                 ; Call DOS to exit
