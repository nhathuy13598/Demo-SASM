%include "io.inc"
extern _printf
extern _scanf
extern _getch
;scanf("%s",&tenbien)
section .data
    tb1 db "Nhap mot chuoi: ",0
    tb2 db "Chuoi vua nhap la: %s ",0
    fmt db "%s",0
section .bss
    str1 resb 30
section .text
global CMAIN
CMAIN:
   
    ; Xuat tb1
    push dword tb1
    call _printf
    add esp,4
    
    ; Nhap chuoi
    push dword str1
    push dword fmt
    call _scanf
    add esp,8
    
    ; xuat chuoi vua nhap      
    push dword str1
    push dword tb2
    call _printf
    add esp,8
      
    call _getch
    ; Ket Thuc Ham
    xor	eax,eax	
    ret	