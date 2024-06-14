.model large
.stack 1000h
.data
; Trang chao mung                             
	a1 db 10,13,'   	 			******************************************$'
	a2 db 10,13,'   				 **             Chao Mung Ban            **$'
	a3 db 10,13,'   				 **                Den Voi               **$'
	a4 db 10,13,'   				 **  He Thong Quan Ly Hoa Don Nha Hang   **$'
	a5 db 10,13,'   				 **      (Restaurant Billing System)     **$'
	a6 db 10,13,'   				 ******************************************$'

; Lua chon
	a7 db 10,13,'                    Schedule---$'
	a8 db 10,13,'                    Nhap Lua Chon Cua Ban: $'
	a19 db 10,13,'                          Nhap 1 De Hien Thi Chuong Trinh: $'
	a34 db 10,13,'                            Moi Ban Nhap Chon Mon: $'
	a35 db 10,13,'                            Nhap So Luong: $'
	a36 db 10,13,'                        Dau Vao Khong Hop Le !! Vui Long Chay Lai Chuong Trinh$'
	a37 db 10,13,'                            Tong Gia: $'
	a38 db 10,13,'                    1. Schedule: $'
	a39 db 10,13,'                    2. Exit: $'

; Schedule list
	a9 db 10,13,'                        1. (Bua sang) Breakfast$'
	a10 db 10,13,'                        2. (Bua trua) Lunch$'
	a11 db 10,13,'                        3. (Bua toi) Dinner$'

; Breakfast List
	a12 db 10,13,'                  ********      Breakfast List      ********$'
	a13 db 10,13,'                       1. Banh Xeo             50/-$'
	a14 db 10,13,'                       2. Banh Xeo + Rau       50/-$'
	a15 db 10,13,'                       3. Banh Xeo Trung       50/-$'
	a16 db 10,13,'                       4. Ca Ri Ga     50/-$'
	a17 db 10,13,'                       5. Sup Ga        50/-$'
	a18 db 10,13,'                       6. Canh Ga              50/-$'

; Lunch List
	a20 db 10,13,'                  ********        Lunch List        ********$'
	a21 db 10,13,'                       1. Com          100/-$'
	a22 db 10,13,'                       2. Com Ga          100/-$'
	a23 db 10,13,'                       3. Com Chien  100/-$'
	a24 db 10,13,'                       4. Com Ca Curry         100/-$'
	a25 db 10,13,'                       5. Com Ga Curry      100/-$'
	a26 db 10,13,'                       6. Com Bo Curry         100/-$'

; Dinner List
	a27 db 10,13,'                  ********        Dinner List       ********$'
	a28 db 10,13,'                       1. Com Suon Curry       200/-$'
	a29 db 10,13,'                       2. Com Bo Curry         200/-$'
	a30 db 10,13,'                       3. Xoi Curry      200/-$'
	a31 db 10,13,'                       4. Com Ca Fish Fry    200/-$'
	a32 db 10,13,'                       5. Soup       200/-$'
	a33 db 10,13,'                       6. Soup Rau Tron    200/-$'

.code
main proc

	mov ax,@data
	mov ds,ax

; welcome page
	mov ah,9                  ; Thiet lap ham DOS de hien thi chuoi
	lea dx,a1                 ; Dua dia chi chuoi a1 vao thanh ghi DX
	int 21h                   ; Goi ngat 21h de hien thi chuoi
	lea dx,a2                 ; Dua dia chi chuoi a2 vao thanh ghi DX
	int 21h                   ; Goi ngat 21h de hien thi chuoi
	lea dx,a3                 ; Dua dia chi chuoi a3 vao thanh ghi DX
	int 21h                   ; Goi ngat 21h de hien thi chuoi
	lea dx,a4                 ; Dua dia chi chuoi a4 vao thanh ghi DX
	int 21h                   ; Goi ngat 21h de hien thi chuoi
	lea dx,a5                 ; Dua dia chi chuoi a5 vao thanh ghi DX
	int 21h                   ; Goi ngat 21h de hien thi chuoi
	lea dx,a6                 ; Dua dia chi chuoi a6 vao thanh ghi DX
	int 21h                   ; Goi ngat 21h de hien thi chuoi

