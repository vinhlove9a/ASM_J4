package controller.customer;

import entity.khach.hang.KhachHang;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import repository.khachhang.KhachHangRepository;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "LoginControl", value = "/LoginControl")
public class LoginControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        if ("modal".equals(action)) {
            HttpSession session = request.getSession();
            request.setAttribute("success", session.getAttribute("success"));
            request.setAttribute("error", session.getAttribute("error"));
            session.removeAttribute("success");
            session.removeAttribute("error");
            session.removeAttribute("openLoginModal");

            request.getRequestDispatcher("/views/views_login/customer/login.jsp").forward(request, response);
        } else if ("logout".equals(action)) {
            HttpSession session = request.getSession();
            session.removeAttribute("user");
            session.setAttribute("success", "Đăng xuất thành công!");
            response.sendRedirect("/trang-chu/hien-thi");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        if ("login".equals(action)) {
            xuLyDangNhap(request, response);
        } else if ("register".equals(action)) {
            xuLyDangKy(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Hành động không hợp lệ!");
        }
    }

    private void xuLyDangNhap(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        HttpSession session = request.getSession();

        // Đăng nhập Khách hàng
        KhachHang khachHang = KhachHangRepository.dangNhapKhachHang(username, password);
        if (khachHang != null) {
            session.setAttribute("userRole", "KHACH_HANG"); // Đánh dấu vai trò
            session.setAttribute("user", khachHang); // Lưu thông tin khách hàng
            session.setAttribute("success", "Đăng nhập thành công!");
            response.sendRedirect("/trang-chu/hien-thi");
            return;
        }

        // Đăng nhập Nhân viên

        // Đăng nhập thất bại
        session.setAttribute("error", "Tài khoản hoặc mật khẩu không chính xác!");
        session.setAttribute("openLoginModal", true);
        response.sendRedirect("/trang-chu/hien-thi");
    }

    private void xuLyDangKy(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        Map<String, String> errors = new HashMap<>();

        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");

        // Kiểm tra các trường bắt buộc
        if (name == null || name.trim().isEmpty()) {
            errors.put("name", "Tên không được để trống!");
        }
        if (phone == null || phone.trim().isEmpty()) {
            errors.put("phone", "Số điện thoại không được để trống!");
        } else if (!phone.matches("\\d{10}")) {
            errors.put("phone", "Số điện thoại phải có 10 chữ số!");
        } else if (KhachHangRepository.isPhoneExist(phone)) {
            errors.put("phone", "Số điện thoại đã tồn tại!");
        }
        if (password == null || password.trim().isEmpty()) {
            errors.put("password", "Mật khẩu không được để trống!");
        }
        if (gender == null) {
            errors.put("gender", "Vui lòng chọn giới tính!");
        }

        if (!errors.isEmpty()) {
            session.setAttribute("errors", errors); // Lưu lỗi vào session
            session.setAttribute("openLoginModal", true); // Kích hoạt modal
            response.sendRedirect("/trang-chu/hien-thi"); // Chuyển hướng về index.jsp
            return;
        }

        // Xử lý đăng ký nếu không có lỗi
        boolean result = KhachHangRepository.dangKyKhachHang(name, phone, address, password, Integer.parseInt(gender), null);
        if (result) {
            session.setAttribute("success", "Đăng ký thành công! Vui lòng đăng nhập.");
        } else {
            session.setAttribute("error", "Đã xảy ra lỗi khi xử lý đăng ký!");
        }
        response.sendRedirect("/trang-chu/hien-thi");
    }
}