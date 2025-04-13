package repository.san.pham;

import entity.san.pham.ThuongHieu;
import org.hibernate.Session;
import org.hibernate.query.Query;
import utility.HibernateUtil;

import java.util.List;

public class ThuongHieuRepository {
    public Session session;

    public ThuongHieuRepository() {
        session = HibernateUtil.getFACTORY().openSession();
    }

    public List<ThuongHieu> getAllThuongHieu() {
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            String hql = "FROM ThuongHieu WHERE trangThai = true";
            Query<ThuongHieu> query = session.createQuery(hql, ThuongHieu.class);
            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ThuongHieu getOne(Integer id) {
        return session.find(ThuongHieu.class, id);
    }

    public void add(ThuongHieu thuongHieu) {
        try {
            session.getTransaction().begin();
            session.save(thuongHieu);
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        }
    }

    public void update(ThuongHieu thuongHieu) {
        try {
            session.getTransaction().begin();
            session.saveOrUpdate(thuongHieu);
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        }
    }
}