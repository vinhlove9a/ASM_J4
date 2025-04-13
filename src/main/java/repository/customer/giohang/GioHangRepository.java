package repository.customer.giohang;

import entity.gio.hang.GioHang;
import org.hibernate.Session;
import org.hibernate.Transaction;
import utility.HibernateUtil;

import java.util.List;

public class GioHangRepository {
    private Session session;

    public GioHangRepository() {
        session = HibernateUtil.getFACTORY().openSession();
    }

    // Lấy tất cả giỏ hàng
    public List<GioHang> layTatCaGioHang() {
        Transaction giaoTac = null;
        List<GioHang> gioHangs = null;
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            giaoTac = session.beginTransaction();
            gioHangs = session.createQuery("FROM GioHang", GioHang.class).getResultList();
            giaoTac.commit();
        } catch (Exception e) {
            if (giaoTac != null) {
                giaoTac.rollback();
            }
            e.printStackTrace();
        }
        return gioHangs;
    }

    // Lấy giỏ hàng hoạt động theo khách hàng
    public GioHang timGioHangHoatDongTheoKhachHang(int idKhachHang) {
        Transaction giaoTac = null;
        GioHang gioHang = null;

        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            giaoTac = session.beginTransaction();

            gioHang = session.createQuery("FROM GioHang WHERE idKhachHang = :idKhachHang AND trangThai = true", GioHang.class)
                    .setParameter("idKhachHang", idKhachHang)
                    .uniqueResult();

            giaoTac.commit();
        } catch (Exception e) {
            if (giaoTac != null) {
                giaoTac.rollback();
            }
            e.printStackTrace();
        }
        return gioHang;
    }

    // Thêm mới giỏ hàng
    public void themMoiGioHang(GioHang gioHang) {
        Transaction giaoTac = null;
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            giaoTac = session.beginTransaction();
            session.save(gioHang);
            giaoTac.commit();
        } catch (Exception e) {
            if (giaoTac != null) {
                giaoTac.rollback();
            }
            e.printStackTrace();
        }
    }

    // Cập nhật trạng thái giỏ hàng
    public void capNhatTrangThaiGioHang(GioHang gioHang) {
        Transaction giaoTac = null;
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            giaoTac = session.beginTransaction();
            session.update(gioHang);
            giaoTac.commit();
        } catch (Exception e) {
            if (giaoTac != null) {
                giaoTac.rollback();
            }
            e.printStackTrace();
        }
    }
}