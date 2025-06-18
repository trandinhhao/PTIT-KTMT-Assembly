# 🧠 Hướng dẫn Bài Tập & Bài Tập Lớn KTMT Assembly 8086 - PTIT

Bài tập lớn môn **Kiến trúc máy tính (KTMT)** tại Học viện Công nghệ Bưu chính Viễn thông - PTIT  
**Sinh viên**: Trần Đình Hào - B22DCCN278  
**Giảng viên**: Đinh Xuân Trường | **Khóa**: D22  
📄 **Báo cáo**: [PDF](https://drive.google.com/file/d/187kJZVecQrNWdu9zry0AB5EVbcmh2Mi7/view?usp=sharing) | [DOCX](https://docs.google.com/document/d/1RXacAWHkT9ZeJPd3ifZ2FDTJ-YCYXqk6/edit?usp=sharing&ouid=113235621676813436249&rtpof=true&sd=true)

(Cho tôi 1 ⭐ nếu nó hữu ích cho bạn nhé, làm cực lắm đó 😅)

---

## 📑 Nội dung

### ✍️ Bài tập cá nhân Assembly 8086

Tổng hợp đề bài 20 bài tập tiêu biểu được lập trình trên Emu8086, kèm giải thích chi tiết lệnh, flowchart, kết quả chạy.  
**Các bài đã thực hiện đầy đủ**: 1,2,3,4,5,8,16

Đề bài:
- Bài 1: Viết chương trình hợp ngữ in ra lời chào Tiếng Anh và Tiếng Việt.
- Bài 2: Viết chương trình hợp ngữ Assembly cho phép nhập 1 ký tự và in ra màn hình ký tự đó.
- Bài 3: Viết chương trình hợp ngữ Assembly cho phép nhập 1 chuỗi ký tự và in ra màn hình chuỗi ký tự đó.
- Bài 4: Viết chương trình hợp ngữ Assembly cho phép nhập 1 ký tự viết thường và in ra màn hình chữ hoa của ký tự đó.
- Bài 5: Viết chương trình hợp ngữ Assembly cho phép nhập 1 chuỗi ký tự, in ra màn hình chuỗi ký tự đó theo dạng viết hoa và viết thường.
- Bài 6: Viết chương trình hợp ngữ Assembly cho phép nhập một chuỗi các ký tự kết thúc bởi "# "và yêu cầu in ra màn hình chuỗi ký tự đó theo thứ tự ngược lại.
- Bài 7: Viết chương trình hợp ngữ Assembly chuyển một số từ hệ cơ số 10 sang hệ nhị phân.
- Bài 8: Viết chương trình hợp ngữ Assembly chuyển một số từ hệ cơ số 10 sang hệ cơ số 16 (Hexa).
- Bài 9: Viết chương trình hợp ngữ Assembly cho phép nhập số nhị phân (8 bit) chứa vào trong thanh ghi BL. Chương trình phải kiểm tra ký tự nhập có hợp lệ hay không (ký tự "0"hoặc ký tự "1"). Việc nhập kết thúc khi nhấn # hoặc đủ 8 bit. Xuất ra số đã nhập dưới dạng hệ thập lục phân (hệ 16).
- Bài 10: Viết chương trình hợp ngữ Assembly yều cầu đếm chiều dài của một chuỗi ký tự cho trước.
- Bài 11: Viết chương trình hợp ngữ Assembly tìm giá trị lớn nhất và nhỏ nhất của một mảng số.
- Bài 12: Viết chương trình hợp ngữ Assembly cho phép nhập vào một số và in ra màn hình giai thừa của số đó.
- Bài 13: Viết chương trình hợp ngữ Assembly cho phép nhập vào các số và in ra màn hình tổng của các số đó.
- Bài 14: Viết chương trình hợp ngữ Assembly cho phép nhập vào 2 số và in ra màn hình ƯCLN và BCNN của hai số đó.
- Bài 15: Viết chương trình hợp ngữ Assembly cho phép in ra số lượng các số chia hết cho 11 và tính tổng của các số đó từ một mảng cho trước.
- Bài 16: Viết chương trình hợp ngữ Assembly tính tổng 2 số kiểu word.
- Bài 17: Viết chương trình hợp ngữ cho phép nhập vào một mảng gồm 10 số có hai chữ số. Tính tổng các số chia hết cho 7. In tổng thu được ra màn hình dưới dạng thập phân.
- Bài 18: Viết chương trình hợp ngữ đếm số lần xuất hiện của chuỗi con "ktmt"trong một chuỗi. In kết quả dưới dạng số thập phân.
- Bài 19: Viết chương trình hợp ngữ cho hai chuỗi ký tự A và B có độ dài là n và m (n > m), chỉ ra xâu B có phải là xâu con của xâu A không? Nếu xâu B là xâu con của xâu A thì chỉ ra vị trí xâu B ở xâu A.
- Bài 20: Viết chương trình hợp ngữ cho hai chuỗi ký tự A và B có độ dài là n
và m (n > m), chỉ ra xâu A chứa mấy xâu B.

---

### 🎮 Bài tập lớn nhóm

#### 1. 🕹 Game **Tic Tac Toe (Cờ ca-rô)** trên Emu8086
- Viết hoàn chỉnh bằng Assembly
- Hỗ trợ chơi 2 người, luân phiên đánh dấu X/O
- Hiển thị giao diện 3x3 trên console
- Tự động kiểm tra thắng/thua/hòa
- Sử dụng mảng một chiều, đếm lượt, kiểm tra điều kiện thắng

🔗 Phân tích mã nguồn: [TicTacToe](https://github.com/trandinhhao/PTIT-KTMT-Assembly/blob/main/Tic_Tac_Toe.asm)

#### 2. 💵 Ứng dụng **Quản lý hóa đơn nhà hàng** trên Emu8086
- Cho phép người dùng chọn món ăn, tính tổng hóa đơn
- Hiển thị chi tiết món, giá, số lượng
- Giao diện console trực quan
- Lập trình bằng Assembly trên Emu8086

🔗 Phân tích mã nguồn: [QuanLyHoaDonNhaHang](https://github.com/trandinhhao/PTIT-KTMT-Assembly/blob/main/Restaurant_Billing_System.asm)

---

## 🛠 Công cụ sử dụng

- **Emu8086 Microprocessor Emulator**  
- **CPU-Z** (phân tích cấu hình máy)
- **Flowchart Maker / Draw.io** (vẽ sơ đồ thuật toán)

---

## 📜 License

Tài liệu phục vụ mục đích học tập tại PTIT. Không sử dụng cho mục đích thương mại.
