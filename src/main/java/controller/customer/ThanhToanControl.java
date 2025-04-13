package controller.customer;

import entity.gio.hang.GioHangChiTiet;
import entity.hoa.don.ChiTietHoaDon;
import entity.hoa.don.HoaDon;
import entity.khach.hang.KhachHang;
import entity.san.pham.ChiTietSanPham;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import repository.customer.hoadon.HoaDonRepository;
import repository.customer.khachhang.KhachHangRepository;
import repository.customer.sanpham.ChiTietSanPhamRepository;

import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet(name = "ThanhToanControl", value = {
        "/ThanhToanControl",
        "/thanh-toan/hien-thi",
        "/thanh-toan/hoan-tat",
        "/thanh-toan/thanh-cong",
        "/thanh-toan/lich-su-hoa-don"
})
public class ThanhToanControl extends HttpServlet {
    private final HoaDonRepository hoaDonRepository;
    private final KhachHangRepository khachHangRepository;
    private final ChiTietSanPhamRepository chiTietSanPhamRepository;

    public ThanhToanControl() {
        hoaDonRepository = new HoaDonRepository();
        khachHangRepository = new KhachHangRepository();
        chiTietSanPhamRepository = new ChiTietSanPhamRepository();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();

        if (uri.contains("/thanh-toan/hien-thi")) {
            hienThiThanhToan(request, response);
            return;
        }

        if (uri.contains("/thanh-toan/thanh-cong")) {
            hienThiThanhCong(request, response);
            return;
        }

        if (uri.contains("/thanh-toan/hoan-tat")) {
            // Xử lý hoàn tất thanh toán
            // Có thể chuyển hướng hoặc hiển thị trang thành công
            response.sendRedirect(request.getContextPath() + "/thanh-toan/thanh-cong");
            return;
        }

        if (uri.contains("/lich-su-hoa-don")) {
            hienThiLichSuHoaDon(request, response);
            return;
        }

        response.sendError(HttpServletResponse.SC_NOT_FOUND, "Đường dẫn không hợp lệ");
    }

    private void hienThiThanhToan(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<GioHangChiTiet> cartItems = (List<GioHangChiTiet>) session.getAttribute("cartItems");

        if (cartItems == null || cartItems.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/gio-hang/hien-thi?error=empty");
            return;
        }

        double tongTien = cartItems.stream()
                .mapToDouble(item -> item.getSoLuong() * item.getSanPham().getChiTietSanPham().getDonGia())
                .sum();
        double giamGia = 0.0; // Mặc định không có giảm giá
        double tongCong = tongTien - giamGia;

        request.setAttribute("tongTien", tongTien);
        request.setAttribute("giamGia", giamGia);
        request.setAttribute("tongCong", tongCong);

        request.getRequestDispatcher("/views/views_customer/checkout.jsp").forward(request, response);
    }

