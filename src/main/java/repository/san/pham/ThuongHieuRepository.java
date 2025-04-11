package repository.san.pham;

import entity.san.pham.ThuongHieu;
import org.hibernate.Session;
import org.hibernate.query.Query;
import utility.HibernateUtil;

import java.util.List;

public class ThuongHieuRepository {
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
}