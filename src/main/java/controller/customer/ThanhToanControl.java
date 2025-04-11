package controller.customer;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import repository.hoadon.HoaDonRepository;

import java.io.IOException;

@WebServlet(name = "ThanhToanControl", value = {"/ThanhToanControl",
        "/thanh-toan/hien-thi",
})

public class ThanhToanControl extends HttpServlet {
    private final repository.hoadon.HoaDonRepository HoaDonRepository;

    public ThanhToanControl() {
        HoaDonRepository = new HoaDonRepository();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.contains("/thanh-toan/hien-thi")) {
            hienThiThanhToan(request, response);
        }
    }

    private void hienThiThanhToan(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/views_customer/checkout.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
