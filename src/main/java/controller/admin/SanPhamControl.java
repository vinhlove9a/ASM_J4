package controller.admin;

import entity.san.pham.SanPham;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import repository.san.pham.SanPhamRepository;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50
)
@WebServlet(name = "SanPhamControl", urlPatterns = {
        "/admin/sanpham/hien-thi",
        "/admin/sanpham/add",
        "/admin/sanpham/delete",
        "/admin/sanpham/detail"
})
public class SanPhamControl extends HttpServlet {
    private final SanPhamRepository sanPhamRepository;

    public SanPhamControl() {
        this.sanPhamRepository = new SanPhamRepository();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.contains("/hien-thi")) {
            this.getSanPham(request, response);
        } else if (uri.contains("/detail")) {
            this.detail(request, response);
        }
    }

    private void detail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String id = request.getParameter("id");
            SanPham sanPham = sanPhamRepository.getOne(Integer.parseInt(id));
            if (sanPham != null) {
                request.setAttribute("sanPham", sanPham);
            } else {
                request.setAttribute("error", "Sản phẩm không tồn tại!");
            }
            this.getSanPham(request, response);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            request.setAttribute("error", "ID sản phẩm không hợp lệ!");
            this.getSanPham(request, response);
        }
    }

    private void getSanPham(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<SanPham> danhSachSanPham = sanPhamRepository.getAllSanPham();
            request.setAttribute("list", danhSachSanPham);
            request.getRequestDispatcher("/views/views_admin/sanpham/sanpham.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Đã xảy ra lỗi khi tải danh sách sản phẩm!");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.contains("/add")) {
            this.add(request, response);
        } else if (uri.contains("/update")) {
            this.update(request, response);
        }
    }

    private void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String tenSanPham = request.getParameter("tenSanPham");
            Part filePart = request.getPart("hinhAnh");

            if (tenSanPham == null || tenSanPham.trim().isEmpty()) {
                request.setAttribute("error", "Tên sản phẩm không được để trống!");
                this.getSanPham(request, response);
                return;
            }

            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String uploadPath = getServletContext().getRealPath("/images");
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }
            filePart.write(uploadPath + File.separator + fileName);
            String hinhAnh = "/images/" + fileName;

            SanPham sanPham = new SanPham();
            sanPham.setTenSanPham(tenSanPham);
            sanPham.setHinhAnh(hinhAnh);

            sanPhamRepository.add(sanPham);
            response.sendRedirect(request.getContextPath() + "/admin/sanpham/hien-thi");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Đã xảy ra lỗi khi thêm sản phẩm!");
        }
    }

    private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Logic cập nhật sản phẩm sẽ được thêm ở đây
            response.sendRedirect(request.getContextPath() + "/admin/sanpham/hien-thi");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Đã xảy ra lỗi khi cập nhật sản phẩm!");
        }
    }
}