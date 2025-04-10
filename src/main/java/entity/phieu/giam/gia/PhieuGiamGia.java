package entity.phieu.giam.gia;

import entity.hoa.don.HoaDon;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "PhieuGiamGia")
public class PhieuGiamGia {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "MaPhieuGiamGia", unique = true, nullable = false)
    private String maPhieuGiamGia;

    @Column(name = "TenPhieuGiamGia", unique = true, nullable = false)
    private String tenPhieuGiamGia;

    @Column(name = "SoLuong", nullable = false)
    private Integer soLuong;

    @Column(name = "DaDung")
    private Integer daDung;

    @Column(name = "KieuGiam", nullable = false)
    private String kieuGiam;

    @Column(name = "MucGiam", nullable = false)
    private Double mucGiam;

    @Column(name = "HoaDonToiThieu", nullable = false)
    private Double hoaDonToiThieu;

    @Column(name = "NgayBatDau")
    @Temporal(TemporalType.DATE)
    private java.util.Date ngayBatDau;

    @Column(name = "NgayKetThuc")
    @Temporal(TemporalType.DATE)
    private java.util.Date ngayKetThuc;

    @Column(name = "TrangThai", nullable = false)
    private Boolean trangThai;

    @OneToMany(mappedBy = "phieuGiamGia", cascade = CascadeType.ALL)
    private java.util.List<HoaDon> hoaDons;
}
