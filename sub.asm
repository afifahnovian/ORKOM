global main

section .data
    a       dd  25
    b       dd  20

section .text
    main:
            mov eax, 12
            mov ecx, 13

            add eax, ecx                ; eax = 25
            sub [a],eax;
            sub ecx,[b];
            
            ; exit(0)
            mov eax, 1
            mov ebx, 0
            int 0x80

