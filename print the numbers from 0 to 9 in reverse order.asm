ORG 100h                    ; Program starts at offset 100h

; Initialize counter to 9
mov cx, 9                   ; CX will hold the current number (starting from 9)

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

    ; Decrement the counter
    dec cx
    cmp cx, -1              ; Check if we've printed down to 0
    jg print_loop           ; If CX > -1, continue the loop

done:
; Exit program
mov ah, 4Ch                 ; DOS interrupt to exit the program
int 21h
