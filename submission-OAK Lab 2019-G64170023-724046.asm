global main
extern printf ; untuk makai fungsi print
extern fflush
section .data
	msg db 'Hello world!',10, 0 ; 0 untuk mengisi akhir string NULL
	
section .text 

main:
	push msg ; printf (msg)
	call printf ; panggil fungsi printf
	add esp, 4 ; karena di push 1 kali, kalo n kali esp n*4
	push 0
	call fflush ; fflush(NULL)
	add esp, 4
exit
	mov eax, 1 		; exit(0)
	mov ebx, 0
	int 0x80
