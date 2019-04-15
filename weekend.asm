global main
extern printf, fflush, scanf
   
section .data
	scan db "%s",0 ; scan string
	print_weekday db "weekday",10,0 ; print output weekday
	print_weekend db "weekend",10,0 ; print output weekend
	sunday db "Sun",0 ;define hari weekend
	satuday db "Sat",0 ;define hari weekend
	
segment .bss
    string1 resd 10
    string2 resd 10

section .text
main :
	push string1; masukan string 1
	push scan
	call scanf
	add esp,8
	
	mov esi,string1 ; string yang akan dibandingkan
	mov edi,sunday    ;pembanding
	
	CMPSB
	JE benar
	
	mov edi,satuday
	CMPSB
	JE benar
	
	;jika bukan weekend,print weekday
	push print_weekday
	call printf
	add esp,4
	JMP exit

benar :
	push print_weekend
	call printf
	add esp,4
	JMP exit

exit :
	 push 0
    call fflush
    add esp, 4
    mov eax, 1          ;exit(0)
    mov ebx, 0
    int 0x80
    
	

































