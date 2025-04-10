package entity.hoa.don;

import entity.san.pham.SanPham;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "ChiTietHoaDon")
public class ChiTietHoaDon {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "IDSanPham", referencedColumnName = "id", nullable = false)
    private SanPham sanPham;

    @ManyToOne
    @JoinColumn(name = "IDHoaDon", referencedColumnName = "id", nullable = false)
    private HoaDon hoaDon;

    @Column(name = "SoLuong", nullable = false)
    private Integer soLuong;

    @Column(name = "DonGia", nullable = false)
    private Double donGia;

    @Column(name = "TrangThai", nullable = false)
    private Boolean trangThai;
}
