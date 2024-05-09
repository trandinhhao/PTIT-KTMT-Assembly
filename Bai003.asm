; B3: Viet chuong trinh nhap vao 1 chuoi ki tu va in ra chuoi ki tu do

.Model Small       ; Khoi tao che do bo nho la Small
.Stack 100H        ; Khoi tao kich thuoc cua ngan xep
.Data   
        ; Khoi tao bien va cac hang
        CLRF DB 13,10, '$'           ; Xuong dong va lui vao dau dong
        THONGBAO1 DB "Nhap vao xau ki tu: $"
        THONGBAO2 DB "Xau ki tu ban vua nhap la: $"
        CHUOI DB 100 dup ('$')       ; Khoi tao chuoi 100 ky tu voi gtri mac dinh la $
.Code
Main Proc               ; Thu tuc ham chinh chuong trinh
    
    ; Khoi tao thanh ghi DS
    
    MOV AX, @Data       ; Tro AX vao dau cua chuong trinh @Data
    MOV DS, AX          ; Tro thanh ghi AX ve dau doan Data
    
    MOV AH, 9           ; Goi ham 9 cua ngat INT21H de in ra 1 xau ki tu
    LEA DX, THONGBAO1   ; Tro den Yeu cau nhap vao 1 xau ky tu
    INT 21H             ; In ra
    
    LEA DX, CLRF        ; Tro den xuong dong va lui dau dong
    INT 21H             ; In ra
    
    MOV AH,10           ; Goi ham 10 cua ngat INT21H de doc 1 xau ky tu
    LEA DX, CHUOI       ; Tro den chuoi
    INT 21H             ; Nhap vao
    
    
    MOV AH, 9           ; Goi ham 9 cua ngat INT21H de in ra 1 xau ki tu
    
    LEA DX, CLRF        ; Tro den xuong dong va lui dau dong
    INT 21H             ; In ra
    
    LEA DX, THONGBAO2   ; Tro den Thong bao in ra 1 xau ky tu
    INT 21H             ; In ra
    
    LEA DX, CHUOI+2     ; Tro den phan chuoi bat dau tu vi tri 2 ki tu dau la so luong ky tu nhap vao)
    INT 21H             ; In ra   
    
    ; Ket thuc chuong trinh
    
    MOV AH, 4CH
    INT 21H
Main Endp
END
    
     
    
    
    
     
