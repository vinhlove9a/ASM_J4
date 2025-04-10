package repository.san.pham;

import entity.san.pham.ThuongHieu;
import jakarta.persistence.NoResultException;
import org.hibernate.Session;
import utility.HibernateUtil;

import java.util.List;

public class ThuongHieuRepository {
    private Session session;

    public ThuongHieuRepository() {
        session = HibernateUtil.getFACTORY().openSession();
    }

    // Lấy tất cả các thương hiệu
    public List<ThuongHieu> getAllThuongHieu() {
        return session.createQuery("FROM ThuongHieu", ThuongHieu.class).list();
    }

    // Lấy một thương hiệu theo ID
    public ThuongHieu getThuongHieuById(Integer id) {
        try {
            return session.find(ThuongHieu.class, id);
        } catch (NoResultException e) {
            return null;
        }
    }

    // Thêm thương hiệu mới
    public void addThuongHieu(ThuongHieu thuongHieu) {
        try {
            session.getTransaction().begin();
            session.persist(thuongHieu);
            session.getTransaction().commit();
        } catch (Exception e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        }
    }

    // Xóa thương hiệu
    public void deleteThuongHieu(ThuongHieu thuongHieu) {
        try {
            session.getTransaction().begin();
            session.remove(thuongHieu);
            session.getTransaction().commit();
        } catch (Exception e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        }
    }
}
