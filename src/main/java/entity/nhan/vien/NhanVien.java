package entity.nhan.vien;

import entity.chuc.vu.ChucVu;
import entity.hoa.don.HoaDon;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "NhanVien")
public class NhanVien {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "MaNhanVien", unique = true, nullable = false)
    private String maNhanVien;

    @Column(name = "TenNhanVien", nullable = false)
    private String tenNhanVien;

    @Column(name = "NgaySinh")
    @Temporal(TemporalType.DATE)
    private java.util.Date ngaySinh;

    @Column(name = "SDT", unique = true, nullable = false)
    private String sdt;

    @Column(name = "GioiTinh", nullable = false)
    private Boolean gioiTinh;

    @Column(name = "QueQuan")
    private String queQuan;

    @Column(name = "MatKhau", nullable = false)
    private String matKhau;

    @Column(name = "TrangThai", nullable = false)
    private Boolean trangThai;

    @ManyToOne
    @JoinColumn(name = "IDChucVu", referencedColumnName = "id")
    private ChucVu chucVu;

    @OneToMany(mappedBy = "nhanVien", cascade = CascadeType.ALL)
    private java.util.List<HoaDon> hoaDons;
}
