; Demo: Viet ham nhap - xuat mang 1 chieu cac so nguyen
%include "io.inc"
extern _printf
extern _scanf
extern _getch
section .data
    tb1: db "Nhap n:",0
    tb2: db 10,"a[%d]: ",0
    tb3: db 10,"Mang vua nhap la: ",0  ;10: la ky tu xuong dong, 0: la ket thuc chuoi
    fmt1: db "%d",0 ; dung cho ham scanf
    fmt2: db "%3d",0; dung cho ham printf khi xuat
    
section .bss
    array: resd 400
    n: resd 1

section .text

global CMAIN ; Khai bao ham main 
CMAIN:
    ;Xuat tb1
    push tb1
    call _printf
    add esp,4
    
    ;Nhap n
    push n
    push fmt1
    call _scanf
    add esp,8 ;xoa stack sau khi goi ham, 
    ;luc nay khi goi ham minh push 2 tham so vao la n va fmt moi cai 4 byte? OKE hieu roi thay
    
    ; goi ham Nhap Mang
    push dword [n]
    push array
    call NhapMang
    add esp,8
    
    ;xuat tb3
    push tb3
    call _printf
    add esp, 4
    ;goi ham Xuat Mang
    push dword [n] ;[n] la gia tri tai dia chi n, phai co tu dword dang truoc de no biet lay 4 byte tu dia chi n ok hieu roi
    push array
    call XuatMang
    add esp,8

    call _getch    
KetThuc:
    mov esp, ebp ; takedown stack frame 
    pop ebp ; same as "leave" op 
    xor eax, eax ; normal, no error, return value 
    ret
      
      
    
; ==================== Cac ham xu ly =======================
;Ham Nhap Mang
global NhapMang
NhapMang:        
    push ebp ; set up stack frame 
    mov ebp, esp   
    sub esp,64

    ;Lay tham so array
    mov ebx,  [ebp + 8] ; ebp + 8 la dia chi chua tham so thu nhat
    ;Lay tham so n
    mov ecx,  [ebp + 12]
    
   
    ;khoi tao i = 0
    mov esi,0
Nhap:
    ; xuat nhap a[i]
    ; backup thanh  ghi
     push ecx
     push ebx
    
    
    push esi
    push tb2
    call _printf
    add esp, 8
    
     ; restore thanh ghi
     pop ebx
     pop ecx
     
     ; backup thanh ghi
     push ecx
     push ebx     
    
    ;Nhap a[i]
    push ebx
    push fmt1
    call _scanf
    add esp, 8
    
   ; restore Thanh ghi
    pop ebx
    pop ecx
    
    
    ;Tang dia chi mang
    add ebx,4
    ; Tang chi so
    inc esi
    LOOP Nhap ; Lenh loopz co tac dung moi lan lap giam ecx cho den khi ecx = 0
    
    
    
KTHamNhap:
    mov esp, ebp ; takedown stack frame 
    pop ebp ; same as "leave" op 
    xor eax, eax ; normal, no error, return value 
    ret
      
      
    
  ; Ham Xuat Mang
  
    
global XuatMang
XuatMang:
    push ebp ; set up stack frame 
    mov ebp, esp   
    sub esp,64

    ; Code tai day
     ;Lay tham so array
    mov ebx,  [ebp + 8] ; ebp + 8 la dia chi chua tham so thu nhat
    ;Lay tham so n
    mov ecx,  [ebp + 12]
Xuat:
    ; xuat nhap a[i]
    ; backup thanh  ghi
     push ecx
     push ebx
    
    ;print a[i]
    push dword [ebx]
    push fmt2
    call _printf
    add esp, 8
    
     ; restore Thanh ghi
    pop ebx
    pop ecx
    
    ;Tang dia chi mang
    add ebx,4  
   
    LOOP Xuat ; Lenh loopz co tac dung moi lan lap giam ecx cho den khi ecx = 0
    
    
KTHamXuat:
    xor eax, eax ; normal, no error, return value 
    ret
      