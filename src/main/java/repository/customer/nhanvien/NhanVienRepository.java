package repository.customer.nhanvien;

import entity.nhan.vien.NhanVien;
import org.hibernate.Session;
import utility.HibernateUtil;

import java.util.List;

public class NhanVienRepository {
    public Session session;

    public NhanVienRepository() {
        session = HibernateUtil.getFACTORY().openSession();
    }

    public List<NhanVien> getAll() {
        return session.createQuery("from NhanVien ").list();
    }

    public NhanVien getOne(Integer id) {
        return session.find(NhanVien.class, id);
    }

    public boolean add(NhanVien nhanVien) {
        try {
            session.getTransaction().begin();
            session.save(nhanVien);
            session.getTransaction().commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        }
        return false;
    }

    public void update(NhanVien nhanVien) {
        try {
            session.getTransaction().begin();
            session.saveOrUpdate(nhanVien);
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        }
    }

    public void delete(NhanVien nhanVien) {
        try {
            session.getTransaction().begin();
            session.delete(nhanVien);
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        }
    }
}
