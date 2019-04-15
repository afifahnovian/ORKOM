global main
extern printf, fflush, scanf
   
section .data
	scan db "%s %s",0 ; scan string
	printacc db "%d",10,0 ; print output jika benar
	printwo db "tidak ada",10,0 ; print output jika salah

segment .bss
    string resd 51 ; input string dengan ppanjang maks 50
    char resd 2 ; input char yang dicari

section .text

main :
		push char ; baca posisi huruf yang dicari
		push string ; baca string yang di input
		push scan
		call scanf
		add esp ,12
		
		mov ecx,50 ; counter utk string
		mov edi,string; masukkan string di register edi
		mov al,[char] ; masukan char di 
		repne scasb ;repnelooping, untuk membandingkan string, sampai ketemu yang dicari
					;scasb(buar bandingin)cuma bisa pake al,ax,eax,adi
		mov eax, 50
		sub eax, ecx ; posisi d 45, 50-45=5
		mov ebx,0
		cmp ecx, ebx
		je langsung ; kalau membandingkan udah kelar
		
		push eax
		push printacc
		call printf
		jmp exit

langsung:
		push printwo
		call printf
		jmp exit
	
exit:
		push 0
		call fflush
		add esp, 4
		mov eax, 1          ;exit(0)
		mov ebx, 0
		int 0x80
		

