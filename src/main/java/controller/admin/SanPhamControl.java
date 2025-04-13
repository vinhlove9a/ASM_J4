package controller.admin;

import entity.san.pham.SanPham;
import repository.admin.sanpham.SanPhamRepository;
import repository.customer.sanpham.ThuongHieuRepository;
import repository.customer.sanpham.MauSacRepository;
import repository.customer.sanpham.KichThuocRepository;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;

@WebServlet(name = "SanPhamControl", urlPatterns = {"/admin/sanpham", "/admin/sanpham/add", "/admin/sanpham/edit", "/admin/sanpham/delete", "/admin/sanpham/save"})
public class SanPhamControl extends HttpServlet {
    private final SanPhamRepository sanPhamRepository;
    private final ThuongHieuRepository thuongHieuRepository;
    private final MauSacRepository mauSacRepository;
    private final KichThuocRepository kichThuocRepository;

    public SanPhamControl() {
        sanPhamRepository = new SanPhamRepository();
        thuongHieuRepository = new ThuongHieuRepository();
        mauSacRepository = new MauSacRepository();
        kichThuocRepository = new KichThuocRepository();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        String action = request.getParameter("action");

        if ("detail".equals(action)) {
            hienThiChiTietSanPham(request, response);
        } else if (uri.contains("/admin/sanpham/add")) {
            hienThiFormThemSanPham(request, response);
        } else if (uri.contains("/admin/sanpham/edit")) {
            hienThiFormCapNhatSanPham(request, response);
        } else {
            hienThiDanhSachSanPham(request, response);
        }
    }