; tao dong moi
	mov ah,2                  ; Thiet lap ham DOS de xuat ky tu
	mov dl,0ah                ; Ky tu xuong dong
	int 21h                   ; Goi ngat 21h de xuat ky tu
	mov dl,0dh                ; Ky tu quay dau xe (ve dau dong)
	int 21h                   ; Goi ngat 21h de xuat ky tu

	mov ah,2                  ; Thiet lap ham DOS de xuat ky tu
	mov dl,0ah                ; Ky tu xuong dong
	int 21h                   ; Goi ngat 21h de xuat ky tu
	mov dl,0dh                ; Ky tu quay dau xe (ve dau dong)
	int 21h                   ; Goi ngat 21h de xuat ky tu

; lay dau vao de bat dau
	mov ah,9                  ; Thiet lap ham DOS de hien thi chuoi
	lea dx,a19                ; Dua dia chi chuoi a19 vao thanh ghi DX
	int 21h                   ; Goi ngat 21h de hien thi chuoi
	mov ah,1                  ; Thiet lap ham DOS de nhap ky tu tu ban phim
	int 21h                   ; Goi ngat 21h de nhap ky tu
	mov bh,al                 ; Luu gia tri nhap vao thanh ghi BH
	sub bh,48                 ; Chuyen ky tu so sang gia tri so (ASCII '0' la 48)

	cmp bh,1                  ; So sanh gia tri nhap voi 1
	je Schedule               ; Neu bang 1, chuyen den nhan Schedule
	jmp Invalid               ; Neu khong, chuyen den nhan Invalid

Schedule:
; tao dong moi
	mov ah,2                  ; Thiet lap ham DOS de xuat ky tu
	mov dl,0ah                ; Ky tu xuong dong
	int 21h                   ; Goi ngat 21h de xuat ky tu
	mov dl,0dh                ; Ky tu quay dau xe (ve dau dong)
	int 21h                   ; Goi ngat 21h de xuat ky tu

	mov ah,2                  ; Thiet lap ham DOS de xuat ky tu
	mov dl,0ah                ; Ky tu xuong dong
	int 21h                   ; Goi ngat 21h de xuat ky tu
	mov dl,0dh                ; Ky tu quay dau xe (ve dau dong)
	int 21h                   ; Goi ngat 21h de xuat ky tu

	mov ah,9                  ; Thiet lap ham DOS de hien thi chuoi
	lea dx,a7                 ; Dua dia chi chuoi a7 vao thanh ghi DX
	int 21h                   ; Goi ngat 21h de hien thi chuoi
	lea dx,a9                 ; Dua dia chi chuoi a9 vao thanh ghi DX
	int 21h                   ; Goi ngat 21h de hien thi chuoi
	lea dx,a10                ; Dua dia chi chuoi a10 vao thanh ghi DX
	int 21h                   ; Goi ngat 21h de hien thi chuoi
	lea dx,a11                ; Dua dia chi chuoi a11 vao thanh ghi DX
	int 21h                   ; Goi ngat 21h de hien thi chuoi

; hien thi lua chon
	lea dx,a8                 ; Dua dia chi chuoi a8 vao thanh ghi DX
	int 21h                   ; Goi ngat 21h de hien thi chuoi
	
	mov ah,1                  ; Thiet lap ham DOS de nhap ky tu tu ban phim
	int 21h                   ; Goi ngat 21h de nhap ky tu
	mov bh,al                 ; Luu gia tri nhap vao thanh ghi BH
	sub bh,48                 ; Chuyen ky tu so sang gia tri so (ASCII '0' la 48)
	
	cmp bh,1                  ; So sanh gia tri nhap voi 1
	je Breakfast              ; Neu bang 1, chuyen den nhan Breakfast
	cmp bh,2                  ; So sanh gia tri nhap voi 2
	je Lunch                  ; Neu bang 2, chuyen den nhan Lunch
	cmp bh,3                  ; So sanh gia tri nhap voi 3
	je Dinner                 ; Neu bang 3, chuyen den nhan Dinner
	jmp Invalid               ; Neu khong, chuyen den nhan Invalid

