; B1: Viet chuong trinh hop ngu in ra loi chao Tieng Anh & Tieng Viet

.Model Small   ; Khoi tao che do bo nho la Small
.Stack 100H    ; Khoi tao kich thuoc cua ngan xep 
.Data   
        ; Khoi tao bien va cac hang
        CLRF DB 13,10, '$'   ; Xuong dong va lui vao dau dong
        ENG DB "Hello$"     ; Loi chao bang Tieng Anh
        VIE DB "Xin Chao$"  ; Loi choa bang Tieng Viet
.Code
Main Proc           ; Thu tuc ham chinh chuong trinh
    
    ; Khoi tao thanh ghi DS 
    
    MOV AX, @Data   ; Tro AX vao dau cua chuong trinh @Data
    MOV DS,AX       ; Tro thanh ghi AX ve dau doan Data
    
    MOV AH, 9       ; Goi ham 9 cua ngat INT21H de in ra 1 xau ki tu
    
    LEA DX, ENG     ; Tro den loi chao Tieng Anh
    INT 21H         ; In ra 
    
    LEA DX, CLRF    ; Tro den xuong dong va lui dau dong
    INT 21H         ; In ra
     
    LEA DX, VIE     ; Tro den loi chao Tieng Viet
    INT 21H         ; In ra
    
    ; Ket thuc chuong trinh
    
    MOV AH, 4CH
    INT 21H 
    
Main Endp
END
    
