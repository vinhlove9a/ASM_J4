package repository.san.pham;

import entity.san.pham.MauSac;
import org.hibernate.Session;
import org.hibernate.query.Query;
import utility.HibernateUtil;

import java.util.List;

public class MauSacRepository {
    public Session session;

    public MauSacRepository() {
        session = HibernateUtil.getFACTORY().openSession();
    }

    public List<MauSac> getAllMauSac() {
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            String hql = "FROM MauSac WHERE trangThai = true";
            Query<MauSac> query = session.createQuery(hql, MauSac.class);
            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public MauSac getOne(Integer id) {
        return session.find(MauSac.class, id);
    }

    public void add(MauSac mauSac) {
        try {
            session.getTransaction().begin();
            session.save(mauSac);
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        }
    }

    public void update(MauSac mauSac) {
        try {
            session.getTransaction().begin();
            session.saveOrUpdate(mauSac);
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        }
    }


}