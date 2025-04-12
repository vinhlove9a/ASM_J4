package repository.hoadon;

import entity.hoa.don.HoaDon;
import entity.hoa.don.ChiTietHoaDon;
import org.hibernate.Session;
import org.hibernate.Transaction;
import utility.HibernateUtil;

import java.util.List;

public class HoaDonRepository {
    private Session session;

    public HoaDonRepository() {
        session = HibernateUtil.getFACTORY().openSession();
    }

    // Lấy tất cả hóa đơn
    public List<HoaDon> getAllHoaDon() {
        Transaction transaction = null;
        List<HoaDon> hoaDons = null;
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            transaction = session.beginTransaction();
            hoaDons = session.createQuery("FROM HoaDon", HoaDon.class).getResultList(); // Truy vấn danh sách hóa đơn
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
        return hoaDons;
    }

    // Lấy hóa đơn theo ID
    public HoaDon getHoaDonById(int id) {
        HoaDon hoaDon = null;
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            hoaDon = session.get(HoaDon.class, id); // Tìm hóa đơn theo ID
        } catch (Exception e) {
            System.err.println("Lỗi khi lấy hóa đơn theo ID: " + id);
            e.printStackTrace();
        }
        return hoaDon;
    }

    // Lưu hóa đơn mới
    public void luuHoaDon(HoaDon hoaDon) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            transaction = session.beginTransaction();
            session.save(hoaDon); // Lưu hóa đơn mới
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
    }

    // Lưu chi tiết hóa đơn
    public void luuHoaDonChiTiet(ChiTietHoaDon hoaDonChiTiet) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            transaction = session.beginTransaction();
            session.save(hoaDonChiTiet); // Lưu chi tiết hóa đơn
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
    }
    public void luuDanhSachChiTietHoaDon(List<ChiTietHoaDon> danhSachChiTietHoaDon) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            transaction = session.beginTransaction();
            for (ChiTietHoaDon chiTiet : danhSachChiTietHoaDon) {
                session.save(chiTiet);
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            System.err.println("Lỗi khi lưu danh sách chi tiết hóa đơn");
            e.printStackTrace();
        }
    }
    // Xóa hóa đơn theo ID
    public void xoaHoaDon(int id) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            transaction = session.beginTransaction();
            HoaDon hoaDon = session.get(HoaDon.class, id);
            if (hoaDon != null) {
                session.delete(hoaDon); // Xóa hóa đơn theo ID
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
    }
    public HoaDon getHoaDonByKhachHangAndTrangThai(int khachHangId, boolean trangThai) {
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            String hql = "FROM HoaDon WHERE khachHang.id = :khachHangId AND trangThai = :trangThai";
            return session.createQuery(hql, HoaDon.class)
                    .setParameter("khachHangId", khachHangId)
                    .setParameter("trangThai", trangThai)
                    .uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}