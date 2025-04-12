package controller.customer;

import entity.san.pham.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import repository.san.pham.KichThuocRepository;
import repository.san.pham.MauSacRepository;
import repository.san.pham.SanPhamRepository;
import repository.san.pham.ThuongHieuRepository;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "CuaHangControl", value = {"/CuaHangControl", "/cua-hang/hien-thi"})
public class CuaHangControl extends HttpServlet {
    private final SanPhamRepository sanPhamRepository;
    private final ThuongHieuRepository thuongHieuRepository;
    private final KichThuocRepository kichThuocRepository;
    private final MauSacRepository mauSacRepository;

    public CuaHangControl() {
        sanPhamRepository = new SanPhamRepository();
        thuongHieuRepository = new ThuongHieuRepository();
        kichThuocRepository = new KichThuocRepository();
        mauSacRepository = new MauSacRepository();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.contains("/cua-hang/hien-thi")) {
            hienThiCuaHang(request, response);
        }
    }

    private void hienThiCuaHang(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int soSanPhamMoiTrang = 12; // Số sản phẩm mỗi trang
        int trangHienTai = 1; // Trang hiện tại
        String page = request.getParameter("page");
        if (page != null) {
            try {
                trangHienTai = Integer.parseInt(page);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        // Lấy tổng số sản phẩm từ cơ sở dữ liệu
        int tongSoSanPham = sanPhamRepository.getTongSoSanPham();

        // Tính toán tổng số trang
        int tongSoTrang = (int) Math.ceil((double) tongSoSanPham / soSanPhamMoiTrang);

        // Lấy danh sách sản phẩm dựa trên trang hiện tại
        List<SanPham> danhSachSanPham = sanPhamRepository.getSanPhamTheoTrang(trangHienTai, soSanPhamMoiTrang);

        // Đảm bảo danh sách sản phẩm được làm mới từ cơ sở dữ liệu
        for (SanPham sanPham : danhSachSanPham) {
            ChiTietSanPham chiTietSanPham = sanPham.getChiTietSanPham();
            System.out.println("Tên sản phẩm: " + sanPham.getTenSanPham());
            System.out.println("Số lượng tồn kho: " + chiTietSanPham.getSoLuong());
        }

        // Truyền danh sách sản phẩm vào request
        request.setAttribute("danhSachSanPham", danhSachSanPham);

        // Lấy danh sách thương hiệu, kích thước, màu sắc để hiển thị bộ lọc
        List<ThuongHieu> danhSachThuongHieu = thuongHieuRepository.getAllThuongHieu();
        request.setAttribute("danhSachThuongHieu", danhSachThuongHieu);

        List<KichThuoc> danhSachKichThuoc = kichThuocRepository.getAllKichThuoc();
        request.setAttribute("danhSachKichThuoc", danhSachKichThuoc);

        List<MauSac> danhSachMauSac = mauSacRepository.getAllMauSac();
        request.setAttribute("danhSachMauSac", danhSachMauSac);

        // Truyền số trang hiện tại và tổng số trang vào request
        request.setAttribute("tongSoTrang", tongSoTrang);
        request.setAttribute("trangHienTai", trangHienTai);

        // Điều hướng đến giao diện cửa hàng
        request.getRequestDispatcher("/views/views_customer/shop.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}