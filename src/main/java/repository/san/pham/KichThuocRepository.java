package repository.san.pham;

import entity.san.pham.KichThuoc;
import org.hibernate.Session;
import org.hibernate.query.Query;
import utility.HibernateUtil;

import java.util.List;

public class KichThuocRepository {
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
}