extern scanf,fflush,printf
global main
section .data
    input db "%d %d %d %d", 0 ; variabel untuk input
    output db "%d", 10 ,0; 
    n db 4 ;jumlah bilangan yg dicari rata2nya
 
section .bss
    a resd 1 ; variabel input
    b resd 1 ; variabel input
    c resd 1
    d resd 1
    
section .text
	main 
	;scanf variabel
		push a
		push b
		push c
		push d
		push input
		call scanf
		add esp , 20 ; 5 kali push 5x4=20
		
	;scanf input
		mov eax ,[a]
		mov ebx ,[b]
		mov ecx ,[c]
		mov edx ,[d]
	;jumlahin semua input	
		add eax,ebx
		add eax,ecx
		add eax,edx
		
		cdq ; untuk me-nolkan edx,lalu digunakan utk menyimpan hasil modulo di edx
		div dword [n] ; bagi jumlah bilangan dengan n
	;print nilai 
		push eax ; push nilai eax yang nyimpen nilai rata2
		push output
		call printf
		add esp,8
		
	;print 
		push 0
		call fflush
		add esp ,4
	;exit
		mov eax,1
		mov ebx,0
		int 0x80
		
		
		
		
		
		
