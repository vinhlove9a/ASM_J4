package repository.san.pham;

import entity.san.pham.MauSac;
import org.hibernate.Session;
import org.hibernate.query.Query;
import utility.HibernateUtil;

import java.util.List;

public class MauSacRepository {
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
}