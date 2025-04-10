package entity.san.pham;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "SanPham")
public class SanPham {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "MaSanPham", unique = true, nullable = false)
    private String maSanPham;

    @Column(name = "TenSanPham", nullable = false)
    private String tenSanPham;

    @Column(name = "HinhAnh")
    private String hinhAnh;

    @ManyToOne
    @JoinColumn(name = "IDChiTietSanPham", referencedColumnName = "id")
    private ChiTietSanPham chiTietSanPham;
}
