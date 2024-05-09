; B5: Viet chuong trinh nhap 1 chuoi ky tu, in ra viet hoa va viet thuong  

.Model Small     ; Khoi tao che do bo nho la Small
.Stack 100H      ; Khoi tao kich thuoc cua ngan xep
.Data   
        ; Khoi tao bien va cac hang
        CLRF DB 13,10, '$'                         ; Xuong dong va lui vao dau dong
        THONGBAO1 DB "Nhap vao xau ki tu: $"       ; Thong bao yeu cau nhap vao 1 xau ki tu
        THONGBAO2 DB "Xau o dang viet hoa: $"      ; Thong bao in ra xau viet hoa tuong ung
        THONGBAO3 DB "Xau o dang viet thuong: $"   ; Thong bao in ra xau viet thuong tuong ung
        XAU DB 100 DUP ('$')                       ; Khoi tao chuoi 100 ky tu voi gtri mac dinh la $
.Code                                              
Main Proc                    ; Thu tuc ham chinh chuong trinh
    
    ; Khoi tao thanh ghi DS
    
    MOV AX, @Data            ; Tro AX vao dau cua chuong trinh @Data
    MOV DS, AX               ; Tro thanh ghi AX ve dau doan Data
    
    MOV AH, 9                ; Goi ham 9 cua ngat INT21H de in ra 1 xau ki tu
    LEA DX, THONGBAO1        ; Tro den Yeu cau nhap vao 1 xau ky tu
    INT 21H                  ; In ra
    LEA DX, CLRF             ; Tro den xuong dong va lui dau dong
    INT 21H                  ; In ra
    
    MOV AH, 10               ; Goi ham 10 cua ngat INT21H de doc 1 xau ky tu
    LEA DX, XAU              ; Tro den chuoi
    INT 21H                  ; Nhap vao chuoi
    
    MOV AH, 9                ; Goi ham 9 cua ngat INT21H de in ra 1 xau ki tu
    LEA DX, CLRF             ; Tro den xuong dong va lui dau dong
    INT 21H                  ; In ra
    LEA DX, THONGBAO2        ; Tro den Thong bao in ra xau viet hoa tuong ung
    INT 21H                  ; In ra
    LEA DX, CLRF             ; Tro den xuong dong va lui dau dong
    INT 21H                  ; In ra
    CALL INHOA               ; Chuyen toi ham INHOA
    
    MOV AH, 9                ; Goi ham 9 cua ngat INT21H de in ra 1 xau ki tu
    LEA DX, CLRF             ; Tro den xuong dong va lui dau dong
    INT 21H                  ; In ra
    LEA DX, THONGBAO3        ; Tro den Thong bao in ra xau viet thuong tuong ung
    INT 21H                  ; In ra
    LEA DX, CLRF             ; Tro den xuong dong va lui dau dong
    INT 21H                  ; In ra
    CALL INTHUONG            ; Chuyen toi ham INTHUONG
    
    ; Ket thuc chuong trinh
    
    MOV AH, 4CH
    INT 21H
Main Endp

; Ham de in chuoi viet hoa

INHOA Proc                   ; Thu tuc in hoa
    LEA SI, XAU+2            ; Tro toi vi tri dau cua chuoi
LAP1:                        ; Bat dau vong lap
    MOV DL, [SI]             ; Lay ra ki tu dang duoc tro toi
    CMP DL, 'a'              ; So sanh neu ki tu nho hon 'a'
    JL COUT1                 ; Neu nho hon thi chuyen sang buoc COUT1 de in
    CMP DL, 'z'              ; So sanh neu ki tu lon hon 'z'
    JG COUT1                 ; Neu lon hon thi chuyen sang buoc COUT1 de in
    SUB DL, 32               ; Trong khoang a -> z thi tru 32 de chuyen ki tu thanh hoa
COUT1:                       ; Bat dau in 
    MOV AH,2                 ; Goi ham 2 cua ngat INT21H de in ra 1 ki tu
    INT 21H                  ; In ra ki tu
    INC SI                   ; Chuyen den ki tu tiep theo
    CMP [SI], '$'            ; Kiem tra xem da ket thuc chuoi chua
    JNE LAP1                 ; Neu chua ket thuc chuoi thi tiep tuc LAP1
    RET                      ; Tra ve
INHOA Endp

; Ham de in chuoi viet thuong

INTHUONG Proc                ; Thu tuc in thuong
    LEA SI, XAU+2            ; Tro toi vi tri dau cua chuoi
LAP2:                        ; Bat dau vong lap
    MOV DL, [SI]             ; Lay ra ki tu dang duoc tro toi
    CMP DL, 'A'              ; So sanh neu ki tu nho hon 'A'
    JL COUT2                 ; Neu nho hon thi chuyen sang buoc COUT2 de in
    CMP DL, 'Z'              ; So sanh neu ki tu lon hon 'Z'
    JG COUT2                 ; Neu lon hon thi chuyen sang buoc COUT2 de in
    ADD DL, 32               ; Trong khoang A -> Z thi cong 32 de chuyen ki tu thanh thuong
COUT2:                       ; Bat dau in
    MOV AH, 2                ; Goi ham 2 cua ngat INT21H de in ra 1 ki tu
    INT 21H                  ; In ra ki tu
    INC SI                   ; Chuyen den ki tu tiep theo
    CMP [SI], '$'            ; Kiem tra xem da ket thuc chuoi chua
    JNE LAP2                 ; Neu chua ket thuc chuoi thi tiep tuc LAP2
    RET                      ; Tra ve
INTHUONG Endp

END
