global    _start

          section   .text
_start:   mov       rax, 1                  ; system call for write
          mov       rdi, 1                  ; file handle 1 is stdout
          mov       rsi, message            ; address of string to output
          mov       rdx, 23                 ; number of bytes
          syscall                           ; invoke operating system to do the write
          mov       rax, 60                 ; system call for exit
          mov rdi,  123                     ; exit code 123
          syscall                           ; invoke operating system to exit

          section   .data
message:  db        "Mary had a little lamb", 10      ; note the newline at the end
