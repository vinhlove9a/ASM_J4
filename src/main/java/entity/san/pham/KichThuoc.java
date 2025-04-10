package entity.san.pham;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "KichThuoc")
public class KichThuoc {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "MaKT", unique = true, nullable = false)
    private String maKichThuoc;

    @Column(name = "TenKT", unique = true, nullable = false)
    private String tenKichThuoc;

    @Column(name = "TrangThai", nullable = false)
    private Boolean trangThai;
}
