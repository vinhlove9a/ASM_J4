package entity.chuc.vu;

import entity.nhan.vien.NhanVien;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "ChucVu")
public class ChucVu {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "MaChucVu", unique = true, nullable = false)
    private String maChucVu;

    @Column(name = "TenChucVu", nullable = false)
    private String tenChucVu;

    @OneToMany(mappedBy = "chucVu", cascade = CascadeType.ALL)
    private java.util.List<NhanVien> nhanViens;
}
