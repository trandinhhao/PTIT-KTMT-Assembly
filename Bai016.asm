; B16: Viet chuong trinh tinh tong 2 so kieu word

.Model Small      ; Khoi tao che do bo nho la Small
.Stack 100H       ; Khoi tao kich thuoc cua ngan xep
.Data
        ; Khoi tao bien va cac hang
                                                     
        CLRF DB 13,10, '$'                          ; Xuong dong va lui vao dau dong
        THONGBAO1 DB "Nhap so nguyen thu 1: $"      ; Thong bao nhap vao so dau tien
        THONGBAO2 DB "Nhap so nguyen thu 2: $"      ; Thong bao nhap vao so thu hai
        THONGBAO3 DB "Tong cua 2 so nguyen do la: $"; Thong bao in ra tong 2 so
        SO1 DW 0                                    ; Khoi tao bien luu so thu nhat
        SO2 DW 0                                    ; Khoi tao bien luu so thu hai
        TONG DW 0                                   ; Khoi tao bien luu tong
        
.Code                  ; Thu tuc ham chinh chuong trinh
Main Proc              
    
    ; Khoi tao thanh ghi DS
    
    MOV AX, @Data     ; Tro AX vao dau cua chuong trinh @Data
    MOV DS, AX        ; Tro thanh ghi AX ve dau doan Data
    
    MOV AH, 9         ; Goi ham 9 cua ngat INT21H de in ra 1 xau ki tu
    LEA DX, THONGBAO1 ; Tro den yeu cau nhap vao so thu nhat
    INT 21H           ; In ra 
    
    ; Doc so thu nhat
    
DOC1:
    MOV AH, 1         ; Goi ham 1 cua ngat INT21H de doc 1 ky tu
    INT 21H           ; Doc ki tu
    CMP AL, 13        ; Kiem tra xem ki tu nhap vao co phai ki tu xuong dong (CR) hay khong
    JE NEXT1          ; Neu dung, chuyen den NEXT1
    MOV CL, AL        ; Luu ki tu do vao CL
    MOV CH, 0         ; Reset CH
    SUB CL, 30H       ; Chuyen ki tu ASCII thanh so
    MOV AX, SO1       ; Luu gia tri SO1 vao AX
    MOV BX, 10        ; Gan BX = 10
    MUL BX            ; Nhan AX voi 10
    ADD AX, CX        ; Cong AX voi so moi
    MOV SO1, AX       ; Luu gia tri vao SO1
    JMP DOC1          ; Quay lai, doc ki tu tiep theo
    
NEXT1:
    MOV AH, 9         ; Goi ham 9 cua ngat INT21H de in ra 1 xau ki tu
    LEA DX, CLRF      ; Tro den xuong dong va lui dau dong
    INT 21H           ; In ra
    LEA DX, THONGBAO2 ; Tro den yeu cau nhap vao so thu hai
    INT 21H           ; In ra
    
    ; Doc so thu hai
    
DOC2:
    MOV AH, 1         ; Goi ham 1 cua ngat INT21H de doc 1 ky tu
    INT 21H           ; Doc ki tu
    CMP AL, 13        ; Kiem tra xem ki tu nhap vao co phai ki tu xuong dong (CR) hay khong
    JE NEXT2          ; Neu dung, chuyen den NEXT2
    MOV CL, AL        ; Luu ki tu do vao CL
    MOV CH, 0         ; Reset CH
    SUB CL, 30H       ; Chuyen ki tu ASCII thanh so
    MOV AX, SO2       ; Luu gia tri SO1 vao AX
    MOV BX,10         ; Gan BX = 10
    MUL BX            ; Nhan AX voi 10
    ADD AX, CX        ; Cong AX voi so moi
    MOV SO2, AX       ; Luu gia tri vao SO2
    JMP DOC2          ; Quay lai, doc ki tu tiep theo   
    
NEXT2:
    MOV AH, 9         ; Goi ham 9 cua ngat INT21H de in ra 1 xau ki tu
    LEA DX, CLRF      ; Tro den xuong dong va lui dau dong
    INT 21H           ; In ra
    LEA DX, THONGBAO3 ; Tro den thong bao in ra tong cua hai so
    INT 21H           ; In ra
    
    
    MOV AX, SO1       ; Chuyen gia tri cua so thu nhat vao AX
    ADD AX, SO2       ; Cong them voi so thu hai
    MOV CX, 0         ; Khoi tao bien dem = 0
    MOV BX, 10        ; Dat BX = 10
    MOV DX, 0         ; Dat DX = 0 
    
    ; Tinh toan ket qua cua phep cong
    
TINH:
    DIV BX            ; Lay AX chia cho BX
    PUSH DX           ; Chuyen phan du vao ngan xep
    INC CX            ; Tang bien dem
    CMP AX, 0         ; Kiem tra xem AX = 0 ?
    JE INRA           ; Neu dung, chuyen den INRA
    MOV DX, 0         ; Reset DX
    JMP TINH          ; Quay lai
    
    ; In ra  
    
INRA:                  
    POP DX            ; Lay phan du tu Stack
    ADD DL, 30H       ; Chuyen tu so sang ki tu ASCII
    MOV AH, 2         ; Goi ham 2 cua ngat INT21H de in ra 1 ki tu
    INT 21H           ; In ra
    LOOP INRA         ; Lap lai den khi het bien dem
    
    ; Ket thuc chuong trinh
    
    MOV AH, 4CH
    INT 21H
Main Endp
END
    
