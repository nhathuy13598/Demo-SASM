%include "io.inc"
extern _printf
extern _scanf
extern _getch
SECTION .data
	tb1 db "Nhap a: ",0
	tb2 db "Nhap b: ",0
     menu db "-------Menu--------",10,"1.Tinh tong",10,"2.Tinh hieu",10,"3.Tinh tich",10,"4.Tinh thuong",10,"5.Thoat",10,"---------------------",10,"Chon:",0
     ;tb3 db "%d %c %d = %d",0
     tb3 db "Ket qua la : %d",0
	fmt db "%d",0	
SECTION .bss
	a resd 1 ; int a
	b resd 1 ; int b
     	chon resd 1
SECTION .text
global CMAIN
CMAIN:

	;Xuat tb1
	push dword tb1
	call _printf
	add esp,4

	;Nhap a
	push dword a
	push dword fmt
	call _scanf
	add esp,8

	;Xuat tb2
	push dword tb2
	call _printf
	add esp,4

	;Nhap b
	push dword b
	push dword fmt
	call _scanf
	add esp,8
     
     ;Xuat menu
	push dword menu
	call _printf
	add esp,4
     
     ;Nhap chon
	push dword chon
	push dword fmt
	call _scanf
	add esp,8

     ;so sanh gia tri chon
     mov eax, [chon]
     cmp eax,1
     je Tong ; Nhay den Tong khi eax = 1 
     ; e = equal 
     ; l = less
     ; g = greater
     ; z = zero
     ; n = not
     cmp eax,2
     je Hieu 
     cmp eax,3
     je Tich 
     cmp eax,4
     je Thuong 
     jmp KetThuc
 Tong:
     mov eax, [a]
     mov ebx, [b]
     add eax,ebx
     jmp Xuat     
 Hieu:
     mov eax, [a]
     mov ebx, [b]
     sub eax,ebx
     jmp Xuat
 Tich:
     mov eax, [a]
     mov ebx, [b]
     mul ebx
     jmp Xuat
 Thuong:     
     mov eax, [a]
     mov ebx, [b]
     xor edx,edx
     div ebx
 Xuat:
     push eax
    push dword tb3
	call _printf
	add esp,8

KetThuc:		
       call _getch	
	xor	eax,eax		
	ret		