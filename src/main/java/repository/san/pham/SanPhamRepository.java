package repository.san.pham;

import entity.san.pham.ChiTietSanPham;
import entity.san.pham.SanPham;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import utility.HibernateUtil;

import java.util.List;

public class SanPhamRepository {
    private Session session;

    public SanPhamRepository() {
        session = HibernateUtil.getFACTORY().openSession();
    }

    public List<SanPham> getAllSanPham() {
        Transaction transaction = null;
        List<SanPham> sanPhams = null;
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            transaction = session.beginTransaction();
            sanPhams = session.createQuery("FROM SanPham", SanPham.class).getResultList();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return sanPhams;
    }

    public int getTongSoSanPham() {
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            String hql = "SELECT COUNT(*) FROM SanPham";
            Query<Long> query = session.createQuery(hql, Long.class);
            return query.uniqueResult().intValue();
        }
    }

    public List<SanPham> getSanPhamTheoTrang(int trang, int soSanPhamMoiTrang) {
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            String hql = "FROM SanPham";
            Query<SanPham> query = session.createQuery(hql, SanPham.class);
            query.setFirstResult((trang - 1) * soSanPhamMoiTrang);
            query.setMaxResults(soSanPhamMoiTrang);
            return query.list();
        }
    }

    public List<SanPham> getSanPhamNgauNhien(int soLuong) {
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            String hql = "FROM SanPham ORDER BY NEWID()";
            Query<SanPham> query = session.createQuery(hql, SanPham.class);
            query.setMaxResults(soLuong);
            return query.list();
        }
    }

    // Phương thức lấy sản phẩm theo ID
    public SanPham laySanPhamTheoId(int idSanPham) {
        Transaction giaoTac = null;
        SanPham sanPham = null;
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            giaoTac = session.beginTransaction();

            // Truy vấn sản phẩm theo ID
            sanPham = session.get(SanPham.class, idSanPham);

            giaoTac.commit();
        } catch (Exception e) {
            if (giaoTac != null) {
                giaoTac.rollback();
            }
            e.printStackTrace();
        }
        return sanPham;
    }
    public void update(ChiTietSanPham chiTietSanPham) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            transaction = session.beginTransaction();
            session.update(chiTietSanPham); // Lưu thông tin cập nhật vào DB
            transaction.commit(); // Hoàn thành giao dịch
        } catch (Exception e) {
            if (transaction != null) transaction.rollback(); // Rollback nếu có lỗi
            e.printStackTrace();
        }
    }
    public static void main(String[] args) {
        SanPhamRepository sanPhamRepository = new SanPhamRepository();
        List<SanPham> danhSachSanPham = sanPhamRepository.getAllSanPham();
        for (SanPham sp : danhSachSanPham) {
            System.out.println("Tên sản phẩm: " + sp.getTenSanPham());
            System.out.println("Mã sản phẩm: " + sp.getMaSanPham());
            System.out.println("Hình ảnh: " + sp.getHinhAnh());
            System.out.println("---------------------");
        }
    }
}