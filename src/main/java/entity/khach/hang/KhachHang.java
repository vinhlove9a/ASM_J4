package entity.khach.hang;

import entity.hoa.don.HoaDon;
import jakarta.persistence.*;
import lombok.*;

import java.util.Date;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "KhachHang")
public class KhachHang {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "MaKhachHang", unique = true, nullable = false)
    private String maKhachHang;

    @Column(name = "TenKhachHang", nullable = false)
    private String tenKhachHang;

    @Column(name = "DiaChi")
    private String diaChi;

    @Column(name = "SDT", unique = true, nullable = false)
    private String sdt;

    @Column(name = "MatKhau")
    private String matKhau;

    @Column(name = "GioiTinh", nullable = false)
    private Boolean gioiTinh;

    @Column(name = "NgaySinh")
    @Temporal(TemporalType.DATE)
    private Date ngaySinh;

    @OneToMany(mappedBy = "khachHang", cascade = CascadeType.ALL)
    private java.util.List<HoaDon> hoaDons;
}
