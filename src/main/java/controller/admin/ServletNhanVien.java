package controller.admin;

import entity.nhan.vien.NhanVien;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import repository.nhanvien.NhanVienRepository;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50
)
@WebServlet(name = "ServletNhanVien", value = {
        "/admin/nhanvien/hien-thi",
        "/admin/nhanvien/add",
        "/admin/nhanvien/delete",
        "/admin/nhanvien/update",
        "/admin/nhanvien/detail",
})
public class ServletNhanVien extends HttpServlet {
    NhanVienRepository nhanVienRepository = new NhanVienRepository();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.contains("/hien-thi")){
            this.getAll(request,response);
        }
    }

    private void getAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<NhanVien> ls = nhanVienRepository.getAll();
        request.setAttribute("list", ls);
        request.getRequestDispatcher("/views/views_admin/QuanNhanVien/NhanVien.jsp").forward(request,response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.contains("/add")){
            this.add(request,response);
        } else if (uri.contains("/admin/nhanvien/delete")) {
            this.delete(request,response);
        }
    }
    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String ma = request.getParameter("ma");
            NhanVien nv = nhanVienRepository.getOne(Integer.parseInt(ma));

            // Cập nhật trạng thái
            nv.setTrangThai(false); // hoặc false nếu là boolean
            nhanVienRepository.update(nv);
            System.out.println("Giá trị trạng thái sau khi set: " + nv.getTrangThai());
            request.setAttribute("thongBao", "Ngưng hoạt động nhân viên thành công!");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("thongBao", "Lỗi khi cập nhật trạng thái!");
        }

        getAll(request, response);
    }



    private void add(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String tenNhanVien = request.getParameter("tenNhanVien");
        String ngaySinh = request.getParameter("ngaySinh");
        String soDienThoai = request.getParameter("sdt");
        String gioiTinh = request.getParameter("gioiTinh");
        String queQuan = request.getParameter("queQuan");
        String matKhau = request.getParameter("matKhau");
        String trangThai = request.getParameter("trangThai");
        Part filePart = request.getPart("hinhAnh");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String uploadPath = getServletContext().getRealPath("/images");
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
        filePart.write(uploadPath + File.separator + fileName);
        String hinhAnh = fileName;
        Date ngaySinhDate = null;
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            ngaySinhDate = dateFormat.parse(ngaySinh);
        } catch (ParseException e) {
            request.setAttribute("thongBaoLoi", "Ngày sinh không đúng định dạng!");
            getAll(request, response);
            return;
        }
        NhanVien nv = new NhanVien();
        nv.setTenNhanVien(tenNhanVien);
        nv.setNgaySinh(ngaySinhDate);
        nv.setSdt(soDienThoai);
        nv.setGioiTinh(Boolean.parseBoolean(gioiTinh));
        nv.setQueQuan(queQuan);
        nv.setMatKhau(matKhau);
        nv.setTrangThai(Boolean.parseBoolean(trangThai));

        try {
            boolean success = nhanVienRepository.add(nv);
            if (success) {
                request.setAttribute("thongBao", "Thêm thành công");
            } else {
                request.setAttribute("thongBaoLoi", "Không thể thêm nhân viên.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("thongBaoLoi", "Lỗi hệ thống: " + e.getMessage());
        }
        getAll(request, response);
    }
}
