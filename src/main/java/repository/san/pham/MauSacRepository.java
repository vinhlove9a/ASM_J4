package repository.san.pham;

import entity.san.pham.MauSac;
import jakarta.persistence.NoResultException;
import org.hibernate.Session;
import utility.HibernateUtil;

import java.util.List;

public class MauSacRepository {
    private Session session;

    public MauSacRepository() {
        session = HibernateUtil.getFACTORY().openSession();
    }

    // Lấy tất cả các màu sắc
    public List<MauSac> getAllMauSac() {
        return session.createQuery("FROM MauSac", MauSac.class).list();
    }

    // Lấy một màu sắc theo ID
    public MauSac getMauSacById(Integer id) {
        try {
            return session.find(MauSac.class, id);
        } catch (NoResultException e) {
            return null;
        }
    }

    // Thêm màu sắc mới
    public void addMauSac(MauSac mauSac) {
        try {
            session.getTransaction().begin();
            session.persist(mauSac);
            session.getTransaction().commit();
        } catch (Exception e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        }
    }

    // Xóa màu sắc
    public void deleteMauSac(MauSac mauSac) {
        try {
            session.getTransaction().begin();
            session.remove(mauSac);
            session.getTransaction().commit();
        } catch (Exception e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        }
    }
}
