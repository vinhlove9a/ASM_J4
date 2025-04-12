package controller.customer;

import entity.khach.hang.KhachHang;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import repository.khachhang.KhachHangRepository;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

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

        KhachHang khachHang = KhachHangRepository.dangNhapKhachHang(username, password);

        if (khachHang != null) {
            // Đăng nhập thành công
            session.setAttribute("user", khachHang);
            session.setAttribute("success", "Đăng nhập thành công!");
            response.sendRedirect("/trang-chu/hien-thi");
        } else {
            // Đăng nhập thất bại
            session.setAttribute("error", "Tài khoản hoặc mật khẩu không chính xác!");
            session.setAttribute("openLoginModal", true);
            response.sendRedirect("/trang-chu/hien-thi");
        }
    }

    private void xuLyDangKy(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();

        try {
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String password = request.getParameter("password");
            String genderStr = request.getParameter("gender");
            String birthdateStr = request.getParameter("birthdate");

            // Kiểm tra các trường bắt buộc không được để trống
            if (name == null || name.trim().isEmpty() ||
                    phone == null || phone.trim().isEmpty() ||
                    password == null || password.trim().isEmpty() ||
                    genderStr == null || genderStr.trim().isEmpty()) {
                session.setAttribute("error", "Các trường bắt buộc không được để trống!");
                session.setAttribute("openLoginModal", true);
                response.sendRedirect("/trang-chu/hien-thi");
                return;
            }

            // Kiểm tra định dạng số điện thoại
            if (!phone.matches("\\d{10}")) {
                session.setAttribute("error", "Số điện thoại phải có 10 chữ số!");
                session.setAttribute("openLoginModal", true);
                response.sendRedirect("/trang-chu/hien-thi");
                return;
            }

            int gender = Integer.parseInt(genderStr);
            Date birthdate = null;
            if (birthdateStr != null && !birthdateStr.trim().isEmpty()) {
                birthdate = new SimpleDateFormat("yyyy-MM-dd").parse(birthdateStr);
            }

            boolean result = KhachHangRepository.dangKyKhachHang(name, phone, address, password, gender, birthdate);

            if (result) {
                session.setAttribute("success", "Đăng ký thành công! Vui lòng đăng nhập.");
            } else {
                session.setAttribute("error", "Số điện thoại đã tồn tại!");
            }
            session.setAttribute("openLoginModal", true);
            response.sendRedirect("/trang-chu/hien-thi");

        } catch (NumberFormatException e) {
            session.setAttribute("error", "Dữ liệu không hợp lệ!");
            session.setAttribute("openLoginModal", true);
            response.sendRedirect("/trang-chu/hien-thi");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Đã xảy ra lỗi khi xử lý đăng ký!");
            session.setAttribute("openLoginModal", true);
            response.sendRedirect("/trang-chu/hien-thi");
        }
    }
}