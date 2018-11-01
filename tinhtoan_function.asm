%include "io.inc"
extern _printf
extern _scanf
extern _getch
section .data
    tb1: db "Nhap a: ",0
    tb2: db "Nhap b: ",0
    tb3: db "%d %c %d = %d",10,0
    menu: db "-------Menu--------",10,"1.Tinh tong",10,"2.Tinh hieu",10,"3.Tinh thuong",10,"4.Tinh tich",10,"5.Thoat",10,"---------------------",10,"Chon:",10,0
    fmt: db "%d"
section .bss
    a: resd 1
    b: resd 1
    c: resd 1
    chon: resd 1   
section .text
global CMAIN
CMAIN:  
    ; Xuat tb1
    push tb1
    call _printf
    add esp,4 
    ; Nhap a
    push a
    push fmt
    call _scanf
    add esp,8   
    ; Xuat tb2
    push tb2
    call _printf
    add esp,4   
    ; Nhap b
    push b
    push fmt
    call _scanf
    add esp,8  
    ; Xuat menu
    push menu
    call _printf
    add esp,4    
    ;Nhap gia tri chon
    push chon
    push fmt
    call _scanf
    add esp,8  
    ; so sanh gia tri chon
    mov ecx,[chon]  ; can chuyen gia tri chon sang ecx de thuc hien ham cmp  
    cmp ecx,1 ; so sanh chon voi 1
    je TinhTong ; Neu bang thi nhay den TinhTong   
    ; Sinh Vien tu code tiep de thuc hien cac truong hop khac
    
    jmp Thoat ; Nguoc lai Thoat
    
 TinhTong:
    push dword [a]
    push dword [b]
    call Tong
    add esp,8
    ; Xuat ket qua
    push eax
    push dword [b]
    push '+'
    push dword [a]    
    push tb3
    call _printf
    add esp,20
 Thoat:   
    call _getch
    xor eax, eax ; normal, no error, return value 
    ret
      
;============= Function ==================
 global Tong
 Tong:  
    push ebp ; set up stack frame 
    mov ebp, esp   
    sub esp,64
    ;Lay tham so thu nhat
    mov eax,[ebp + 8]
    ;Lay tham so thu hai
    mov ebx,[ebp + 12]          
    add eax,ebx ; eax is return value     
    add esp,64 ; clear stack
    mov esp, ebp ; takedown stack frame 
    pop ebp ; same as "leave" op 
    ;xor eax, eax ; normal, no error, return value 
    ret
      
      
