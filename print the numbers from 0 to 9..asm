ORG 100h                    ; Program starts at offset 100h

; Initialize counter to 0
mov cx, 0                   ; CX will hold the current number (0 to 9)

print_loop:
    ; Convert the number in CX to ASCII and display it
    mov ah, 02h             ; DOS interrupt to print a character
    add cl, '0'             ; Convert digit to ASCII
    mov dl, cl              ; Move ASCII digit to DL for printing
    int 21h                 ; Print the character

    ; Print a space after each number for clarity
    mov dl, ' '             ; Space character in ASCII
    int 21h                 ; Print the space

    ; Restore CX to its numeric value for the loop
    sub cl, '0'

    ; Increment the counter
    inc cx
    cmp cx, 10              ; Check if we've printed 0 to 9
    jl print_loop           ; If CX < 10, continue the loop

done:
; Exit program
mov ah, 4Ch                 ; DOS interrupt to exit the program
int 21h