; nhan Breakfast - Hien thi danh sach bua sang
Breakfast:
; tao dong moi
	mov ah,2                  ; Thiet lap ham DOS de xuat ky tu
	mov dl,0ah                ; Ky tu xuong dong
	int 21h                   ; Goi ngat 21h de xuat ky tu
	mov dl,0dh                ; Ky tu quay dau xe (ve dau dong)
	int 21h                   ; Goi ngat 21h de xuat ky tu
	
	mov ah,2                  ; Thiet lap ham DOS de xuat ky tu
	mov dl,0ah                ; Ky tu xuong dong
	int 21h                   ; Goi ngat 21h de xuat ky tu
	mov dl,0dh                ; Ky tu quay dau xe (ve dau dong)
	int 21h                   ; Goi ngat 21h de xuat ky tu

; Bat dau hien thi danh sach bua sang
	mov ah,9                  ; Thiet lap ham DOS de hien thi chuoi
	lea dx,a12                ; Dua dia chi chuoi a12 vao thanh ghi DX
	int 21h                   ; Goi ngat 21h de hien thi chuoi
	
	mov ah,2                  ; Thiet lap ham DOS de xuat ky tu
	mov dl,0ah                ; Ky tu xuong dong
	int 21h                   ; Goi ngat 21h de xuat ky tu
	mov dl,0dh                ; Ky tu quay dau xe (ve dau dong)
	int 21h                   ; Goi ngat 21h de xuat ky tu

	mov ah,9                  ; Thiet lap ham DOS de hien thi chuoi
	lea dx,a13                ; Dua dia chi chuoi a13 vao thanh ghi DX
	int 21h                   ; Goi ngat 21h de hien thi chuoi
	lea dx,a14                ; Dua dia chi chuoi a14 vao thanh ghi DX
	int 21h                   ; Goi ngat 21h de hien thi chuoi
	lea dx,a15                ; Dua dia chi chuoi a15 vao thanh ghi DX
	int 21h                   ; Goi ngat 21h de hien thi chuoi
	lea dx,a16                ; Dua dia chi chuoi a16 vao thanh ghi DX
	int 21h                   ; Goi ngat 21h de hien thi chuoi
	lea dx,a17                ; Dua dia chi chuoi a17 vao thanh ghi DX
	int 21h                   ; Goi ngat 21h de hien thi chuoi
	lea dx,a18                ; Dua dia chi chuoi a18 vao thanh ghi DX
	int 21h                   ; Goi ngat 21h de hien thi chuoi

; kiem tra dieu kien nhap mon an bua sang
	lea dx,a34                ; Dua dia chi chuoi a34 vao thanh ghi DX
	int 21h                   ; Goi ngat 21h de hien thi chuoi

	mov ah,1                  ; Thiet lap ham DOS de nhap ky tu tu ban phim
	int 21h                   ; Goi ngat 21h de nhap ky tu
	mov bl,al                 ; Luu gia tri nhap vao thanh ghi BL
	sub bl,48                 ; Chuyen ky tu so sang gia tri so (ASCII '0' la 48)

	cmp bl,1                  ; So sanh gia tri nhap voi 1
	je Fifty                  ; Neu bang 1, chuyen den nhan Fifty
	cmp bl,2                  ; So sanh gia tri nhap voi 2
	je Fifty                  ; Neu bang 2, chuyen den nhan Fifty
	cmp bl,3                  ; So sanh gia tri nhap voi 3
	je Fifty                  ; Neu bang 3, chuyen den nhan Fifty
	cmp bl,4                  ; So sanh gia tri nhap voi 4
	je Fifty                  ; Neu bang 4, chuyen den nhan Fifty
	cmp bl,5                  ; So sanh gia tri nhap voi 5
	je Fifty                  ; Neu bang 5, chuyen den nhan Fifty
	cmp bl,6                  ; So sanh gia tri nhap voi 6
	je Fifty                  ; Neu bang 6, chuyen den nhan Fifty
	jmp Invalid               ; Neu khong, chuyen den nhan Invalid

