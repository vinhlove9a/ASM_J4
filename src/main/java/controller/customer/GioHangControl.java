package controller.customer;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import repository.hoadon.HoaDonRepository;
import repository.san.pham.KichThuocRepository;
import repository.san.pham.MauSacRepository;
import repository.san.pham.SanPhamRepository;
import repository.san.pham.ThuongHieuRepository;

import java.io.IOException;

@WebServlet(name = "GioHangControl", value = {"/GioHangControl",
        "/gio-hang/hien-thi",
}
)
public class GioHangControl extends HttpServlet {
    private final HoaDonRepository HoaDonRepository;

    public GioHangControl() {
        HoaDonRepository = new HoaDonRepository();
    }

    @Override

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.contains("/gio-hang/hien-thi")) {
            hienThiGioHang(request, response);
        }
    }

    private void hienThiGioHang(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/views_customer/shopping-cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
