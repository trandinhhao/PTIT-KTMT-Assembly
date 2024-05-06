; B4: Viet chuong trinh nhap 1 ky tu thuong va in ra ky tu hoa tuong ung

.Model Small                 ; Khoi tao che do bo nho la Small
.Stack 100H                  ; Khoi tao ngan xep voi kich thuoc 100H
.Data
        CLRF DB 13,10, '$'   ; Ki tu xuong dong va ket thuc chuoi
        THONGBAO1 DB "Nhap vao 1 ky tu thuong: $"
        THONGBAO2 DB "Ky tu viet hoa tuong ung la: $"
        KTU DB ?
.Code
Main Proc              ; Thu tuc chinh cua chuong trinh
    
    ; Khoi tao thanh ghi DS 
    
    MOV AX, @Data      ; Tro AX vao dau cua chuong trinh @Data
    MOV DS,AX          ; Tro thanh ghi AX ve dau doan Data
    
    MOV AH, 9          ; Goi ham 9 cua ngat INT21H de in ra 1 xau ki tu
    LEA DX, THONGBAO1  ; Tro den Yeu cau nhap vao 1 ky tu
    INT 21H            ; In ra
    
    MOV AH, 1          ; Goi ham 1 cua ngat INT21H de doc 1 ky tu
    INT 21H            ; Doc ki tu
    SUB AL, 32         ; Chuyen sang ki tu in hoa
    MOV KTU, AL        ; Chuyen vao KTU
    
    MOV AH,9           ; Goi ham 9 cua ngat INT21H de in ra 1 xau ki tu
    LEA DX, CLRF       ; Tro den xuong dong va lui dau dong
    INT 21H            ; In ra
    LEA DX, THONGBAO2  ; Tro den thong bao in ra
    INT 21H            ; In ra
    
    MOV AH, 2          ; Goi ham 2 cua ngat INT21H de in ra 1 ki tu
    MOV DL, KTU        ; Chuyen vao DL
    INT 21H            ; In ra 
    
    ; Ket thuc chuong trinh
    
    MOV AH, 4CH
    INT 21H
Main Endp
END