Lunch:
; tao dong moi
	mov ah,2                  ; Thiet lap ham DOS de xuat ky tu
	mov dl,0ah                ; Ky tu xuong dong
	int 21h                   ; Goi ngat 21h de xuat ky tu
	mov dl,0dh                ; Ky tu quay dau xe (ve dau dong)
	int 21h                   ; Goi ngat 21h de xuat ky tu

	mov ah,2                  ; Thiet lap ham DOS de xuat ky tu
	mov dl,0ah                ; Ky tu xuong dong
	int 21h                   ; Goi ngat 21h de xuat ky tu
	mov dl,0dh                ; Ky tu quay dau xe (ve dau dong)
	int 21h                   ; Goi ngat 21h de xuat ky tu

; Bat dau hien thi danh sach bua trua
	mov ah,9                  ; Thiet lap ham DOS de hien thi chuoi
	lea dx,a20                ; Dua dia chi chuoi a20 vao thanh ghi DX
	int 21h                   ; Goi ngat 21h de hien thi chuoi

	mov ah,2                  ; Thiet lap ham DOS de xuat ky tu
	mov dl,0ah                ; Ky tu xuong dong
	int 21h                   ; Goi ngat 21h de xuat ky tu
	mov dl,0dh                ; Ky tu quay dau xe (ve dau dong)
	int 21h                   ; Goi ngat 21h de xuat ky tu

	mov ah,9                  ; Thiet lap ham DOS de hien thi chuoi
	lea dx,a21                ; Dua dia chi chuoi a21 vao thanh ghi DX
	int 21h                   ; Goi ngat 21h de hien thi chuoi
	lea dx,a22                ; Dua dia chi chuoi a22 vao thanh ghi DX
	int 21h                   ; Goi ngat 21h de hien thi chuoi
	lea dx,a23                ; Dua dia chi chuoi a23 vao thanh ghi DX
	int 21h                   ; Goi ngat 21h de hien thi chuoi
	lea dx,a24                ; Dua dia chi chuoi a24 vao thanh ghi DX
	int 21h                   ; Goi ngat 21h de hien thi chuoi
	lea dx,a25                ; Dua dia chi chuoi a25 vao thanh ghi DX
	int 21h                   ; Goi ngat 21h de hien thi chuoi
	lea dx,a26                ; Dua dia chi chuoi a26 vao thanh ghi DX
	int 21h                   ; Goi ngat 21h de hien thi chuoi

; kiem tra dieu kien nhap mon an bua trua
	lea dx,a34                ; Dua dia chi chuoi a34 vao thanh ghi DX
	int 21h                   ; Goi ngat 21h de hien thi chuoi
	
	mov ah,1                  ; Thiet lap ham DOS de nhap ky tu tu ban phim
	int 21h                   ; Goi ngat 21h de nhap ky tu
	mov bl,al                 ; Luu gia tri nhap vao thanh ghi BL
	sub bl,48                 ; Chuyen ky tu so sang gia tri so (ASCII '0' la 48)
	
	cmp bl,1                  ; So sanh gia tri nhap voi 1
	je Hundred                ; Neu bang 1, chuyen den nhan Hundred
	cmp bl,2                  ; So sanh gia tri nhap voi 2
	je Hundred                ; Neu bang 2, chuyen den nhan Hundred
	cmp bl,3                  ; So sanh gia tri nhap voi 3
	je Hundred                ; Neu bang 3, chuyen den nhan Hundred
	cmp bl,4                  ; So sanh gia tri nhap voi 4
	je Hundred                ; Neu bang 4, chuyen den nhan Hundred
	cmp bl,5                  ; So sanh gia tri nhap voi 5
	je Hundred                ; Neu bang 5, chuyen den nhan Hundred
	cmp bl,6                  ; So sanh gia tri nhap voi 6
	je Hundred                ; Neu bang 6, chuyen den nhan Hundred
	jmp Invalid               ; Neu khong, chuyen den nhan Invalid
	
