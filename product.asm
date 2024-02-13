global _start

section .bss
    wh resb 4            ; width and height input
    width resb 1         ; width variable on its own
    height resb 1        ; height variable on its own
	counter resd 1       ; counter variable to store product

section .data
    prompt db "Enter a single digit width and length (separated by a space):", 10
    star db '*', 0       ; star!!!!
    newline db 10, 0     ; newline after each row is printed

section .text
_start:
    ;display prompt

	mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 60
    int 0x80

    ;reading input for wh variable
    mov eax, 3
    mov ebx, 0
    mov ecx, wh
    mov edx, 4
    int 0x80

    ; null input (had formatting problems in linux, this seemed to fix it)
    mov byte [wh+3], 0

    ; convert w to integer
    movzx eax, byte [wh]
    sub eax, '0'
    mov [width], al

    ; Convert h to integer
    movzx eax, byte [wh+2]
    sub eax, '0'
    mov [height], al

    ; display the stars
    mov al, [height]
    test al, al

    jz end_program        ; leave if height=0
    mov esi, eax          ; Move height into esi for outer loop counter

outer_loop:
    push esi              ; Save outer loop counter
    mov al, [width]
    test al, al
    jz end_program        ; Exit if width is 0
    mov edi, eax          ; Move width into edi for inner loop counter

inner_loop:
    ; Display a star
    mov eax, 4
    mov ebx, 1
    mov ecx, star
    mov edx, 1
    int 0x80

    dec edi               ; Decrement the inner loop counter
    jnz inner_loop        ; Continue inner loop if not zero

    ; Display a newline after finishing a row
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    pop esi               ; Restore outer loop counter
    dec esi               ; Decrement the outer loop counter
    jnz outer_loop        ; Continue outer loop if not zero

end_program:

	;im doing the product here because for some stupid reason it keeps interferring with the loops and im going crazy

	movzx eax, byte [width]  ; width to eax
	movzx ebx, byte [height] ; height to ebx
	imul ebx                 ; multiply!!!!!
	mov [counter], eax       ; store in counter variable

    ; actually exiting the program now with my product
    mov eax, 1
    mov ebx, [counter] ;exit with counter
    int 0x80

