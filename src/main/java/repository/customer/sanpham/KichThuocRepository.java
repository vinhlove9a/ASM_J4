package repository.customer.sanpham;

import entity.san.pham.KichThuoc;
import org.hibernate.Session;
import org.hibernate.query.Query;
import utility.HibernateUtil;

import java.util.List;

public class KichThuocRepository {
    public Session session;

    public KichThuocRepository() {
        session = HibernateUtil.getFACTORY().openSession();
    }

    public List<KichThuoc> getAllKichThuoc() {
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            String hql = "FROM KichThuoc WHERE trangThai = true";
            Query<KichThuoc> query = session.createQuery(hql, KichThuoc.class);
            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public KichThuoc getOne(Integer id) {
        return session.find(KichThuoc.class, id);
    }

    public void add(KichThuoc kichThuoc) {
        try {
            session.getTransaction().begin();
            session.save(kichThuoc);
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        }
    }

    public void update(KichThuoc kichThuoc) {
        try {
            session.getTransaction().begin();
            session.saveOrUpdate(kichThuoc);
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        }
    }
}