    private void hienThiDanhSachSanPham(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int soSanPhamMoiTrang = 10; // Số sản phẩm mỗi trang
        int trangHienTai = 1;
        String page = request.getParameter("page");

        if (page != null) {
            try {
                trangHienTai = Integer.parseInt(page);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        // Tính tổng số trang và lấy danh sách sản phẩm
        int tongSoSanPham = sanPhamRepository.getTongSoSanPham();
        int tongSoTrang = (int) Math.ceil((double) tongSoSanPham / soSanPhamMoiTrang);
        List<SanPham> danhSachSanPham = sanPhamRepository.getSanPhamTheoTrang(trangHienTai, soSanPhamMoiTrang);

        // Truyền dữ liệu vào JSP
        request.setAttribute("tongSoTrang", tongSoTrang);
        request.setAttribute("trangHienTai", trangHienTai);
        request.setAttribute("danhSachSanPham", danhSachSanPham);

        request.getRequestDispatcher("/views/views_admin/sanpham/sanpham-list.jsp").forward(request, response);
    }

    // Hiển thị chi tiết sản phẩm cùng với danh sách sản phẩm
    private void hienThiChiTietSanPham(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam == null || idParam.trim().isEmpty()) {
            // Nếu id không hợp lệ, bạn có thể chuyển hướng về danh sách sản phẩm hoặc hiển thị thông báo lỗi.
            response.sendRedirect(request.getContextPath() + "/admin/sanpham");
            return;
        }

        int id;
        try {
            id = Integer.parseInt(idParam);
        } catch (NumberFormatException e) {
            // Nếu giá trị không phải số, chuyển hướng về danh sách sản phẩm
            response.sendRedirect(request.getContextPath() + "/admin/sanpham");
            return;
        }

        SanPham sanPham = sanPhamRepository.getOne(id);
        request.setAttribute("sanPhamDetail", sanPham);

        // Tải danh sách sản phẩm với phân trang để hiển thị cùng
        int soSanPhamMoiTrang = 10;
        int trangHienTai = 1;
        String page = request.getParameter("page");
        if (page != null) {
            try {
                trangHienTai = Integer.parseInt(page);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        int tongSoSanPham = sanPhamRepository.getTongSoSanPham();
        int tongSoTrang = (int) Math.ceil((double) tongSoSanPham / soSanPhamMoiTrang);
        List<SanPham> danhSachSanPham = sanPhamRepository.getSanPhamTheoTrang(trangHienTai, soSanPhamMoiTrang);

        request.setAttribute("tongSoTrang", tongSoTrang);
        request.setAttribute("trangHienTai", trangHienTai);
        request.setAttribute("danhSachSanPham", danhSachSanPham);

        request.getRequestDispatcher("/views/views_admin/sanpham/sanpham-list.jsp").forward(request, response);
    }


    private void hienThiFormThemSanPham(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy dữ liệu hỗ trợ cho form (thương hiệu, màu sắc, kích thước)
        List<?> danhSachThuongHieu = thuongHieuRepository.getAllThuongHieu();
        List<?> danhSachMauSac = mauSacRepository.getAllMauSac();
        List<?> danhSachKichThuoc = kichThuocRepository.getAllKichThuoc();

        request.setAttribute("danhSachThuongHieu", danhSachThuongHieu);
        request.setAttribute("danhSachMauSac", danhSachMauSac);
        request.setAttribute("danhSachKichThuoc", danhSachKichThuoc);
        request.getRequestDispatcher("/views/views_admin/sanpham/sanpham-form.jsp").forward(request, response);
    }

    private void hienThiFormCapNhatSanPham(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy ID sản phẩm từ request
        int id = Integer.parseInt(request.getParameter("id"));
        SanPham sanPham = sanPhamRepository.getOne(id);

        // Lấy dữ liệu hỗ trợ cho form (thương hiệu, màu sắc, kích thước)
        List<?> danhSachThuongHieu = thuongHieuRepository.getAllThuongHieu();
        List<?> danhSachMauSac = mauSacRepository.getAllMauSac();
        List<?> danhSachKichThuoc = kichThuocRepository.getAllKichThuoc();

        request.setAttribute("sanPham", sanPham);
        request.setAttribute("danhSachThuongHieu", danhSachThuongHieu);
        request.setAttribute("danhSachMauSac", danhSachMauSac);
        request.setAttribute("danhSachKichThuoc", danhSachKichThuoc);
        request.getRequestDispatcher("/views/views_admin/sanpham/sanpham-form.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();

        if (uri.contains("/admin/sanpham/save")) {
            luuSanPham(request, response);
        } else if (uri.contains("/admin/sanpham/delete")) {
            xoaSanPham(request, response);
        }
    }
    private void luuSanPham(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Integer id = request.getParameter("id") != null && !request.getParameter("id").isEmpty() ? Integer.parseInt(request.getParameter("id")) : null;
        String maSanPham = request.getParameter("maSanPham");
        String tenSanPham = request.getParameter("tenSanPham");
        String hinhAnh = request.getParameter("hinhAnhCu");

        // Xử lý upload ảnh mới nếu có
        Part filePart = request.getPart("hinhAnh");
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String uploadPath = getServletContext().getRealPath("") + "uploads";
            filePart.write(uploadPath + "/" + fileName);
            hinhAnh = "uploads/" + fileName;
        }

        // Lấy dữ liệu liên quan đến chi tiết sản phẩm
        Integer idThuongHieu = (request.getParameter("idThuongHieu") != null && !request.getParameter("idThuongHieu").isEmpty())
                ? Integer.parseInt(request.getParameter("idThuongHieu"))
                : null;
        Integer idMauSac = (request.getParameter("idMauSac") != null && !request.getParameter("idMauSac").isEmpty())
                ? Integer.parseInt(request.getParameter("idMauSac"))
                : null;
        Integer idKichThuoc = (request.getParameter("idKichThuoc") != null && !request.getParameter("idKichThuoc").isEmpty())
                ? Integer.parseInt(request.getParameter("idKichThuoc"))
                : null;

        // Kiểm tra và chuyển đổi số lượng và đơn giá
        Integer soLuong = (request.getParameter("soLuong") != null && !request.getParameter("soLuong").isEmpty())
                ? Integer.parseInt(request.getParameter("soLuong"))
                : 0;  // Giá trị mặc định nếu không có nhập liệu
        Double donGia = (request.getParameter("donGia") != null && !request.getParameter("donGia").isEmpty())
                ? Double.parseDouble(request.getParameter("donGia"))
                : 1000.0;  // Giá trị mặc định nếu không có nhập liệu

        // Kiểm tra trạng thái
        Boolean trangThai = request.getParameter("trangThai") != null;

        if (id != null) {
            // Cập nhật sản phẩm
            SanPham sanPham = sanPhamRepository.getOne(id);
            sanPham.setTenSanPham(tenSanPham);
            sanPham.setHinhAnh(hinhAnh);
            sanPham.getChiTietSanPham().setThuongHieu(thuongHieuRepository.getOne(idThuongHieu));
            sanPham.getChiTietSanPham().setMauSac(mauSacRepository.getOne(idMauSac));
            sanPham.getChiTietSanPham().setKichThuoc(kichThuocRepository.getOne(idKichThuoc));
            sanPham.getChiTietSanPham().setSoLuong(soLuong);
            sanPham.getChiTietSanPham().setDonGia(donGia);
            sanPham.getChiTietSanPham().setTrangThai(trangThai);
            sanPhamRepository.update(sanPham);
        } else {
            // Thêm sản phẩm mới
            SanPham sanPham = new SanPham();
            sanPham.setMaSanPham(maSanPham);
            sanPham.setTenSanPham(tenSanPham);
            sanPham.setHinhAnh(hinhAnh);
            sanPhamRepository.add(sanPham);
        }

        response.sendRedirect(request.getContextPath() + "/admin/sanpham");
    }


    private void xoaSanPham(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        try {
            sanPhamRepository.delete(id);  // Gọi phương thức xóa trong repository
            response.sendRedirect(request.getContextPath() + "/admin/sanpham");  // Chuyển hướng sau khi xóa thành công
        } catch (Exception e) {
            // Xử lý lỗi nếu có, ví dụ: không tìm thấy sản phẩm
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Xóa sản phẩm thất bại.");
        }
    }
}
