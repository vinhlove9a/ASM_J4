package repository.san.pham;

import entity.san.pham.KichThuoc;
import jakarta.persistence.NoResultException;
import org.hibernate.Session;
import utility.HibernateUtil;

import java.util.List;

public class KichThuocRepository {
    private Session session;

    public KichThuocRepository() {
        session = HibernateUtil.getFACTORY().openSession();
    }

    // Lấy tất cả các kích thước
    public List<KichThuoc> getAllKichThuoc() {
        return session.createQuery("FROM KichThuoc", KichThuoc.class).list();
    }

    // Lấy một kích thước theo ID
    public KichThuoc getKichThuocById(Integer id) {
        try {
            return session.find(KichThuoc.class, id);
        } catch (NoResultException e) {
            return null;
        }
    }

    // Thêm kích thước mới
    public void addKichThuoc(KichThuoc kichThuoc) {
        try {
            session.getTransaction().begin();
            session.persist(kichThuoc);
            session.getTransaction().commit();
        } catch (Exception e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        }
    }

    // Xóa kích thước
    public void deleteKichThuoc(KichThuoc kichThuoc) {
        try {
            session.getTransaction().begin();
            session.remove(kichThuoc);
            session.getTransaction().commit();
        } catch (Exception e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        }
    }
}
