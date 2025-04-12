package entity.gio.hang;

import entity.khach.hang.KhachHang;
import jakarta.persistence.*;
import lombok.*;

import java.util.Date;
import java.util.List;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "GioHang")
public class GioHang {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Auto-increment ID
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "IDKhachHang", referencedColumnName = "id") // Link to customer
    private KhachHang khachHang;

    @Column(name = "MaGioHang", unique = true, nullable = false) // Unique cart code
    private String maGioHang;

    @Column(name = "NgayTao")
    @Temporal(TemporalType.TIMESTAMP) // Tracks date and time of cart creation
    private Date ngayTao;

    @Column(name = "TrangThai", nullable = false) // Active or inactive cart
    private Boolean trangThai;

    @OneToMany(mappedBy = "gioHang", cascade = CascadeType.ALL)
    private List<GioHangChiTiet> gioHangChiTietList;

    // Method to display the object for debugging or logging
    @Override
    public String toString() {
        return "GioHang{" +
                "id=" + id +
                ", khachHang=" + khachHang +
                ", maGioHang='" + maGioHang + '\'' +
                ", ngayTao=" + ngayTao +
                ", trangThai=" + trangThai +
                '}';
    }
}