;for exit
	mov ah,2        ; Thiet lap ham DOS de xuat ky tu
	mov dl,0ah      ; Ky tu xuong dong
	int 21h         ; Goi ngat 21h de xuat ky tu
	mov dl,0dh      ; Ky tu quay dau xe (ve dau dong)
	int 21h         ; Goi ngat 21h de xuat ky tu
	
	mov ah,9        ; Thiet lap ham DOS de xuat chuoi
	lea dx,a38      ; Dua dia chi chuoi a38 vao thanh ghi DX
	int 21h         ; Goi ngat 21h de hien thi chuoi
	
	mov ah,1        ; Thiet lap ham DOS de nhap ky tu tu ban phim
	int 21h         ; Goi ngat 21h de nhap ky tu
	mov bh,al       ; Luu gia tri nhap vao thanh ghi BH
	
	cmp bh,1        ; So sanh gia tri nhap voi 1
	jmp Exit        ; Neu bang 1, chuyen den nhan Exit


Dinner:
; tao dong moi
	mov ah,2                  ; Thiet lap ham DOS de xuat ky tu
	mov dl,0ah                ; Ky tu xuong dong
	int 21h                   ; Goi ngat 21h de xuat ky tu
	mov dl,0dh                ; Ky tu quay dau xe (ve dau dong)
	int 21h                   ; Goi ngat 21h de xuat ky tu

	mov ah,2                  ; Thiet lap ham DOS de xuat ky tu
	mov dl,0ah                ; Ky tu xuong dong
	int 21h                   ; Goi ngat 21h de xuat ky tu
	mov dl,0dh                ; Ky tu quay dau xe (ve dau dong)
	int 21h                   ; Goi ngat 21h de xuat ky tu

; Bat dau hien thi danh sach bua toi
	mov ah,9                  ; Thiet lap ham DOS de hien thi chuoi
	lea dx,a27                ; Dua dia chi chuoi a27 vao thanh ghi DX
	int 21h                   ; Goi ngat 21h de hien thi chuoi

	mov ah,2                  ; Thiet lap ham DOS de xuat ky tu
	mov dl,0ah                ; Ky tu xuong dong
	int 21h                   ; Goi ngat 21h de xuat ky tu
	mov dl,0dh                ; Ky tu quay dau xe (ve dau dong)
	int 21h                   ; Goi ngat 21h de xuat ky tu

	mov ah,9                  ; Thiet lap ham DOS de hien thi chuoi
	lea dx,a28                ; Dua dia chi chuoi a28 vao thanh ghi DX
	int 21h                   ; Goi ngat 21h de hien thi chuoi
	lea dx,a29                ; Dua dia chi chuoi a29 vao thanh ghi DX
	int 21h                   ; Goi ngat 21h de hien thi chuoi
	lea dx,a30                ; Dua dia chi chuoi a30 vao thanh ghi DX
	int 21h                   ; Goi ngat 21h de hien thi chuoi
	lea dx,a31                ; Dua dia chi chuoi a31 vao thanh ghi DX
	int 21h                   ; Goi ngat 21h de hien thi chuoi
	lea dx,a32                ; Dua dia chi chuoi a32 vao thanh ghi DX
	int 21h                   ; Goi ngat 21h de hien thi chuoi
	lea dx,a33                ; Dua dia chi chuoi a33 vao thanh ghi DX
	int 21h                   ; Goi ngat 21h de hien thi chuoi

; kiem tra dieu kien nhap mon an bua toi
	lea dx,a34                ; Dua dia chi chuoi a34 vao thanh ghi DX
	int 21h                   ; Goi ngat 21h de hien thi chuoi

	mov ah,1                  ; Thiet lap ham DOS de nhap ky tu tu ban phim
	int 21h                   ; Goi ngat 21h de nhap ky tu
	mov bl,al                 ; Luu gia tri nhap vao thanh ghi BL
	sub bl,48                 ; Chuyen ky tu so sang gia tri so (ASCII '0' la 48)

	cmp bl,1                  ; So sanh gia tri nhap voi 1
	je TwoHundred            ; Neu bang 1, chuyen den nhan TwoHundred
	cmp bl,2                  ; So sanh gia tri nhap voi 2
	je TwoHundred            ; Neu bang 2, chuyen den nhan TwoHundred
	cmp bl,3                  ; So sanh gia tri nhap voi 3
	je TwoHundred            ; Neu bang 3, chuyen den nhan TwoHundred
	cmp bl,4                  ; So sanh gia tri nhap voi 4
	je TwoHundred            ; Neu bang 4, chuyen den nhan TwoHundred
	cmp bl,5                  ; So sanh gia tri nhap voi 5
	je TwoHundred            ; Neu bang 5, chuyen den nhan TwoHundred
	cmp bl,6                  ; So sanh gia tri nhap voi 6
	je TwoHundred            ; Neu bang 6, chuyen den nhan TwoHundred
	jmp Invalid               ; Neu khong, chuyen den nhan Invalid

