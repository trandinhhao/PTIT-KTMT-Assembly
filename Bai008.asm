; B8: Viet chuong trinh chuyen 1 so tu he co so 10 sang 16

.Model Small           ; Khoi tao che do bo nho la Small
.Stack 100H            ; Khoi tao kich thuoc cua ngan xep
.Data   
        ; Khoi tao bien va cac hang
        CLRF DB 13,10, '$'       ; Xuong dong va lui vao dau dong
        N DW 0                   ; Khoi tao bien de luu gia tri nhap vao
        MUOI DW 10               ; Hang so 10
        MUOISAU DW 16            ; Hang so 16
        THONGBAO1 DB "Nhap vao 1 so (DEC): $"       ; Thong bao nhap vao so DEC
        THONGBAO2 DB "So he HEX tuong ung la: $"    ; Thong bao in ra so HEX
        
.Code
Main Proc                ; Thu tuc ham chinh chuong trinh
    
    ; Khoi tao thanh ghi DS
    
    MOV AX, @Data     ; Tro AX vao dau cua chuong trinh @Data
    MOV DS, AX        ; Tro thanh ghi AX ve dau doan Data
    MOV CX, 0         ; Khoi tao bien dem=0
    
    MOV AH, 9         ; Goi ham 9 cua ngat INT21H de in ra 1 xau ki tu
    LEA DX, THONGBAO1 ; Tro den Yeu cau nhap vao 1 so he DEC
    INT 21H           ; In ra
    
    ; Nhap vao so he co so DEC
    
DOC:
    MOV AH, 1         ; Goi ham 1 cua ngat INT21H de doc 1 ky tu
    INT 21H           ; Doc ki tu
    CMP AL, 13        ; Kiem tra xem ki tu nhap vao co phai ki tu xuong dong (CR) hay khong
    JE NEXT           ; Neu dung, chuyen den phan ke tiep
    
    ; Chuyen tu ki tu ASCII thanh so tuong ung
    
    SUB AL, '0'       ; Lay ki tu tru di '0' de duoc so nguyen tuong ung 
    MOV AH, 0         ; Reset lai AH
    PUSH AX           ; Day so moi vao ngan xep
    MOV AX,N          ; Lay ra so N hien tai, sao chep vao thanh ghi AX
    MUL MUOI          ; Nhan no voi 10
    MOV N, AX         ; Cap nhat lai gia tri vao bien N
    POP AX            ; Lay ra so moi tu ngan xep
    ADD N, AX         ; Cong so do vao N
    JMP DOC           ; Quay lai, doc ki tu tiep theo 
    
NEXT:
    MOV AH, 9         ; Goi ham 9 cua ngat INT21H de in ra 1 xau ki tu
    LEA DX, CLRF      ; Tro den xuong dong va lui dau dong
    INT 21H           ; In ra
    LEA DX, THONGBAO2 ; Tro den Thong bao nhap ra so HEX tuong ung
    INT 21H           ; In ra
    
    MOV AX, N         ; Dat gia tri so ban dau
    MOV CX, 0         ; Khoi tao so luong so du=0
    
    ; Chuyen so da nhap: DEC->HEX
    
    
LAP:                     
    MOV DX, 0         ; Dat so du ve 0
    DIV MUOISAU       ; Chia so trong AX cho 16-> AX: nguyen//DX: du
    PUSH DX           ; Chuyen phan du vao ngan xep
    INC CX            ; Tang bien dem
    CMP AX, 0         ; Kiem tra xem AX da bang 0 chua
    JG LAP            ; Lap tiep neu AX>0
    
    ; In ket qua
    
LAP1:                 
    POP DX            ; Lay gia tri tu ngan xep
    CMP DX, 10        ; So sanh DX voi 10
    JE COUT_A         ; Neu DX==10 chuyen den COUT_A
    CMP DX, 11        ; So sanh DX voi 11
    JE COUT_B         ; Neu DX==11 chuyen den COUT_B
    CMP DX, 12        ; So sanh DX voi 12
    JE COUT_C         ; Neu DX==12 chuyen den COUT_C
    CMP DX, 13        ; So sanh DX voi 13
    JE COUT_D         ; Neu DX==13 chuyen den COUT_D
    CMP DX, 14        ; So sanh DX voi 14
    JE COUT_E         ; Neu DX==14 chuyen den COUT_E
    CMP DX, 15        ; So sanh DX voi 15
    JE COUT_F         ; Neu DX==15 chuyen den COUT_F
    ADD DX, '0'       ; Luc nay, DX<10 => +'0' chuyen thanh ky tu so
    JMP INRA          ; Chuyen den INRA
COUT_A:
    MOV DL, 'A'       ; 'A' -> DL
    JMP INRA          ; Chuyen den INRA
COUT_B:
    MOV DL, 'B'       ; 'B' -> DL
    JMP INRA          ; Chuyen den INRA
COUT_C:
    MOV DL, 'C'       ; 'C' -> DL
    JMP INRA          ; Chuyen den INRA
COUT_D:
    MOV DL, 'D'       ; 'D' -> DL
    JMP INRA          ; Chuyen den INRA
COUT_E:
    MOV DL, 'E'       ; 'E' -> DL
    JMP INRA          ; Chuyen den INRA
COUT_F:
    MOV DL, 'F'       ; 'F' -> DL
    JMP INRA          ; Chuyen den INRA
INRA:
    MOV AH,2          ; Goi ham 2 cua ngat INT21H de in ra 1 ki tu
    INT 21H           ; In ra ky tu trong DL
    LOOP LAP1         ; Lap lai de in ra ky tu tiep theo
    
    ; Ket thuc chuong trinh
    
    MOV AH, 4CH
    INT 21H    
            
Main Endp
END
    
