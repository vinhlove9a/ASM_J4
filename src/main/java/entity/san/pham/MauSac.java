package entity.san.pham;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "MauSac")
public class MauSac {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "MaMS", unique = true, nullable = false)
    private String maMauSac;

    @Column(name = "TenMS", unique = true, nullable = false)
    private String tenMauSac;

    @Column(name = "TrangThai", nullable = false)
    private Boolean trangThai;
}
