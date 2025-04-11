package controller.admin;

import entity.san.pham.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.hibernate.exception.ConstraintViolationException;
import repository.san.pham.KichThuocRepository;
import repository.san.pham.MauSacRepository;
import repository.san.pham.SanPhamRepository;
import repository.san.pham.ThuongHieuRepository;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "SanPhamControl", urlPatterns = {
        "/sanpham/hien-thi",       // Hiển thị danh sách sản phẩm
        "/sanpham/add",            // Thêm sản phẩm mới
        "/sanpham/delete",         // Xóa sản phẩm
        "/sanpham/detail"          // Xem chi tiết sản phẩm (fill form)
})
public class SanPhamControl extends HttpServlet {


    @Override
    public void init() throws ServletException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }


}