Fifty:
	mov bl,5            ; Dat so luong mat hang la 5 (moi mat hang co gia 50 don vi)
	lea dx,a35          ; Nap thong diep "Nhap So Luong" vao DX
	mov ah,9            ; Thiet lap ham DOS de hien thi mot chuoi
	int 21h             ; Hien thi thong diep
	mov ah,1            ; Thiet lap ham DOS de doc mot ky tu tu dau vao
	int 21h             ; Doc mot ky tu (so luong)
	sub al,48           ; Chuyen doi ky tu ASCII thanh gia tri so
	mul bl              ; Nhan so luong (BL) voi gia tri so (AL)
	aam                 ; Dieu chinh AX de giu hai chu so BCD
	mov cx,ax           ; Di chuyen ket qua vao CX (tong gia)
	add ch,48           ; Chuyen doi byte cao cua CX thanh ASCII
	add cl,48           ; Chuyen doi byte thap cua CX thanh ASCII

	lea dx,a37          ; Nap thong diep "Tong Gia" vao DX
	mov ah,9            ; Thiet lap ham DOS de hien thi mot chuoi
	int 21h             ; Hien thi thong diep

	mov ah,2            ; Thiet lap ham DOS de hien thi ky tu
	mov dl,ch           ; Hien thi byte cao cua CX (chuc)
	int 21h             ; Hien thi chuc
	mov dl,cl           ; Hien thi byte thap cua CX (don vi)
	int 21h             ; Hien thi don vi

	mov dl,'0'          ; Hien thi dau gach cheo (/)
	int 21h             ; Hien thi dau gach cheo

	mov dl,47           ; Hien thi ASCII cho so 4 (ket thuc thong diep)
	int 21h             ; Hien thi ket thuc thong diep
	mov dl,45           ; Hien thi ASCII cho so 5 (ket thuc thong diep)
	int 21h             ; Hien thi ket thuc thong diep

; De thoat hoac quay lai menu chinh
	mov ah,2            ; Thiet lap ham DOS de hien thi ky tu
	mov dl,0ah          ; Hien thi dong moi
	int 21h             ; Hien thi dong moi
	mov dl,0dh          ; Hien thi ky tu CR
	int 21h             ; Hien thi ky tu CR

	mov ah,9            ; Thiet lap ham DOS de hien thi mot chuoi
	lea dx,a38          ; Nap thong diep "Lich Trinh" vao DX
	int 21h             ; Hien thi thong diep

	mov ah,9            ; Thiet lap ham DOS de hien thi mot chuoi
	lea dx,a39          ; Nap thong diep "Thoat" vao DX
	int 21h             ; Hien thi thong diep

	mov ah,9            ; Thiet lap ham DOS de hien thi mot chuoi
	lea dx,a8           ; Nap thong diep "Nhap Lua Chon Cua Ban" vao DX
	int 21h             ; Hien thi thong diep

	mov ah,1            ; Thiet lap ham DOS de doc mot ky tu tu dau vao
	int 21h             ; Doc mot ky tu (lua chon)
	sub al,48           ; Chuyen doi ky tu ASCII thanh gia tri so

	cmp al,1            ; So sanh lua chon voi 1
	je Schedule         ; Nhay den Lich Trinh neu lua chon la 1
	
	cmp al,2            ; So sanh lua chon voi 2
	je Exit             ; Nhay den Thoat neu lua chon la 2

	jmp Invalid         ; Nhay den Invalid neu lua chon khong phai la 1 hoac 2

