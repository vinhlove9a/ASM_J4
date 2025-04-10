package entity.san.pham;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "ChiTietSanPham")
public class ChiTietSanPham {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "IDThuongHieu", referencedColumnName = "id")
    private ThuongHieu thuongHieu;

    @ManyToOne
    @JoinColumn(name = "IDMauSac", referencedColumnName = "id")
    private MauSac mauSac;

    @ManyToOne
    @JoinColumn(name = "IDKichThuoc", referencedColumnName = "id")
    private KichThuoc kichThuoc;

    @Column(name = "SoLuong", nullable = false)
    private Integer soLuong;

    @Column(name = "DonGia", nullable = false)
    private Double donGia;

    @Column(name = "TrangThai", nullable = false)
    private Boolean trangThai;

    public ChiTietSanPham(ThuongHieu thuongHieu, MauSac mauSac, KichThuoc kichThuoc, int soLuong, double donGia) {
        this.thuongHieu = thuongHieu;
        this.mauSac = mauSac;
        this.kichThuoc = kichThuoc;
        this.soLuong = soLuong;
        this.donGia = donGia;
    }
}
