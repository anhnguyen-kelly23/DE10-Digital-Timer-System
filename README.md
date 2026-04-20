# Digital Clock with Nios II (Bài 4 - Timer)

Dự án này triển khai một hệ thống đồng hồ số (Giờ:Phút:Giây) trên kit FPGA sử dụng vi xử lý Nios II, tích hợp phần cứng tùy chỉnh (Verilog) và phần mềm điều khiển (C).

## 1. Thành phần hệ thống

### Phần cứng (Hardwares)
- **CPU**: Nios II Processor.
- **Platform Designer (QSYS)**: Tích hợp các thành phần hệ thống.
- **Custom IP (Verilog)**:
    - `hexs.v`: Điều khiển 6 LED 7 đoạn để hiển thị Giờ, Phút, Giây.
    - `switches.v`: Đọc trạng thái từ 10 thanh gạt (Switches).
    - `red_leds.v`: Điều khiển LED đỏ (tùy chọn).
    - `decoder.v`: Giải mã LED 7 đoạn.
- **Timer**: Sử dụng Altera Avalon Timer để tạo ngắt mỗi 1 giây (50MHz).

### Phần mềm (Software)
- Viết bằng ngôn ngữ C sử dụng HAL (Hardware Abstraction Layer).
- Sử dụng ngắt (ISR) để đếm thời gian chính xác.

---

## 2. Hướng dẫn vận hành (User Guide)

Hệ thống sử dụng các switch trên kit để điều chỉnh thời gian và chế độ hoạt động.

| Switch | Chức năng | Mô tả |
| :--- | :--- | :--- |
| **SW9** | **Chế độ (Mode)** | - `0`: Chế độ chạy tự động (Đồng hồ đếm lên).<br>- `1`: Chế độ chỉnh tay (Cho phép điều chỉnh thời gian). |
| **SW8 - SW7** | **Chọn đơn vị chỉnh** | Chỉ có tác dụng khi `SW9 = 1`:<br>- `00`: Chỉnh **Giây**.<br>- `01`: Chỉnh **Phút**.<br>- `10`: Chỉnh **Giờ**. |
| **SW6 - SW4** | **Chỉnh hàng chục** | Giá trị từ 0 đến 5 (hoặc 2 cho hàng chục của Giờ). |
| **SW3 - SW0** | **Chỉnh hàng đơn vị** | Giá trị từ 0 đến 9. |

### Ví dụ cách chỉnh:
Để chỉnh đồng hồ thành **12:30:00**:
1. Gạt **SW9** lên `1`.
2. Gạt **SW8-SW7** thành `10` (Chỉnh Giờ). Gạt các switch giá trị sao cho hiện số 12.
3. Gạt **SW8-SW7** thành `01` (Chỉnh Phút). Gạt các switch giá trị sao cho hiện số 30.
4. Gạt **SW8-SW7** thành `00` (Chỉnh Giây). Gạt các switch giá trị về 00.
5. Gạt **SW9** về `0` để đồng hồ bắt đầu chạy từ thời gian vừa chỉnh.

---

## 3. Cấu trúc thư mục
- `/system`: Chứa các file Qsys/Platform Designer.
- `/Software/MA_timer`: Chứa mã nguồn C (`hello_world.c`).
- các file `.v`: Mã nguồn Verilog cho các thành phần ngoại vi.

## 4. Cách Build & Run
1. Mở dự án bằng Quartus Prime.
2. Compile phần cứng (`Analysis & Synthesis` -> `Fitter` -> `Assembler`).
3. Nạp file `.sof` vào board FPGA.
4. Mở Nios II Software Build Tools for Eclipse.
5. Build Project và Run as Nios II Hardware.
