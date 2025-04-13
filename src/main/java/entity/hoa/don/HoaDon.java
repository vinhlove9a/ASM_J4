package entity.hoa.don;

import entity.khach.hang.KhachHang;
import entity.nhan.vien.NhanVien;
import entity.phieu.giam.gia.PhieuGiamGia;
import jakarta.persistence.*;
import lombok.*;

import java.util.Date;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "HoaDon")
public class HoaDon {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "IDNhanVien", referencedColumnName = "id")
    private NhanVien nhanVien;

    @ManyToOne
    @JoinColumn(name = "IDKhachHang", referencedColumnName = "id")
    private KhachHang khachHang;

    @ManyToOne
    @JoinColumn(name = "IDPhieuGiamGia", referencedColumnName = "id")
    private PhieuGiamGia phieuGiamGia;

    @Column(name = "MaHoaDon", insertable = false, updatable = false) // Hibernate không kiểm tra MaHoaDon
    private String maHoaDon;

    @Column(name = "TongTien", nullable = false)
    private Double tongTien;

    @Column(name = "GiamGia", nullable = false)
    private Double giamGia;
    @Column(name = "PhuongThucThanhToan")
    private String phuongThucThanhToan;
    @Column(name = "NgayTao")
    @Temporal(TemporalType.TIMESTAMP)
    private Date ngayTao;

    @Column(name = "ThanhTien", nullable = false)
    private Double thanhTien;

    @Column(name = "TrangThai", nullable = false)
    private Boolean trangThai;

    @OneToMany(mappedBy = "hoaDon", cascade = CascadeType.ALL)
    private java.util.List<ChiTietHoaDon> chiTietHoaDons;

    @OneToMany(mappedBy = "hoaDon", cascade = CascadeType.ALL)
    private java.util.List<HoaDonLichSu> hoaDonLichSus;
}
