package controller.admin;

import entity.san.pham.ChiTietSanPham;
import entity.san.pham.SanPham;
import entity.san.pham.KichThuoc;
import entity.san.pham.MauSac;
import entity.san.pham.ThuongHieu;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import repository.customer.sanpham.ChiTietSanPhamRepository;
import repository.customer.sanpham.SanPhamRepository;
import repository.customer.sanpham.KichThuocRepository;
import repository.customer.sanpham.MauSacRepository;
import repository.customer.sanpham.ThuongHieuRepository;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServletSanPhamChiTiet", value =
        {
                "/admin/sanphamchitiet/hien-thi",
                "/admin/sanphamchitiet/add",
                "/admin/sanphamchitiet/view-update",
                "/admin/sanphamchitiet/update",
                "/admin/sanphamchitiet/delete",
                "/admin/sanphamchitiet/detail",
                "/admin/thuoctinh/thuonghieu/add",
                "/admin/thuoctinh/kichco/add",
                "/admin/thuoctinh/mausac/add",
        }
)
public class ServletSanPhamChiTiet extends HttpServlet {
    private ChiTietSanPhamRepository sanPhamChiTietRepository = new ChiTietSanPhamRepository();
    private SanPhamRepository sanPhamRepository = new SanPhamRepository();
    private KichThuocRepository kichThuocRepository = new KichThuocRepository();
    private MauSacRepository mauSacRepository = new MauSacRepository();
    private ThuongHieuRepository thuongHieuRepository = new ThuongHieuRepository();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if(uri.contains("/hien-thi")){
            this.getAll(request,response);
        }
    }
    private void getAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ChiTietSanPham> ls = sanPhamChiTietRepository.getAllChiTietSanPham();
        List<SanPham> sanPham = sanPhamRepository.getAllSanPham();
        List<KichThuoc> kichThuocs = kichThuocRepository.getAllKichThuoc();
        List<MauSac> mauSacs = mauSacRepository.getAllMauSac();
        List<ThuongHieu> thuongHieu = thuongHieuRepository.getAllThuongHieu();
        request.setAttribute("list", ls);
        request.setAttribute("dsSanPham", sanPham);
        request.setAttribute("dsThuongHieu", thuongHieu);
        request.setAttribute("dsMauSac", mauSacs);
        request.setAttribute("dsKichThuoc", kichThuocs);
        request.getRequestDispatcher("/views/views_admin/QuanLySanPham/SanPhamChiTiet.jsp").forward(request,response);
    }
//     "/admin/sanphamchitiet/hien-thi",
//             "/admin/sanphamchitiet/add",
//             "/admin/sanphamchitiet/view-update",
//             "/admin/sanphamchitiet/update",
//             "/admin/sanphamchitiet/delete",
//             "/admin/sanphamchitiet/detail",
//             "/admin/thuoctinh/thuonghieu/add",
//             "/admin/thuoctinh/kichco/add",
//             "/admin/sanphamchitiet/mausac/add",
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.equals("/admin/sanphamchitiet/add")){
            this.add(request,response);
        } else if (uri.equals("/admin/thuoctinh/thuonghieu/add")) {
            this.addThuongHieu(request,response);
        }else if (uri.equals("/admin/thuoctinh/kichco/add")) {
            this.addKichCo(request,response);
        }else if (uri.equals("/admin/thuoctinh/mausac/add")) {
            this.addMauSac(request,response);
        }else if (uri.equals("/admin/thuoctinh/thuonghieu/add")) {

        }
    }

    private void addMauSac(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String  tenMauSac= request.getParameter("tenMauSac");
        MauSac mauSac = new MauSac();
        mauSac.setTenMauSac(tenMauSac);
        mauSac.setTrangThai(true);
        mauSacRepository.add(mauSac);
        getAll(request,response);
    }

    private void addKichCo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String  tenKichThuoc = request.getParameter("tenKichThuoc");
        KichThuoc mauSac = new KichThuoc();
        mauSac.setTenKichThuoc(tenKichThuoc);
        mauSac.setTrangThai(true);
        kichThuocRepository.add(mauSac);
        getAll(request,response);
    }

    private void addThuongHieu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String  tenThuongHieu = request.getParameter("tenThuongHieu");
        ThuongHieu mauSac = new ThuongHieu();
        mauSac.setTenThuongHieu(tenThuongHieu);
        mauSac.setTrangThai(true);
        thuongHieuRepository.add(mauSac);
        getAll(request,response);
    }

    private void add(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String soLuong = request.getParameter("soLuong");
        String donGia = request.getParameter("donGia");
        String tenSanPham = request.getParameter("sanPham");
        String tenThuongHieu = request.getParameter("thuongHieu");
        String tenKichCo = request.getParameter("kichCo");
        String tenMauSac = request.getParameter("mauSac");
        ThuongHieu thuongHieu = thuongHieuRepository.getOne(Integer.parseInt(tenThuongHieu));
        MauSac mauSac = mauSacRepository.getOne(Integer.parseInt(tenMauSac));
        SanPham sanPham = sanPhamRepository.getOne(Integer.parseInt(tenSanPham));
        KichThuoc kichThuoc = kichThuocRepository.getOne(Integer.parseInt(tenKichCo));
        ChiTietSanPham chiTietSanPham = new ChiTietSanPham();
        chiTietSanPham.setThuongHieu(thuongHieu);
        chiTietSanPham.setMauSac(mauSac);
        chiTietSanPham.setKichThuoc(kichThuoc);
      //  chiTietSanPham.setSanPham(sanPham);
        chiTietSanPham.setSoLuong(Integer.parseInt(soLuong));
        chiTietSanPham.setDonGia(Double.parseDouble(donGia));
        Boolean trangThai =true;
        chiTietSanPham.setTrangThai(trangThai);
        sanPhamChiTietRepository.add(chiTietSanPham);
        response.sendRedirect("/admin/sanphamchitiet/hien-thi");
    }
}
