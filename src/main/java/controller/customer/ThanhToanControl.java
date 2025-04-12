package controller.customer;

import entity.gio.hang.GioHangChiTiet;
import entity.hoa.don.ChiTietHoaDon;
import entity.hoa.don.HoaDon;
import entity.khach.hang.KhachHang;
import entity.san.pham.ChiTietSanPham;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import repository.hoadon.HoaDonRepository;
import repository.khachhang.KhachHangRepository;
import repository.san.pham.ChiTietSanPhamRepository;

import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet(name = "ThanhToanControl", value = {
        "/ThanhToanControl",
        "/thanh-toan/hien-thi",
        "/thanh-toan/hoan-tat",
        "/thanh-toan/thanh-cong"
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
        HttpSession session = request.getSession();
        List<GioHangChiTiet> cartItems = (List<GioHangChiTiet>) session.getAttribute("cartItems");

        if (cartItems == null || cartItems.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/gio-hang/hien-thi?error=empty");
            return;
        }

        // Thu thập thông tin khách hàng từ form
        String hoKhachHang = request.getParameter("hoKhachHang");
        String tenKhachHang = request.getParameter("tenKhachHang");
        String diaChi = request.getParameter("diaChi");
        String soDienThoai = request.getParameter("soDienThoai");
        String gioiTinh = request.getParameter("gioiTinh");
        String ngaySinhStr = request.getParameter("ngaySinh");

        // Kiểm tra khách hàng dựa trên SĐT
        KhachHang khachHang = khachHangRepository.findKhachHangBySdt(soDienThoai);
        if (khachHang == null) {
            khachHang = new KhachHang();
            khachHang.setMaKhachHang("KH" + System.currentTimeMillis());
            khachHang.setTenKhachHang(hoKhachHang + " " + tenKhachHang);
            khachHang.setDiaChi(diaChi);
            khachHang.setSdt(soDienThoai);
            khachHang.setGioiTinh(gioiTinh != null && gioiTinh.equals("false") ? false : true); // Mặc định nam
            if (ngaySinhStr != null && !ngaySinhStr.isEmpty()) {
                khachHang.setNgaySinh(java.sql.Date.valueOf(ngaySinhStr));
            }
            khachHangRepository.save(khachHang);
        }

        // Tính toán tổng tiền và xử lý hóa đơn
        double tongTien = cartItems.stream()
                .mapToDouble(item -> item.getSoLuong() * item.getSanPham().getChiTietSanPham().getDonGia())
                .sum();
        double giamGia = 0.0; // Không giảm giá mặc định
        double tongCong = tongTien - giamGia;

        HoaDon hoaDonTonTai = hoaDonRepository.getHoaDonByKhachHangAndTrangThai(khachHang.getId(), true);
        if (hoaDonTonTai != null) {
            response.sendRedirect(request.getContextPath() + "/thanh-toan/hien-thi?error=duplicate");
            return;
        }

        // Tạo và lưu hóa đơn
        HoaDon hoaDon = new HoaDon();
        hoaDon.setKhachHang(khachHang);
        hoaDon.setMaHoaDon("HD" + System.currentTimeMillis());
        hoaDon.setTongTien(tongTien);
        hoaDon.setGiamGia(giamGia);
        hoaDon.setThanhTien(tongCong);
        hoaDon.setNgayTao(new Date());
        hoaDon.setTrangThai(true);
        hoaDon.setPhuongThucThanhToan(request.getParameter("phuongThucThanhToan"));

        hoaDonRepository.luuHoaDon(hoaDon);

        // Lưu chi tiết hóa đơn và cập nhật tồn kho
        for (GioHangChiTiet item : cartItems) {
            ChiTietHoaDon chiTietHoaDon = new ChiTietHoaDon();
            chiTietHoaDon.setHoaDon(hoaDon);
            chiTietHoaDon.setSanPham(item.getSanPham());
            chiTietHoaDon.setSoLuong(item.getSoLuong());
            chiTietHoaDon.setDonGia(item.getSanPham().getChiTietSanPham().getDonGia());
            chiTietHoaDon.setTrangThai(true);
            hoaDonRepository.luuHoaDonChiTiet(chiTietHoaDon);

            ChiTietSanPham chiTietSanPham = item.getSanPham().getChiTietSanPham();
            int soLuongTon = Math.max(chiTietSanPham.getSoLuong() - item.getSoLuong(), 0); // Không để tồn kho âm
            chiTietSanPham.setSoLuong(soLuongTon);
            chiTietSanPhamRepository.update(chiTietSanPham);
        }

        session.removeAttribute("cartItems"); // Xóa giỏ hàng

        request.setAttribute("hoaDon", hoaDon);
        request.setAttribute("tongCong", tongCong);
        request.getRequestDispatcher("/views/views_customer/index.jsp").forward(request, response);
    }
}