    private void hienThiThanhCong(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/views_customer/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("---- Bắt đầu xử lý thanh toán ----");

        HttpSession session = request.getSession();
        List<GioHangChiTiet> cartItems = (List<GioHangChiTiet>) session.getAttribute("cartItems");

        if (cartItems == null || cartItems.isEmpty()) {
            System.out.println("Giỏ hàng trống, chuyển hướng...");
            response.sendRedirect(request.getContextPath() + "/gio-hang/hien-thi?error=empty");
            return;
        }

        try {
            // Thu thập thông tin khách hàng từ form
            String hoKhachHang = request.getParameter("hoKhachHang");
            String tenKhachHang = request.getParameter("tenKhachHang");
            String diaChi = request.getParameter("diaChi");
            String soDienThoai = request.getParameter("soDienThoai");
            String gioiTinh = request.getParameter("gioiTinh");
            String ngaySinhStr = request.getParameter("ngaySinh");
            String phuongThucThanhToan = request.getParameter("phuongThucThanhToan");

            System.out.println("Phương thức thanh toán: " + phuongThucThanhToan);
            System.out.println("Thông tin KH: " + hoKhachHang + " " + tenKhachHang + ", SĐT: " + soDienThoai);

            KhachHang khachHang;

            // Xử lý khách vãng lai khi thanh toán bằng PayPal
            if ("paypal".equals(phuongThucThanhToan) && (soDienThoai == null || soDienThoai.trim().isEmpty())) {
                System.out.println("Xử lý như khách vãng lai");
                khachHang = new KhachHang();
                khachHang.setTenKhachHang("Khách vãng lai");
                khachHang.setDiaChi("Không có");
                khachHang.setSdt("0000000000");
                khachHang.setGioiTinh(true);
                khachHangRepository.save(khachHang);
                System.out.println("Đã tạo khách vãng lai ID: " + khachHang.getId());
            } else {
                // Kiểm tra thông tin bắt buộc
                if (soDienThoai == null || soDienThoai.trim().isEmpty()) {
                    request.setAttribute("error", "Vui lòng nhập số điện thoại");
                    request.getRequestDispatcher("/views/views_customer/checkout.jsp").forward(request, response);
                    return;
                }

                // Kiểm tra khách hàng dựa trên SĐT
                khachHang = khachHangRepository.findKhachHangBySdt(soDienThoai);
                if (khachHang == null) {
                    khachHang = new KhachHang();
                    khachHang.setTenKhachHang((hoKhachHang != null ? hoKhachHang : "") + " " + (tenKhachHang != null ? tenKhachHang : ""));
                    khachHang.setDiaChi(diaChi != null ? diaChi : "");
                    khachHang.setSdt(soDienThoai);
                    khachHang.setGioiTinh(gioiTinh != null && gioiTinh.equals("false") ? false : true);
                    if (ngaySinhStr != null && !ngaySinhStr.isEmpty()) {
                        khachHang.setNgaySinh(java.sql.Date.valueOf(ngaySinhStr));
                    }
                    khachHangRepository.save(khachHang);
                    System.out.println("Đã tạo khách hàng mới ID: " + khachHang.getId());
                } else {
                    System.out.println("Đã tìm thấy khách hàng ID: " + khachHang.getId());
                }
            }

            // Tính toán tổng tiền
            double tongTien = cartItems.stream()
                    .mapToDouble(item -> item.getSoLuong() * item.getSanPham().getChiTietSanPham().getDonGia())
                    .sum();
            double giamGia = 0.0;
            double tongCong = tongTien - giamGia;

            System.out.println("Tổng tiền: " + tongTien + ", Giảm giá: " + giamGia + ", Thành tiền: " + tongCong);

            //Kiem tra trang thai
            HoaDon hoaDonTonTai = hoaDonRepository.getHoaDonByKhachHangAndTrangThai(khachHang.getId(), true);
            if (hoaDonTonTai != null) {
                hoaDonTonTai.setTrangThai(false); // Đánh dấu hóa đơn cũ là hoàn tất
                hoaDonRepository.luuHoaDon(hoaDonTonTai);
            }
            // Tạo hóa đơn mới
            HoaDon hoaDon = new HoaDon();
            hoaDon.setKhachHang(khachHang);
            hoaDon.setTongTien(tongTien);
            hoaDon.setGiamGia(giamGia);
            hoaDon.setThanhTien(tongCong);
            hoaDon.setNgayTao(new Date());
            hoaDon.setTrangThai(true);
            hoaDon.setPhuongThucThanhToan(phuongThucThanhToan);

            // Lưu hóa đơn và kiểm tra kết quả
            boolean hoaDonSaved = hoaDonRepository.luuHoaDon(hoaDon);

            if (!hoaDonSaved) {
                System.out.println("LỖI: Không thể lưu hóa đơn!");
                request.setAttribute("error", "Lỗi khi lưu hóa đơn!");
                request.getRequestDispatcher("/views/views_customer/checkout.jsp").forward(request, response);
                return;
            }

            System.out.println("Đã lưu hóa đơn thành công, ID: " + hoaDon.getId() + ", Mã: " + hoaDon.getMaHoaDon());

            // Lưu chi tiết hóa đơn và cập nhật tồn kho
            try {
                for (GioHangChiTiet item : cartItems) {
                    ChiTietHoaDon chiTietHoaDon = new ChiTietHoaDon();
                    chiTietHoaDon.setHoaDon(hoaDon);
                    chiTietHoaDon.setSanPham(item.getSanPham());
                    chiTietHoaDon.setSoLuong(item.getSoLuong());
                    chiTietHoaDon.setDonGia(item.getSanPham().getChiTietSanPham().getDonGia());
                    chiTietHoaDon.setTrangThai(true);

                    hoaDonRepository.luuHoaDonChiTiet(chiTietHoaDon);
                    System.out.println("Đã lưu chi tiết hóa đơn cho sản phẩm ID: " + item.getSanPham().getId());

                    // Cập nhật tồn kho
                    ChiTietSanPham chiTietSanPham = item.getSanPham().getChiTietSanPham();
                    int soLuongTon = Math.max(chiTietSanPham.getSoLuong() - item.getSoLuong(), 0);
                    chiTietSanPham.setSoLuong(soLuongTon);
                    chiTietSanPhamRepository.update(chiTietSanPham);
                    System.out.println("Đã cập nhật tồn kho sản phẩm ID: " + chiTietSanPham.getId() + ", SL còn: " + soLuongTon);
                }
            } catch (Exception e) {
                System.err.println("Lỗi khi lưu chi tiết hóa đơn: " + e.getMessage());
                e.printStackTrace();
            }

            // Xóa giỏ hàng
            session.removeAttribute("cartItems");
            System.out.println("Đã xóa giỏ hàng khỏi session");
            request.setAttribute("hoaDon", hoaDon);
            request.setAttribute("tongCong", tongCong);
            System.out.println("Chuyển hướng đến trang thành công...");
            session.setAttribute("successMessage", "Thanh toán thành công! Cảm ơn bạn đã mua hàng.");
            request.getRequestDispatcher("/views/views_customer/index.jsp").forward(request, response);

        } catch (Exception e) {
            System.err.println("LỖI NGOẠI LỆ: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("error", "Đã xảy ra lỗi trong quá trình thanh toán!");
            request.getRequestDispatcher("/views/views_customer/checkout.jsp").forward(request, response);
        }
    }
    private void hienThiLichSuHoaDon(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        KhachHang khachHang = (KhachHang) session.getAttribute("currentCustomer");

        if (khachHang != null) {
            List<HoaDon> hoaDonList = hoaDonRepository.getHoaDonByKhachHang(khachHang.getId());
            request.setAttribute("hoaDonList", hoaDonList);
        } else {
            String soDienThoai = request.getParameter("soDienThoai");

            if (soDienThoai == null || soDienThoai.trim().isEmpty()) {
                request.setAttribute("error", "Vui lòng nhập số điện thoại để xem lịch sử hóa đơn!");
                request.getRequestDispatcher("/views/views_customer/lichSuHoaDon.jsp").forward(request, response);
                return;
            }

            List<HoaDon> hoaDonList = hoaDonRepository.getHoaDonBySdt(soDienThoai); // Cần phương thức mới trong repository
            request.setAttribute("hoaDonList", hoaDonList);
        }

        request.getRequestDispatcher("/views/views_customer/lichSuHoaDon.jsp").forward(request, response);
    }
}