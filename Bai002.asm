; B2: Viet chuong trinh cho phep nhap 1 ky tu va in ra 1 ky tu

.Model Small   ; Khoi tao che do bo nho la Small
.Stack 100H    ; Khoi tao kich thuoc cua ngan xep
.Data   
        ; Khoi tao bien va cac hang
        CLRF DB 13,10,'$'                   ; Xuong dong va lui vao dau dong
        THONGBAO1 DB "Nhap vao 1 ky tu: $"  ; Yeu cau nhap vao 1 ky tu
        THONGBAO2 DB "Ky tu da nhap la: $"  ; Thong bao in ra
        KTU DB ?
.Code
Main Proc      ; Thu tuc ham chinh chuong trinh
             
    ; Khoi tao thanh ghi DS         
             
    MOV AX, @Data      ; Tro AX vao dau cua chuong trinh @Data
    MOV DS, AX         ; Tro thanh ghi AX ve dau doan Data
    
    MOV AH, 9          ; Goi ham 9 cua ngat INT21H de in ra 1 xau ki tu
    LEA DX, THONGBAO1  ; Tro den Yeu cau nhap vao 1 ky tu
    INT 21H            ; In ra
    
    LEA DX, CLRF       ; Tro den xuong dong va lui dau dong
    INT 21H            ; In ra
    
    MOV AH, 1          ; Goi ham 1 cua ngat INT21H de doc 1 ky tu
    INT 21H            ; Doc ki tu
    MOV KTU, AL         ; Chuyen vao RA
    
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
                       
