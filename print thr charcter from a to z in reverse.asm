ORG 100h                    ; Program starts at offset 100h

; Initialize counter to ASCII code for 'Z'
mov cx, 'Z'                 ; CX will hold the current character (starting from 'Z')

print_loop:
    ; Display the character in CX
    mov ah, 02h             ; DOS interrupt to print a character
    mov dl, cl              ; Move the character in CX to DL for printing
    int 21h                 ; Print the character

    ; Print a space after each character for clarity
    mov dl, ' '             ; Space character in ASCII
    int 21h                 ; Print the space

    ;  tDecrementhe character
    dec cx
    cmp cx, 'A'        ; Check if we've printed down to 'A'
    jge print_loop          ; If CX >= 'A', continue the loop

done:
; Exit program                                                  
mov ah, 4Ch                 ; DOS interrupt to exit the program
int 21h
                                                                                                               