package repository.san.pham;

import entity.san.pham.SanPham;
import org.hibernate.Session;
import org.hibernate.exception.ConstraintViolationException;
import utility.HibernateUtil;

import java.util.List;

public class SanPhamRepository {
    private Session session;

    public SanPhamRepository() {
        session = HibernateUtil.getFACTORY().openSession();
    }

    /**
     * Lấy tất cả sản phẩm bao gồm các thuộc tính liên quan
     *
     * @return Danh sách sản phẩm
     */
    public List<SanPham> getAllSanPham() {
        return session.createQuery(
                "SELECT sp FROM SanPham sp " +
                        "JOIN FETCH sp.chiTietSanPham ctp " +
                        "JOIN FETCH ctp.thuongHieu th " +
                        "JOIN FETCH ctp.mauSac ms " +
                        "JOIN FETCH ctp.kichThuoc kt",
                SanPham.class
        ).list();
    }

    /**
     * Lấy một sản phẩm theo id, bao gồm các thuộc tính liên quan
     *
     * @param id ID sản phẩm
     * @return Thông tin sản phẩm
     */
    public SanPham getSanPhamById(Integer id) {
        return session.createQuery(
                "SELECT sp FROM SanPham sp " +
                        "JOIN FETCH sp.chiTietSanPham ctp " +
                        "JOIN FETCH ctp.thuongHieu th " +
                        "JOIN FETCH ctp.mauSac ms " +
                        "JOIN FETCH ctp.kichThuoc kt " +
                        "WHERE sp.id = :id",
                SanPham.class
        ).setParameter("id", id).uniqueResult();
    }

    /**
     * Thêm mới một sản phẩm
     *
     * @param sanPham Thông tin sản phẩm
     */
    public void addSanPham(SanPham sanPham) {
        try {
            session.getTransaction().begin();

            if (sanPham.getChiTietSanPham().getThuongHieu() == null) {
                throw new IllegalArgumentException("Thương hiệu không hợp lệ!");
            }
            if (sanPham.getChiTietSanPham().getMauSac() == null) {
                throw new IllegalArgumentException("Màu sắc không hợp lệ!");
            }
            if (sanPham.getChiTietSanPham().getKichThuoc() == null) {
                throw new IllegalArgumentException("Kích thước không hợp lệ!");
            }

            session.persist(sanPham);
            session.getTransaction().commit();
        } catch (ConstraintViolationException e) {
            session.getTransaction().rollback();
            throw new RuntimeException("Không thể thêm sản phẩm: Vi phạm ràng buộc!");
        } catch (Exception e) {
            session.getTransaction().rollback();
            throw new RuntimeException("Lỗi khác xảy ra: " + e.getMessage());
        }
    }

    /**
     * Xóa một sản phẩm
     *
     * @param sanPham Thông tin sản phẩm
     */
    public void deleteSanPham(SanPham sanPham) {
        try {
            if (sanPham == null) {
                System.out.println("SanPham không tồn tại, không thể xóa!");
                return;
            }
            session.getTransaction().begin();
            session.remove(sanPham); // Xóa sản phẩm
            session.getTransaction().commit();
        } catch (Exception e) {
            session.getTransaction().rollback(); // Rollback nếu xảy ra lỗi
            e.printStackTrace();
        }
    }

    /**
     * Cập nhật thông tin sản phẩm
     *
     * @param sanPham Thông tin sản phẩm đã thay đổi
     */
    public void updateSanPham(SanPham sanPham) {
        try {
            session.getTransaction().begin();
            session.merge(sanPham);
            session.getTransaction().commit();
        } catch (Exception e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        }
    }
}
