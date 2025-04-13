package repository.san.pham;

import entity.san.pham.ChiTietSanPham;
import org.hibernate.Session;
import org.hibernate.Transaction;
import utility.HibernateUtil;

import java.util.List;

public class ChiTietSanPhamRepository {
    public Session session;

    public ChiTietSanPhamRepository() {
        session = HibernateUtil.getFACTORY().openSession();
    }

    public List<ChiTietSanPham> getAllChiTietSanPham() {
        return session.createQuery("from ChiTietSanPham ").list();
    }

    public ChiTietSanPham getOne(Integer id) {
        return session.find(ChiTietSanPham.class, id);
    }

    public void add(ChiTietSanPham chiTietSanPham) {
        try {
            session.getTransaction().begin();
            session.save(chiTietSanPham);
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        }
    }

    public void update(ChiTietSanPham chiTietSanPham) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            transaction = session.beginTransaction();

            // Đảm bảo chỉ một luồng cập nhật tại một thời điểm
            session.update(chiTietSanPham);

            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
    }

    // Thêm phương thức tìm kiếm ChiTietSanPham theo ID
    public ChiTietSanPham findById(int id) {
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            return session.get(ChiTietSanPham.class, id); // Trả về kết quả hoặc null nếu không tìm thấy
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}