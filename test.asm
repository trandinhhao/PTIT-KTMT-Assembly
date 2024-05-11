

name "Tic Tac Toe" ; đặt tên chương trình"Tic Tac Toe"
org 100h           ; thiết lập vị trí bắt đầu trong bộ nhớ
.DATA              ; khối dữ liệu

    MANG DB '1','2','3'  					; khai báo mảng 2D grid
            DB '4','5','6'
            DB '7','8','9'
         
   PLAYER DB ?  						; khai báo biến cho người chơi
   WELCOME DB 'Welcome to Tic Tac Toe! $'			; thông điệp chào mừng
   INPUT DB 'Enter Position Number, PLAYER Turn is: $' 	; thông điệp nhập dữ liệu
   DRAW DB 'DRAW! $' 					; thông điệp hoa
   WIN DB 'PLAYER WIN: $' 					; thông điệp chiến thắng
    
 .CODE    ; khối mã lệnh
    main:
         
        mov cx,9    					; lặp 9 lần vì số lượng tối đa các lượt chơi là 9

        x:   
            call XOA_MAN_HINH  			; xóa màn hình để cho giao diện đẹp hơn

            call PRINT_WELCOME 			; in thông điệp chào mừng
            call PRINT_MANG    				; in bảng lưới
            
            mov bx, cx        					; di chuyển cx vào bx
            and bx, 1         					; để kiểm tra số chẵn hoặc lẻ
            cmp bx, 0        				 	; so sanh kết quả AND
            je isEven         				; nhảy đến isEven nếu kết quả 0 (chẵn)
            mov PLAYER, 'x'    			; nếu là số lẻ thì là lượt của người chơi x
            jmp endif
            isEven:
            mov PLAYER, 'o'    			; nếu là số chẵn thì là lượt của người chơi o
            endif:
            
            NOT_VALID:
            call IN_DONG_MOI 			; in dòng mới
            call IN_NHAP	 			; in thông điệp nhập liệu
            call NHAP   				; đọc dữ liệu đầu vào, al chứa vị trí trên bảng lưới
           
            push cx           				; đẩy cx vào ngăn xếp
            mov cx, 9         				; thiết lập số lượng vòng lặp
            mov bx, 0         				; chỉ số để truy cập bảng lưới
            y:
            cmp MANG[bx], al  			; kiểm tra vị trí trên bảng lưới với dữ liệu đầu vào
            je UPDATE         			; nếu trùng khớp cập nhật vị trí của người chơi(x hoặc o)
            jmp CONTINUE     			 ; tiếp tục nếu không trùng
            UPDATE:
            mov dl, PLAYER     			; di chuyển ng chơi vào dl
            mov MANG[bx], dl  			 ; cập nhật bảng lưới với người chơi
            CONTINUE:
            inc bx            				; tăng chỉ số
            loop y            				; lặp đến khi hoàn tất
            pop cx            				; lấy giá trị cx ra khỏi ngăn xếp
            call CHECKWIN     			; kiểm tra kết quả chơi        
           loop x               				; lặp lại chương trình
        
          call PRINT_DRAW      			; nếu không ai thắng in hòa
        
          programEnd:   
        
        mov     ah, 0        				; doi phim bat ky
        int     16h          
    ret                      		
	    
        ; Các hàm
  
        PRINT_MANG:         			; thủ tục in bảng lưới
            push cx           				; đẩy cx vào ngăn xếp
            mov bx,0         				 ; thiết lập chỉ số ban đầu
            mov cx,3          				; số dòng của bảng lưới
            x1:
                call IN_DONG_MOI 			; in dòng mới
                push cx          				; đẩy cx vào ngăn xếp
                mov cx, 3       				; số cột của bảng lưới
                x2:
                    mov dl, MANG[bx] 		; di chuyển giá trị grid vào dl
                    mov ah, 2h   			; câu lệnh in ký tự
                    int 21h       
                    call PRINT_Space 			; gọi hàm in khoảng trắng
                    inc bx       				; tăng chỉ số
                loop x2          				; lặp lại qua các cột
                pop cx          		 		; lấy lại giá trị cx
            loop x1              				; lap lai qua cac dong
            pop cx               				; lấy lại giá trị cx
            call IN_DONG_MOI    			; in dòng mới 
        ret                      					
        
        IN_DONG_MOI:            			; thủ tục in dòng mới
            mov dl, 0ah          			;  kí tự xuống dòng
            mov ah, 2           	 			; câu lệnh in kí tự
            int 21h              				; gọi ngắt để in kí tự
            mov dl, 13          		 		
            mov ah, 2           		 		; câu lệnh in kí tự
            int 21h              				; gọi ngắt để in kí tự
        ret                     			 		
        
        PRINT_Space:              			; thủ tục in khoảng trắng
            mov dl, 32          		 		; mã ascii của khoảng trắng
            mov ah, 2            			; câu lệnh in kí tự
            int 21h              				; gọi ngắt để in kí tự
        ret                     		 			
        
        NHAP:              			 	; thủ tục đọc dữ liệu đầu vào
           mov ah, 1              			; cho phép nhập kí tự
           int 21h                				; gọi ngắt để nhập dữ liệu
           
           cmp al, '1'             			; kiểm tra giá trị nhập vào
           je VALID
           cmp al, '2'
           je VALID
           cmp al, '3'
           je VALID
           cmp al, '4'
           je VALID
           cmp al, '5'
           je VALID
           cmp al, '6'
           je VALID
           cmp al, '7'
           je VALID
           cmp al, '8'
           je VALID
           cmp al, '9'
           je VALID
           jmp NOT_VALID          	 		; quay lại vị trí không hợp lệ
           VALID:                 			; điểm hợp lệ
        ret                       					
        
       PRINT_WELCOME:          			 ; thủ tục in thông điệp chào mừng
            lea dx, WELCOME   			; tải địa chỉ của thông điệp vào dx
            mov ah, 9            			; câu lệnh in chuỗi
            int 21h             		 		; gọi ngắt để in chuỗi
        ret                       					
        
       PRINT_DRAW:                  			; thủ tục in thông điệp hoa
            call IN_DONG_MOI       		; in dòng mới
            lea dx, DRAW            			 ; tải địa chỉ thông điệp
            mov ah, 9                			; câu lệnh in chuỗi
            int 21h                   			; gọi ngắt để in chuỗi
        ret                         		 			
        
       PRINT_WIN:                     			; thủ tục in thông điệp chiến thắng
            call IN_DONG_MOI       	 	; in dòng mới
            call PRINT_MANG           		; in bảng lưới lần cuối
            lea dx, WIN               			; tải địa chỉ thông điệp
            mov ah, 9                 			; câu lệnh in chuỗi
            int 21h                    			; gọi ngắt để in chuỗi
            mov dl, PLAYER            	 	; di chuyển giá trị người chơi vào dl
            mov ah, 2h                 			; câu lệnh in kí tự
            int 21h                    			; gọi ngắt để in kí tự
            jmp programEnd            		 	; quay lại kết thúc chương trình
        ret                            				
        
        IN_NHAP:                 			; thủ tục in thông điệp nhập liệu
            lea dx, INPUT            			; tải địa chỉ thông điệp
            mov ah, 9                   		 	; câu lệnh in chuỗi
            int 21h                       			; gọi ngắt để in chuỗi
            mov dl, PLAYER               	 	; di chuyển giá trị người chơi vào dl
            mov ah, 2h                     			; câu lệnh in kí tự
            int 21h                       	 		; gọi ngắt để in kí tự
            call PRINT_Space                		; gọi thủ tục in khoảng trắng
        ret                                				
        
        CHECKWIN:                          		; thủ tục kiểm tra kết quả
            mov bl, MANG[0]                   		; kiểm tra hàng 0
            cmp bl, MANG[1]                    		; so sánh giá trị đầu tiên và thứ 2
            jne skip1                           		; nếu không giống nhau bỏ qua
            cmp bl, MANG[2]                      		; so sánh giá trị đầu tiên và thứ 3
            jne skip1                            		; nếu không giống nhau bỏ qua
            call PRINT_WIN                        		; nếu giống nhau in thông điệp chiến thắng
            skip1:                              			; vị trí bỏ qua
            
            mov bl, MANG[3]                       		; kiểm tra hàng 1
            cmp bl, MANG[4]                         	; so sánh giá trị đầu tiên và thứ 2 của hàng 1
            jne skip2                               		; nếu không giống nhau bỏ qua
            cmp bl, MANG[5]                         	; so sánh giá trị đầu tiên và thứ 3 của hàng 1
            jne skip2                               		; nếu không giống nhau bỏ qua
            call PRINT_WIN                           	; nếu giống nhau in thông điệp chiến thắng
            skip2:                                   		; vị trí bỏ qua

            
            mov bl, MANG[6]                           	; kiểm tra hàng 2
            cmp bl, MANG[7]                             	; so sánh giá trị đầu tiên và thứ 2 của hàng 2
            jne skip3                                   		; nếu không giống nhau bỏ qua
            cmp bl, MANG[8]                         	 ; so sánh giá trị đầu tiên và thứ 3 của hàng 2
            jne skip3                                   		; nếu không giống nhau bỏ qua
            call PRINT_WIN                                	; nếu giống nhau in thông điệp chiến thắng
            skip3:                                       		; vị trí bỏ qua
            
            mov bl, MANG[0]                               	; kiểm tra cột 0
            cmp bl, MANG[3]                                 	; so sánh vị trí đầu tiên và thứ 2 của cột 0
            jne skip4                                       	; nếu không giống nhau bỏ qua
            cmp bl, MANG[6]                                 	; so sánh vị trí đầu tiên và thứ 3 của cột 0
            jne skip4                                       	; nếu không giống nhau bỏ qua
            call PRINT_WIN                                    	; nếu giống nhau in thông điệp chiến thắng
            skip4:                                            	; vị trí bỏ qua
            
            mov bl, MANG[1]                                   	; kiểm tra cột 1
            cmp bl, MANG[4]                                    	; so sánh vị trí đầu tiên và thứ 2 của cột 1
            jne skip5                                           	; nếu không giống nhau bỏ qua
            cmp bl, MANG[7]                                   	;  so sánh vị trí đầu tiên và thứ 3 của cột 1
            jne skip5                                           	; nếu không giống nhau bỏ qua
            call PRINT_WIN                                       ; nếu giống nhau in thông điệp chiến thắng
            skip5:                                               	; vị trí bỏ qua    
        
            mov bl, MANG[2]                      		; kiểm tra cột 2
            cmp bl, MANG[5]                                     ; so sánh vị trí đầu tiên và thứ 2 của cột 2
            jne skip6                                               	; nếu không giống nhau bỏ qua
            cmp bl, MANG[8]                                  	; so sánh vị trí đầu tiên và thứ 3 của cột 2
            jne skip6                                               	; nếu không giống nhau bỏ qua
            call PRINT_WIN                                   	; nếu giống nhau in thông điệp chiến thắng
            skip6:                                                  	; vị trí bỏ qua
            
            mov bl, MANG[0]                                 	; kiểm tra đường chéo chính
            cmp bl, MANG[4]                               	; so sánh giá trị đầu tiên và thứ 2 của đường chéo chính
            jne skip7                                                  	; nếu không giống nhau bỏ qua
            cmp bl, MANG[8]                              	; so sánh giá trị đầu tiên và thứ 3 của đường chéo chính
            jne skip7                                                  	; nếu không giống nhau bỏ qua
            call PRINT_WIN                                    	 ; nếu giống nhau in thông điệp chiến thắng
            skip7:                                                       	; vị trí bỏ qua
            
            mov bl, MANG[2]                                 	 ; kiểm tra đường chéo phụ
            cmp bl, MANG[4]                             	 ; so sánh giá trị đầu tiên và thứ 2 của đường chéo phụ
 jne skip8                                                   	; nếu không giống nhau bỏ qua 
cmp bl, MANG[6]                                          	; so sánh giá trị đầu tiên và thứ 3 của đường chéo phụ

 jne skip8                                                  	; nếu không giống nhau bỏ qua
            call PRINT_WIN                              	; nếu giống nhau in thông điệp chiến thắng
            skip8:                                               	; vị trí bỏ qua
        ret                                                                 	 
        
        XOA_MAN_HINH:                           	; thủ tục xóa màn hình
            mov ax, 3                                   	 	; xóa màn hình
            int 10h                                      		; gọi ngắt
        ret                                                            	
    end main                                                     	; kết thúc chương trình
