package utility;

import entity.chuc.vu.ChucVu;
import entity.hoa.don.ChiTietHoaDon;
import entity.hoa.don.HoaDon;
import entity.hoa.don.HoaDonLichSu;
import entity.khach.hang.KhachHang;
import entity.nhan.vien.NhanVien;
import entity.phieu.giam.gia.PhieuGiamGia;
import entity.san.pham.*;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import org.hibernate.service.ServiceRegistry;

import java.util.Properties;

public class HibernateUtil {
    private static final SessionFactory FACTORY;

    static {
        Configuration conf = new Configuration();

        Properties properties = new Properties();
        properties.put(Environment.DIALECT, "org.hibernate.dialect.SQLServer2016Dialect");
        properties.put(Environment.DRIVER, "com.microsoft.sqlserver.jdbc.SQLServerDriver");
        properties.put(Environment.URL, "jdbc:sqlserver://localhost:1433;databaseName=ASM_JAVA4_BanGiay;encrypt=true;trustServerCertificate=true;");
        properties.put(Environment.USER, "sa");
        properties.put(Environment.PASS, "123");
        properties.put(Environment.SHOW_SQL, "true");

        conf.setProperties(properties);

        // Đăng ký tất cả các entity
        conf.addAnnotatedClass(SanPham.class);
        conf.addAnnotatedClass(ChiTietSanPham.class);
        conf.addAnnotatedClass(ThuongHieu.class);
        conf.addAnnotatedClass(MauSac.class);
        conf.addAnnotatedClass(KichThuoc.class);
        conf.addAnnotatedClass(KhachHang.class);
        conf.addAnnotatedClass(NhanVien.class);
        conf.addAnnotatedClass(ChucVu.class);
        conf.addAnnotatedClass(HoaDon.class);
        conf.addAnnotatedClass(ChiTietHoaDon.class);
        conf.addAnnotatedClass(PhieuGiamGia.class);
        conf.addAnnotatedClass(HoaDonLichSu.class);

        ServiceRegistry registry = new StandardServiceRegistryBuilder()
                .applySettings(conf.getProperties()).build();
        FACTORY = conf.buildSessionFactory(registry);
    }

    public static SessionFactory getFACTORY() {
        return FACTORY;
    }

    public static void main(String[] args) {
        System.out.println(getFACTORY());
    }
}