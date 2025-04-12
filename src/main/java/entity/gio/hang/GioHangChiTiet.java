package entity.gio.hang;

import entity.san.pham.SanPham;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "GioHangChiTiet")
public class GioHangChiTiet {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Auto-increment ID
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "IDGioHang", referencedColumnName = "id", nullable = false) // Link to GioHang
    private GioHang gioHang;

    @ManyToOne
    @JoinColumn(name = "IDSanPham", referencedColumnName = "id", nullable = false) // Link to SanPham
    private SanPham sanPham;

    @Column(name = "SoLuong", nullable = false) // Product quantity in cart
    private Integer soLuong;

    @Column(name = "DonGia", nullable = false) // Unit price
    private Double donGia;

    @Column(name = "TrangThai", nullable = false) // Active or inactive item in cart
    private Boolean trangThai;

    // Method to display the object for debugging or logging
    @Override
    public String toString() {
        return "GioHangChiTiet{" +
                "id=" + id +
                ", gioHang=" + gioHang +
                ", sanPham=" + sanPham +
                ", soLuong=" + soLuong +
                ", donGia=" + donGia +
                ", trangThai=" + trangThai +
                '}';
    }
}