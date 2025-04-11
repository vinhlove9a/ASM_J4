package controller.customer;

import entity.san.pham.KichThuoc;
import entity.san.pham.MauSac;
import entity.san.pham.SanPham;
import entity.san.pham.ThuongHieu;
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
        int soSanPhamMoiTrang = 12;
        int trangHienTai = 1;
        String page = request.getParameter("page");
        if (page != null) {
            trangHienTai = Integer.parseInt(page);
        }

        SanPhamRepository sanPhamRepository = new SanPhamRepository();
        int tongSoSanPham = sanPhamRepository.getTongSoSanPham();
        int tongSoTrang = (int) Math.ceil((double) tongSoSanPham / soSanPhamMoiTrang);
        List<SanPham> danhSachSanPham = sanPhamRepository.getSanPhamTheoTrang(trangHienTai, soSanPhamMoiTrang);
        request.setAttribute("danhSachSanPham", danhSachSanPham);
        List<ThuongHieu> danhSachThuongHieu = thuongHieuRepository.getAllThuongHieu();
        request.setAttribute("danhSachThuongHieu", danhSachThuongHieu);
        List<KichThuoc> danhSachKichThuoc = kichThuocRepository.getAllKichThuoc();
        request.setAttribute("danhSachKichThuoc", danhSachKichThuoc);
        List<MauSac> danhSachMauSac = mauSacRepository.getAllMauSac();
        request.setAttribute("danhSachMauSac", danhSachMauSac);
        request.setAttribute("tongSoTrang", tongSoTrang);
        request.setAttribute("trangHienTai", trangHienTai);

        request.getRequestDispatcher("/views/views_customer/shop.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}