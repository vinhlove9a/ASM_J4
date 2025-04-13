package repository.customer.khachhang;

import entity.khach.hang.KhachHang;
import org.hibernate.Session;
import org.hibernate.Transaction;
import utility.HibernateUtil;

import java.util.Date;
import java.util.List;

public class KhachHangRepository {
    public Session session;

    public KhachHangRepository() {
        session = HibernateUtil.getFACTORY().openSession();
    }

    public List<KhachHang> getAll() {
        return session.createQuery("from KhachHang ").list();
    }

    public KhachHang getOne(Integer id) {
        return session.find(KhachHang.class, id);
    }

    public boolean add(KhachHang khachHang) {
        try {
            session.getTransaction().begin();
            session.save(khachHang);
            session.getTransaction().commit();
            return true;
        } catch (Exception e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        }
        return false;
    }

    // Phương thức đăng ký khách hàng (có sẵn)
    public static boolean dangKyKhachHang(String tenKhachHang, String soDienThoai, String diaChi,
                                          String matKhau, int gioiTinh, Date ngaySinh) {
        Transaction giaoDich = null;

        try (Session phien = HibernateUtil.getFACTORY().openSession()) {

            // Kiểm tra số điện thoại đã tồn tại chưa
            String cauLenhHQL = "FROM KhachHang WHERE SDT = :soDienThoai";
            KhachHang khachHangTonTai = phien.createQuery(cauLenhHQL, KhachHang.class)
                    .setParameter("soDienThoai", soDienThoai)
                    .uniqueResult();

            if (khachHangTonTai != null) {
                return false; // Đã tồn tại số điện thoại
            }

            // Bắt đầu giao dịch thêm mới khách hàng
            giaoDich = phien.beginTransaction();

            KhachHang khachHangMoi = new KhachHang();
            khachHangMoi.setMaKhachHang("KH_" + System.currentTimeMillis()); // Tạo mã khách hàng
            khachHangMoi.setTenKhachHang(tenKhachHang);
            khachHangMoi.setSdt(soDienThoai);
            khachHangMoi.setDiaChi(diaChi);
            khachHangMoi.setMatKhau(matKhau);
            khachHangMoi.setGioiTinh(gioiTinh == 1); // true = Nữ, false = Nam
            khachHangMoi.setNgaySinh(ngaySinh);

            phien.save(khachHangMoi);
            giaoDich.commit();

            return true;

        } catch (Exception loi) {
            if (giaoDich != null) giaoDich.rollback();
            loi.printStackTrace();
            return false;
        }
    }

    // Phương thức đăng nhập khách hàng (có sẵn)
    public static KhachHang dangNhapKhachHang(String tenDangNhap, String matKhau) {
        try (Session phien = HibernateUtil.getFACTORY().openSession()) {
            String cauLenhHQL = "FROM KhachHang WHERE (maKhachHang = :tenDangNhap OR sdt = :tenDangNhap) AND matKhau = :matKhau";
            return phien.createQuery(cauLenhHQL, KhachHang.class)
                    .setParameter("tenDangNhap", tenDangNhap)
                    .setParameter("matKhau", matKhau)
                    .uniqueResult();
        } catch (Exception loi) {
            loi.printStackTrace();
            return null;
        }
    }

    // Phương thức tìm khách hàng theo ID
    public KhachHang findKhachHangById(int id) {
        try (Session phien = HibernateUtil.getFACTORY().openSession()) {
            return phien.get(KhachHang.class, id);
        } catch (Exception loi) {
            loi.printStackTrace();
            return null;
        }
    }

    // Phương thức tìm khách hàng theo số điện thoại
    public KhachHang findKhachHangBySdt(String sdt) {
        try (Session phien = HibernateUtil.getFACTORY().openSession()) {
            String cauLenhHQL = "FROM KhachHang WHERE sdt = :sdt";
            return phien.createQuery(cauLenhHQL, KhachHang.class)
                    .setParameter("sdt", sdt)
                    .uniqueResult();
        } catch (Exception loi) {
            loi.printStackTrace();
            return null;
        }
    }

    // Phương thức cập nhật thông tin khách hàng
    public boolean updateKhachHang(int id, String tenKhachHang, String diaChi, String sdt, int gioiTinh, Date ngaySinh) {
        Transaction giaoDich = null;
        try (Session phien = HibernateUtil.getFACTORY().openSession()) {
            KhachHang khachHang = phien.get(KhachHang.class, id);
            if (khachHang == null) {
                return false; // Khách hàng không tồn tại
            }

            giaoDich = phien.beginTransaction();
            khachHang.setTenKhachHang(tenKhachHang);
            khachHang.setDiaChi(diaChi);
            khachHang.setSdt(sdt);
            khachHang.setGioiTinh(gioiTinh == 1);
            khachHang.setNgaySinh(ngaySinh);

            phien.update(khachHang);
            giaoDich.commit();

            return true;

        } catch (Exception loi) {
            if (giaoDich != null) giaoDich.rollback();
            loi.printStackTrace();
            return false;
        }
    }

    // Phương thức xóa khách hàng theo ID
    public boolean deleteKhachHang(int id) {
        Transaction giaoDich = null;
        try (Session phien = HibernateUtil.getFACTORY().openSession()) {
            KhachHang khachHang = phien.get(KhachHang.class, id);
            if (khachHang == null) {
                return false; // Khách hàng không tồn tại
            }

            giaoDich = phien.beginTransaction();
            phien.delete(khachHang);
            giaoDich.commit();

            return true;

        } catch (Exception loi) {
            if (giaoDich != null) giaoDich.rollback();
            loi.printStackTrace();
            return false;
        }
    }

    public void save(KhachHang khachHang) {
        Transaction giaoDich = null;
        Session phien = null;

        try {
            phien = HibernateUtil.getFACTORY().openSession();
            giaoDich = phien.beginTransaction();
            phien.saveOrUpdate(khachHang);
            giaoDich.commit(); // Commit giao dịch nếu thành công
        } catch (Exception loi) {
            if (giaoDich != null && giaoDich.isActive()) {
                giaoDich.rollback(); // Rollback nếu xảy ra lỗi
            }
            loi.printStackTrace();
        } finally {
            if (phien != null && phien.isOpen()) {
                phien.close(); // Đóng Session để giải phóng tài nguyên
            }
        }
    }

    // Phương thức lấy tất cả khách hàng
    public List<KhachHang> getAllKhachHang() {
        try (Session phien = HibernateUtil.getFACTORY().openSession()) {
            return phien.createQuery("FROM KhachHang", KhachHang.class).getResultList();
        } catch (Exception loi) {
            loi.printStackTrace();
            return null;
        }
    }

    public static boolean isPhoneExist(String phone) {
        boolean exists = false;
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            String hql = "SELECT COUNT(*) FROM KhachHang WHERE sdt = :phone";
            Long count = session.createQuery(hql, Long.class)
                    .setParameter("phone", phone)
                    .uniqueResult();
            exists = count != null && count > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return exists;
    }
}