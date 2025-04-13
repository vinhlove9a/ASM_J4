package repository.admin.sanpham;

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

    // Lấy danh sách tất cả sản phẩm
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

    // Phương thức lấy sản phẩm theo ID
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
            query.setFirstResult((trang - 1) * soSanPhamMoiTrang); // Điểm bắt đầu của trang
            query.setMaxResults(soSanPhamMoiTrang); // Số sản phẩm mỗi trang
            return query.list();
        }
    }
    public SanPham getOne(Integer id) {
        Transaction transaction = null;
        SanPham sanPham = null;
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            transaction = session.beginTransaction();
            sanPham = session.get(SanPham.class, id); // Lấy sản phẩm theo ID
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return sanPham;
    }
    public void add(SanPham sanPham) {
        // Mở một session mới
        Session session = HibernateUtil.getFACTORY().openSession();
        Transaction transaction = session.beginTransaction();  // Bắt đầu giao dịch.

        try {
            session.save(sanPham);  // Thêm sản phẩm vào cơ sở dữ liệu.
            transaction.commit();  // Commit giao dịch sau khi thêm thành công.
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();  // Rollback giao dịch nếu có lỗi.
            }
            throw e;  // Ném lại lỗi để xử lý ngoài phương thức này.
        } finally {
            session.close();  // Đảm bảo đóng session sau khi sử dụng.
        }
    }


    public void update(SanPham sanPham) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            transaction = session.beginTransaction();
            session.update(sanPham); // Cập nhật thông tin sản phẩm
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }
    public void delete(int id) {
        Session session = HibernateUtil.getFACTORY().openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();

            // Xóa các bản ghi liên quan trong GioHangChiTiet
            Query<?> q1 = session.createQuery("DELETE FROM GioHangChiTiet ghct WHERE ghct.sanPham.id = :id");
            q1.setParameter("id", id);
            q1.executeUpdate();

            // Xóa sản phẩm khỏi bảng SanPham
            Query<?> q2 = session.createQuery("DELETE FROM SanPham WHERE id = :id");
            q2.setParameter("id", id);
            q2.executeUpdate();

            // Commit transaction
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback(); // Rollback nếu có lỗi
            e.printStackTrace();
        } finally {
            session.close(); // Đảm bảo đóng session
        }
    }



    public List<SanPham> searchByName(String keyword) {
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            String hql = "FROM SanPham WHERE tenSanPham LIKE :keyword";
            Query<SanPham> query = session.createQuery(hql, SanPham.class);
            query.setParameter("keyword", "%" + keyword + "%"); // Thêm từ khóa tìm kiếm
            return query.list();
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