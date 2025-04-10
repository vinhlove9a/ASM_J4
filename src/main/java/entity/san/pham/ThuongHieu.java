package entity.san.pham;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "ThuongHieu")
public class ThuongHieu {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "MaTH", unique = true, nullable = false)
    private String maThuongHieu;

    @Column(name = "TenTH", unique = true, nullable = false)
    private String tenThuongHieu;

    @Column(name = "TrangThai", nullable = false)
    private Boolean trangThai;
}
