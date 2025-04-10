package entity.hoa.don;

import jakarta.persistence.*;
import lombok.*;

import java.util.Date;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "HoaDonLichSu")
public class HoaDonLichSu {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "IDHoaDon", referencedColumnName = "id")
    private HoaDon hoaDon;

    @Column(name = "TrangThai", nullable = false)
    private Boolean trangThai;

    @Column(name = "ThoiGian")
    @Temporal(TemporalType.TIMESTAMP)
    private Date thoiGian;

    @Column(name = "MoTa")
    private String moTa;
}