Hundred:
	mov bl,10           ; Ð?t s? lu?ng m?t hàng là 10 (m?i m?t hàng có giá 100 don v?)
	lea dx,a35          ; Nap thong diep "Nhap So Luong" vao DX
	mov ah,9            ; Thiet lap ham DOS de hien thi mot chuoi
	int 21h             ; Hien thi thong diep
	mov ah,1            ; Thiet lap ham DOS de doc mot ky tu tu dau vao
	int 21h             ; Doc mot ky tu (so luong)
	sub al,48           ; Chuyen doi ky tu ASCII thanh gia tri so
	mul bl              ; Nhan so luong (BL) voi gia tri so (AL)
	aam                 ; Dieu chinh AX de giu hai chu so BCD
	mov cx,ax           ; Di chuyen ket qua vao CX (tong gia)
	add ch,48           ; Chuyen doi byte cao cua CX thanh ASCII
	add cl,48           ; Chuyen doi byte thap cua CX thanh ASCII

	lea dx,a37          ; Nap thong diep "Tong Gia" vao DX
	mov ah,9            ; Thiet lap ham DOS de hien thi mot chuoi
	int 21h             ; Hien thi thong diep
	
	mov ah,2            ; Thiet lap ham DOS de hien thi ky tu
	mov dl,ch           ; Hien thi byte cao cua CX (chuc)
	int 21h             ; Hien thi chuc
	mov dl,cl           ; Hien thi byte thap cua CX (don vi)
	int 21h             ; Hien thi don vi
	
	mov dl,'0'          ; Hien thi dau gach cheo (/)
	int 21h             ; Hien thi dau gach cheo
	
	mov dl,47           ; Hien thi ASCII cho so 4 (ket thuc thong diep)
	int 21h             ; Hien thi ket thuc thong diep
	mov dl,45           ; Hien thi ASCII cho so 5 (ket thuc thong diep)
	int 21h             ; Hien thi ket thuc thong diep

; De thoat hoac quay lai menu chinh
	mov ah,2            ; Thiet lap ham DOS de hien thi ky tu
	mov dl,0ah          ; Hien thi dong moi
	int 21h             ; Hien thi dong moi
	mov dl,0dh          ; Hien thi ky tu carriage return
	int 21h             ; Hien thi ky tu carriage return
	
	mov ah,9            ; Thiet lap ham DOS de hien thi mot chuoi
	lea dx,a38          ; Nap thong diep "Lich Trinh" vao DX
	int 21h             ; Hien thi thong diep
	
	mov ah,9            ; Thiet lap ham DOS de hien thi mot chuoi
	lea dx,a39          ; Nap thong diep "Thoat" vao DX
	int 21h             ; Hien thi thong diep
	
	mov ah,9            ; Thiet lap ham DOS de hien thi mot chuoi
	lea dx,a8           ; Nap thong diep "Nhap Lua Chon Cua Ban" vao DX
	int 21h             ; Hien thi thong diep
	
	mov ah,1            ; Thiet lap ham DOS de doc mot ky tu tu dau vao
	int 21h             ; Doc mot ky tu (lua chon)
	sub al,48           ; Chuyen doi ky tu ASCII thanh gia tri so
	
	cmp al,1            ; So sanh lua chon voi 1
	je Schedule         ; Nhay den Lich Trinh neu lua chon la 1
	
	cmp al,2            ; So sanh lua chon voi 2
	je Exit             ; Nhay den Thoat neu lua chon la 2
	
	jmp Invalid         ; Nhay den Invalid neu lua chon khong phai la 1 hoac 2

