package controller.customer;

import entity.gio.hang.GioHangChiTiet;
import entity.san.pham.ChiTietSanPham;
import entity.san.pham.SanPham;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import repository.giohang.GioHangChiTietRepository;
import repository.giohang.GioHangRepository;
import repository.san.pham.ChiTietSanPhamRepository;
import repository.san.pham.SanPhamRepository;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@WebServlet(name = "GioHangControl", value = {
        "/GioHangControl",
        "/gio-hang/hien-thi", // Hiển thị giỏ hàng
        "/gio-hang/xoa",      // Xóa sản phẩm khỏi giỏ hàng (bằng doGet)
        "/gio-hang/them",     // Thêm sản phẩm vào giỏ hàng
        "/gio-hang/cap-nhat"  // Cập nhật số lượng sản phẩm
})
public class GioHangControl extends HttpServlet {
    private final GioHangRepository gioHangRepository;
    private final GioHangChiTietRepository gioHangChiTietRepository;
    private final SanPhamRepository sanPhamRepository;
    private final ChiTietSanPhamRepository chiTietSanPhamRepository;

    public GioHangControl() {
        this.gioHangRepository = new GioHangRepository();
        this.gioHangChiTietRepository = new GioHangChiTietRepository();
        this.sanPhamRepository = new SanPhamRepository();
        this.chiTietSanPhamRepository = new ChiTietSanPhamRepository();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.contains("/gio-hang/hien-thi")) {
            hienThiGioHang(request, response);
        } else if (uri.contains("/gio-hang/xoa")) {
            xoaSanPhamKhoiGioHang(request, response); // Xử lý xóa bằng GET
        } else {
            response.sendRedirect(request.getContextPath() + "/error");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.contains("/gio-hang/them")) {
            themSanPhamVaoGioHang(request, response);
        }
    }

    protected void hienThiGioHang(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<GioHangChiTiet> cartItems = (List<GioHangChiTiet>) session.getAttribute("cartItems");

        if (cartItems == null || cartItems.isEmpty()) {
            request.setAttribute("tongTamTinh", 0.0);
            request.setAttribute("tongCong", 0.0);
        } else {
            double tongTamTinh = cartItems.stream()
                    .mapToDouble(item -> item.getSoLuong() * item.getSanPham().getChiTietSanPham().getDonGia())
                    .sum();
            double giamGia = 0.0; // Mặc định không có giảm giá
            double tongCong = tongTamTinh - giamGia;

            request.setAttribute("tongTamTinh", tongTamTinh);
            request.setAttribute("tongCong", tongCong);
        }

        request.setAttribute("cartItems", cartItems);
        request.getRequestDispatcher("/views/views_customer/shopping-cart.jsp").forward(request, response);
    }

    protected void themSanPhamVaoGioHang(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        List<GioHangChiTiet> cartItems = (List<GioHangChiTiet>) session.getAttribute("cartItems");

        if (cartItems == null) {
            cartItems = new ArrayList<>();
            session.setAttribute("cartItems", cartItems);
        }

        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantityToAdd = Integer.parseInt(request.getParameter("soLuong"));
        SanPham sanPham = sanPhamRepository.laySanPhamTheoId(productId);
        ChiTietSanPham chiTietSanPham = sanPham.getChiTietSanPham();

        if (chiTietSanPham.getSoLuong() < quantityToAdd) {
            response.sendRedirect(request.getContextPath() + "/gio-hang/hien-thi?error=not-enough-stock");
            return;
        }

        boolean exists = false;
        for (GioHangChiTiet item : cartItems) {
            if (item.getSanPham().getId() == productId) {
                item.setSoLuong(item.getSoLuong() + quantityToAdd);
                chiTietSanPham.setSoLuong(chiTietSanPham.getSoLuong() - quantityToAdd);
                exists = true;
                break;
            }
        }

        if (!exists) {
            GioHangChiTiet gioHangChiTiet = new GioHangChiTiet();
            gioHangChiTiet.setSanPham(sanPham);
            gioHangChiTiet.setSoLuong(quantityToAdd);
            gioHangChiTiet.setDonGia(chiTietSanPham.getDonGia());
            cartItems.add(gioHangChiTiet);

            chiTietSanPham.setSoLuong(chiTietSanPham.getSoLuong() - quantityToAdd);
        }

        System.out.println("Stock after addition: " + chiTietSanPham.getSoLuong());
        chiTietSanPhamRepository.update(chiTietSanPham);

        session.setAttribute("cartItems", cartItems);
        response.sendRedirect(request.getContextPath() + "/gio-hang/hien-thi");
    }

    protected void xoaSanPhamKhoiGioHang(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        List<GioHangChiTiet> cartItems = (List<GioHangChiTiet>) session.getAttribute("cartItems");

        if (cartItems != null) {
            int productId = Integer.parseInt(request.getParameter("productId"));
            int quantityToRemove = Integer.parseInt(request.getParameter("quantityToRemove"));

            Iterator<GioHangChiTiet> iterator = cartItems.iterator();
            while (iterator.hasNext()) {
                GioHangChiTiet item = iterator.next();
                if (item.getSanPham().getId() == productId) {
                    // Lấy tồn kho mới nhất từ DB
                    ChiTietSanPham chiTietSanPham = chiTietSanPhamRepository.findById(productId);
                    System.out.println("Stock before operation (from DB): " + chiTietSanPham.getSoLuong());

                    // Kiểm tra và cập nhật tồn kho
                    if (item.getSoLuong() > quantityToRemove) {
                        item.setSoLuong(item.getSoLuong() - quantityToRemove);
                        chiTietSanPham.setSoLuong(chiTietSanPham.getSoLuong() + quantityToRemove);
                    } else {
                        chiTietSanPham.setSoLuong(chiTietSanPham.getSoLuong() + item.getSoLuong());
                        iterator.remove();
                    }

                    // Log và cập nhật vào DB
                    System.out.println("Stock after update: " + chiTietSanPham.getSoLuong());
                    chiTietSanPhamRepository.update(chiTietSanPham);
                    break;
                }
            }
        }

        session.setAttribute("cartItems", cartItems);
        response.sendRedirect(request.getContextPath() + "/gio-hang/hien-thi");
    }
}