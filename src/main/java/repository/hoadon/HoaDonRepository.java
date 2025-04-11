package repository.hoadon;

import entity.hoa.don.HoaDon;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import utility.HibernateUtil;

import java.util.List;

public class HoaDonRepository {
    private Session session;

    public HoaDonRepository() {
        session = HibernateUtil.getFACTORY().openSession();
    }

    public List<HoaDon> getAllHoaDon() {
        Transaction transaction = null;
        List<HoaDon> hoaDons = null;
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            transaction = session.beginTransaction();
            hoaDons = session.createQuery("FROM SanPham", HoaDon.class).getResultList();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return hoaDons;
    }
}