TwoHundred:
	mov bl,20           ; Ð?t s? lu?ng m?t hàng là 20 (m?i m?t hàng có giá 200 don v?)
	lea dx,a35          ; Nap thong diep "Nhap So Luong" vao DX
	mov ah,9            ; Thiet lap ham DOS de hien thi mot chuoi
	int 21h             ; Hien thi thong diep
	mov ah,1            ; Thiet lap ham DOS de doc mot ky tu tu dau vao
	int 21h             ; Doc mot ky tu (so luong)
	sub al,48           ; Chuyen doi ky tu ASCII thanh gia tri so
	mul bl              ; Nhan so luong (BL) voi gia tri so (AL)
	aam                 ; Dieu chinh AX de giu hai chu so BCD
	mov cx,ax           ; Di chuyen ket qua vao CX (tong gia)
	add ch,48           ; Chuyen doi byte cao cua CX thanh ASCII
	add cl,48           ; Chuyen doi byte thap cua CX thanh ASCII

	lea dx,a37          ; Nap thong diep "Tong Gia" vao DX
	mov ah,9            ; Thiet lap ham DOS de hien thi mot chuoi
	int 21h             ; Hien thi thong diep
	
	mov ah,2            ; Thiet lap ham DOS de hien thi ky tu
	mov dl,ch           ; Hien thi byte cao cua CX (chuc)
	int 21h             ; Hien thi chuc
	mov dl,cl           ; Hien thi byte thap cua CX (don vi)
	int 21h             ; Hien thi don vi
	
	mov dl,'0'          ; Hien thi dau gach cheo (/)
	int 21h             ; Hien thi dau gach cheo
	
	mov dl,47           ; Hien thi ASCII cho so 4 (ket thuc thong diep)
	int 21h             ; Hien thi ket thuc thong diep
	mov dl,45           ; Hien thi ASCII cho so 5 (ket thuc thong diep)
	int 21h             ; Hien thi ket thuc thong diep

; De thoat hoac quay lai menu chinh
	mov ah,2            ; Thiet lap ham DOS de hien thi ky tu
	mov dl,0ah          ; Hien thi dong moi
	int 21h             ; Hien thi dong moi
	mov dl,0dh          ; Hien thi ky tu carriage return
	int 21h             ; Hien thi ky tu carriage return
	
	mov ah,9            ; Thiet lap ham DOS de hien thi mot chuoi
	lea dx,a38         		 ; Nap thong diep "Lich trinh" vao DX
	int 21h             ; Hien thi thong diep

	mov ah,9            ; Thiet lap ham DOS de hien thi mot chuoi
	lea dx,a39          ; Nap thong diep "Thoat" vao DX
	int 21h             ; Hien thi thong diep

	mov ah,9            ; Thiet lap ham DOS de hien thi mot chuoi
	lea dx,a8           ; Nap thong diep "Nhap Lua Chon Cua Ban" vao DX
	int 21h             ; Hien thi thong diep

	mov ah,1            ; Thiet lap ham DOS de doc mot ky tu tu dau vao
	int 21h             ; Doc mot ky tu (lua chon)
	sub al,48           ; Chuyen doi ky tu ASCII thanh gia tri so

	cmp al,1            ; So sanh lua chon voi 1
	je Schedule         ; Nhay den Lich Trinh neu lua chon la 1

	cmp al,2            ; So sanh lua chon voi 2
	je Exit             ; Nhay den Thoat neu lua chon la 2

	jmp Invalid         ; Nhay den Invalid neu lua chon khong phai la 1 hoac 2

Invalid:
; Dong moi
	mov ah,2        ; Thiet lap chuc nang hien thi ky tu
	mov dl,0ah      ; Hien thi dong moi (LF)
	int 21h         ; Thuc hien chuc nang

	mov dl,0dh      ; Hien thi ky tu carriage return (CR)
	int 21h         ; Thuc hien chuc nang

	mov ah,2        ; Thiet lap chuc nang hien thi ky tu
	mov dl,0ah      ; Hien thi dong moi (LF)
	int 21h         ; Thuc hien chuc nang
	
	mov dl,0dh      ; Hien thi ky tu carriage return (CR)
	int 21h         ; Thuc hien chuc nang
	
	mov ah,9        ; Thiet lap chuc nang hien thi chuoi
	lea dx,a36      ; Load dia chi cua chuoi "Invalid Input !! Rerun the Program" vao DX
	int 21h         ; Hien thi chuoi
	jmp Exit        ; Nhay den nhan Exit de thoat chuong trinh


Exit:
	mov ah,4ch      ; Chuan bi chuc nang thoat khoi chuong trinh DOS
	int 21h         ; Thuc hien chuc nang thoat
	main endp       ; Ket thuc thu tuc chinh
	end main        ; Ket thuc chuong trinh


main endp
end main
