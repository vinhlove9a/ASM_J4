package controller.admin;

import entity.khach.hang.KhachHang;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import repository.khachhang.KhachHangRepository;

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
@WebServlet(name = "ServletKhachHang", value = {
        "/admin/khachhang/hien-thi",
        "/admin/khachhang/add",
        "/admin/khachhang/update",
        "/admin/khachhang/delete",
})
public class ServletKhachHang extends HttpServlet {
    private KhachHangRepository khachHangRepository = new KhachHangRepository();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.contains("/hien-thi")){
            this.getAll(request,response);
        }
    }
    private void getAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<KhachHang> ls = khachHangRepository.getAll();
        request.setAttribute("listt",ls);
        request.getRequestDispatcher("/views/views_admin/QuanLyKhachHang/KhachHang.jsp").forward(request,response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String uri = request.getRequestURI();
        if (uri.contains("/add")){
            add(request,response);
        }
    }
    private void add(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String tenNhanVien = request.getParameter("tenKhachHang");
        String ngaySinh = request.getParameter("ngaySinh");
        String soDienThoai = request.getParameter("sdt");
        String gioiTinh = request.getParameter("gioiTinh");
        String queQuan = request.getParameter("diaChi");
        String matKhau = request.getParameter("matKhau");
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
        KhachHang nv = new KhachHang();
        nv.setTenKhachHang(tenNhanVien);
        nv.setNgaySinh(ngaySinhDate);
        nv.setSdt(soDienThoai);
        nv.setGioiTinh(Boolean.parseBoolean(gioiTinh));
        nv.setDiaChi(queQuan);
        nv.setMatKhau(matKhau);


        try {
            boolean success = khachHangRepository.add(nv);
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
