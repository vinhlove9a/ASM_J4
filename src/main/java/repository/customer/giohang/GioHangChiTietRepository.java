package repository.customer.giohang;

import entity.gio.hang.GioHangChiTiet;
import org.hibernate.Session;
import org.hibernate.Transaction;
import utility.HibernateUtil;

import java.util.List;

public class GioHangChiTietRepository {

    // Lấy chi tiết giỏ hàng theo ID giỏ hàng
    public List<GioHangChiTiet> layChiTietGioHangTheoId(int idGioHang) {
        Transaction giaoTac = null;
        List<GioHangChiTiet> chiTietGioHang = null;
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            giaoTac = session.beginTransaction();
            chiTietGioHang = session.createQuery("FROM GioHangChiTiet WHERE gioHang.id = :idGioHang", GioHangChiTiet.class)
                    .setParameter("idGioHang", idGioHang)
                    .getResultList();
            System.out.println("Session open: " + session.isOpen());
            System.out.println("Transaction active: " + giaoTac.isActive());
            giaoTac.commit();
        } catch (Exception e) {
            if (giaoTac != null) {
                giaoTac.rollback();
            }
            e.printStackTrace();
        }
        return chiTietGioHang;
    }

    // Thêm sản phẩm vào giỏ hàng chi tiết
    public void themSanPhamVaoChiTietGioHang(GioHangChiTiet gioHangChiTiet) {
        Transaction giaoTac = null;
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            giaoTac = session.beginTransaction();
            session.save(gioHangChiTiet);
            giaoTac.commit();
        } catch (Exception e) {
            if (giaoTac != null) {
                giaoTac.rollback();
            }
            e.printStackTrace();
        }
    }

    // Cập nhật chi tiết giỏ hàng
    public void capNhatChiTietGioHang(GioHangChiTiet gioHangChiTiet) {
        Transaction giaoTac = null;
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            giaoTac = session.beginTransaction();
            session.update(gioHangChiTiet);
            giaoTac.commit();
        } catch (Exception e) {
            if (giaoTac != null) {
                giaoTac.rollback();
            }
            e.printStackTrace();
        }
    }

    // Xóa sản phẩm khỏi giỏ hàng chi tiết
    public void xoaSanPhamKhoiChiTietGioHang(int idChiTietGioHang) {
        Transaction giaoTac = null;
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            giaoTac = session.beginTransaction();
            GioHangChiTiet gioHangChiTiet = session.get(GioHangChiTiet.class, idChiTietGioHang);
            if (gioHangChiTiet != null) {
                session.delete(gioHangChiTiet);
            }
            giaoTac.commit();
        } catch (Exception e) {
            if (giaoTac != null) {
                giaoTac.rollback();
            }
            e.printStackTrace();
        }
    }
}