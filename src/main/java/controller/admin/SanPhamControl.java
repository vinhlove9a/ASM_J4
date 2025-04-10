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
    private SanPhamRepository sanPhamRepository;
    private ThuongHieuRepository thuongHieuRepository;
    private MauSacRepository mauSacRepository;
    private KichThuocRepository kichThuocRepository;

    @Override
    public void init() throws ServletException {
        sanPhamRepository = new SanPhamRepository();       // Kết nối repository cho Sản phẩm
        thuongHieuRepository = new ThuongHieuRepository(); // Kết nối repository cho Thương hiệu
        mauSacRepository = new MauSacRepository();         // Kết nối repository cho Màu sắc
        kichThuocRepository = new KichThuocRepository();   // Kết nối repository cho Kích thước
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();

        if (uri.contains("/hien-thi")) {
            hienThiDanhSach(request, response); // Hiển thị danh sách sản phẩm + combobox
        } else if (uri.contains("/detail")) {
            showChiTiet(request, response); // Hiển thị thông tin chi tiết để fill form
        } else if (uri.contains("/delete")) {
            xoaSanPham(request, response); // Xóa sản phẩm
        }

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();

        if (uri.contains("/add")) {
            try {
                themSanPham(request, response);
            } catch (ConstraintViolationException e) {
                response.getWriter().write("Thêm sản phẩm thất bại: " + e.getMessage());
            } catch (Exception e) {
                response.getWriter().write("Lỗi không xác định: " + e.getMessage());
            }
        }
    }

    // **Phương thức hiển thị danh sách sản phẩm**
    private void hienThiDanhSach(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy danh sách Sản phẩm, Thương hiệu, Màu sắc, và Kích thước
        List<SanPham> listSanPham = sanPhamRepository.getAllSanPham();
        List<ThuongHieu> listThuongHieu = thuongHieuRepository.getAllThuongHieu();
        List<MauSac> listMauSac = mauSacRepository.getAllMauSac();
        List<KichThuoc> listKichThuoc = kichThuocRepository.getAllKichThuoc();

        // Đặt các danh sách vào request để hiển thị trong JSP
        request.setAttribute("listSanPham", listSanPham);
        request.setAttribute("listThuongHieu", listThuongHieu);
        request.setAttribute("listMauSac", listMauSac);
        request.setAttribute("listKichThuoc", listKichThuoc);

        // Chuyển tiếp đến file JSP hiển thị danh sách sản phẩm
        request.getRequestDispatcher("/views/views_admin/san-pham/hien-thi.jsp").forward(request, response);
    }

    // **Phương thức hiển thị chi tiết sản phẩm (Fill form thông qua nút Chi tiết)**
    private void showChiTiet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id")); // Lấy ID sản phẩm từ request
        SanPham sanPham = sanPhamRepository.getSanPhamById(id); // Lấy chi tiết sản phẩm từ repository
        List<SanPham> listSanPham = sanPhamRepository.getAllSanPham();
        // Kiểm tra dữ liệu và log thông tin để debug
        System.out.println("SanPham ID: " + id);
        System.out.println("SanPham: " + sanPham);

        // Đặt sản phẩm vào request để fill thông tin lên form
        request.setAttribute("sanPham", sanPham);

        // Hiển thị danh sách Thương hiệu, Màu sắc, và Kích thước
        List<ThuongHieu> listThuongHieu = thuongHieuRepository.getAllThuongHieu();
        List<MauSac> listMauSac = mauSacRepository.getAllMauSac();
        List<KichThuoc> listKichThuoc = kichThuocRepository.getAllKichThuoc();

        // Đặt các danh sách vào request để đảm bảo combobox hoạt động
        request.setAttribute("sanPham", sanPham);
        request.setAttribute("listThuongHieu", listThuongHieu);
        request.setAttribute("listMauSac", listMauSac);
        request.setAttribute("listKichThuoc", listKichThuoc);
        request.setAttribute("listSanPham", listSanPham);
        // Chuyển tiếp về file JSP hiển thị (Form + Bảng)
        request.getRequestDispatcher("/views/views_admin/san-pham/hien-thi.jsp").forward(request, response);
    }

    // **Phương thức thêm sản phẩm mới**
    private void themSanPham(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Tạo mới sản phẩm
        SanPham sanPham = new SanPham();

        // Lấy thông tin từ form
        sanPham.setMaSanPham(request.getParameter("maSanPham"));
        sanPham.setTenSanPham(request.getParameter("tenSanPham"));
        sanPham.setChiTietSanPham(new ChiTietSanPham(
                thuongHieuRepository.getThuongHieuById(Integer.parseInt(request.getParameter("thuongHieu"))),
                mauSacRepository.getMauSacById(Integer.parseInt(request.getParameter("mauSac"))),
                kichThuocRepository.getKichThuocById(Integer.parseInt(request.getParameter("kichThuoc"))),
                Integer.parseInt(request.getParameter("soLuong")),
                Double.parseDouble(request.getParameter("donGia"))
        ));

        // Thêm sản phẩm vào cơ sở dữ liệu
        sanPhamRepository.addSanPham(sanPham);

        // Quay lại trang hiển thị danh sách sản phẩm
        response.sendRedirect("/sanpham/hien-thi");
    }

    private void xoaSanPham(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id")); // Lấy ID sản phẩm từ request
        SanPham sanPham = sanPhamRepository.getSanPhamById(id); // Tìm sản phẩm theo ID trong cơ sở dữ liệu
        if (sanPham != null) { // Kiểm tra nếu sản phẩm tồn tại
            sanPhamRepository.deleteSanPham(sanPham); // Xóa sản phẩm
        }
        response.sendRedirect("/sanpham/hien-thi"); // Quay lại trang hiển thị danh sách sản phẩm
    }
}