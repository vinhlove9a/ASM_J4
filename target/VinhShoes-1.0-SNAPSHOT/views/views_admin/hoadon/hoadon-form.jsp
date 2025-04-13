<%@ include file="../layout/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="container-fluid mt-4">
    <div class="card">
        <div class="card-header bg-primary text-white">
            <h3>${hoaDon.id != null ? 'Cập nhật hóa đơn' : 'Tạo hóa đơn mới'}</h3>
        </div>
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/hoadon/save" method="post" id="hoaDonForm">
                <input type="hidden" name="id" value="${hoaDon.id}" />
                <input type="hidden" name="idNhanVien" value="${userLogged.id}" />

                <div class="row">
                    <div class="col-md-8">
                        <!-- Thông tin hóa đơn -->
                        <div class="card mb-4">
                            <div class="card-header bg-light">
                                <h5>Thông tin hóa đơn</h5>
                            </div>
                            <div class="card-body">
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label for="maHoaDon" class="form-label">Mã hóa đơn</label>
                                        <input type="text" class="form-control" id="maHoaDon" name="maHoaDon"
                                               value="${hoaDon.maHoaDon}" readonly placeholder="Mã sẽ được tạo tự động">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="ngayTao" class="form-label">Ngày tạo</label>
                                        <input type="text" class="form-control" id="ngayTao"
                                               value="<fmt:formatDate value='${hoaDon.ngayTao}' pattern='dd/MM/yyyy HH:mm:ss'/>"
                                               readonly>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label for="idKhachHang" class="form-label">Khách hàng <span class="text-danger">*</span></label>
                                        <select class="form-select" id="idKhachHang" name="idKhachHang" required>
                                            <option value="">-- Chọn khách hàng --</option>
                                            <c:forEach var="kh" items="${danhSachKhachHang}">
                                                <option value="${kh.id}" ${hoaDon.khachHang.id == kh.id ? 'selected' : ''}>
                                                        ${kh.maKhachHang} - ${kh.tenKhachHang} - ${kh.sdt}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="idPhieuGiamGia" class="form-label">Phiếu giảm giá</label>
                                        <select class="form-select" id="idPhieuGiamGia" name="idPhieuGiamGia">
                                            <option value="">-- Không áp dụng --</option>
                                            <c:forEach var="pgg" items="${danhSachPhieuGiamGia}">
                                                <option value="${pgg.id}" data-kieugiam="${pgg.kieuGiam}" data-mucgiam="${pgg.mucGiam}"
                                                        data-hoadontoithieu="${pgg.hoaDonToiThieu}" ${hoaDon.phieuGiamGia.id == pgg.id ? 'selected' : ''}>
                                                        ${pgg.maPhieuGiamGia} - ${pgg.tenPhieuGiamGia}
                                                    (${pgg.kieuGiam == 'VND' ? pgg.mucGiam + ' VNĐ' : pgg.mucGiam + '%'})
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label for="phuongThucThanhToan" class="form-label">Phương thức thanh toán <span class="text-danger">*</span></label>
                                        <select class="form-select" id="phuongThucThanhToan" name="phuongThucThanhToan" required>
                                            <option value="">-- Chọn phương thức thanh toán --</option>
                                            <option value="Tiền mặt" ${hoaDon.phuongThucThanhToan == 'Tiền mặt' ? 'selected' : ''}>Tiền mặt</option>
                                            <option value="Chuyển khoản" ${hoaDon.phuongThucThanhToan == 'Chuyển khoản' ? 'selected' : ''}>Chuyển khoản</option>
                                            <option value="Thẻ tín dụng" ${hoaDon.phuongThucThanhToan == 'Thẻ tín dụng' ? 'selected' : ''}>Thẻ tín dụng</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="trangThai" class="form-label">Trạng thái <span class="text-danger">*</span></label>
                                        <select class="form-select" id="trangThai" name="trangThai" required>
                                            <option value="">-- Chọn trạng thái --</option>
                                            <option value="Chờ xác nhận" ${hoaDon.trangThai == 'Chờ xác nhận' ? 'selected' : ''}>Chờ xác nhận</option>
                                            <option value="Đã xác nhận" ${hoaDon.trangThai == 'Đã xác nhận' ? 'selected' : ''}>Đã xác nhận</option>
                                            <option value="Đang giao hàng" ${hoaDon.trangThai == 'Đang giao hàng' ? 'selected' : ''}>Đang giao hàng</option>
                                            <option value="Đã giao hàng" ${hoaDon.trangThai == 'Đã giao hàng' ? 'selected' : ''}>Đã giao hàng</option>
                                            <option value="Đã hủy" ${hoaDon.trangThai == 'Đã hủy' ? 'selected' : ''}>Đã hủy</option>
                                            <option value="Hoàn thành" ${hoaDon.trangThai == 'Hoàn thành' ? 'selected' : ''}>Hoàn thành</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <div class="col-md-12">
                                        <label for="ghiChu" class="form-label">Ghi chú</label>
                                        <textarea class="form-control" id="ghiChu" name="ghiChu" rows="3">${hoaDon.ghiChu}</textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <!-- Tổng kết thanh toán -->
                        <div class="card mb-4">
                            <div class="card-header bg-light">
                                <h5>Tổng kết thanh toán</h5>
                            </div>
                            <div class="card-body">
                                <div class="mb-3">
                                    <label class="form-label">Tổng tiền hàng:</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="tongTienHang" readonly
                                               value="<fmt:formatNumber value='${hoaDon.tongTienHang}' pattern='#,##0' />">
                                        <span class="input-group-text">VNĐ</span>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Giảm giá:</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="giamGia" readonly
                                               value="<fmt:formatNumber value='${hoaDon.giamGia}' pattern='#,##0' />">
                                        <span class="input-group-text">VNĐ</span>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Phí vận chuyển:</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="phiVanChuyen" name="phiVanChuyen"
                                               value="${hoaDon.phiVanChuyen}" onchange="tinhTongTien()">
                                        <span class="input-group-text">VNĐ</span>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Thành tiền:</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="thanhTien" name="thanhTien" readonly
                                               value="<fmt:formatNumber value='${hoaDon.thanhTien}' pattern='#,##0' />">
                                        <span class="input-group-text">VNĐ</span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Nút điều khiển -->
                        <div class="card mb-4">
                            <div class="card-body">
                                <button type="submit" class="btn btn-primary w-100 mb-2">
                                    <i class="bi bi-save"></i> Lưu hóa đơn
                                </button>
                                <a href="${pageContext.request.contextPath}/hoadon/list" class="btn btn-secondary w-100">
                                    <i class="bi bi-arrow-left"></i> Quay lại danh sách
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Chi tiết hóa đơn -->
                <div class="card mt-4">
                    <div class="card-header bg-light d-flex justify-content-between align-items-center">
                        <h5 class="mb-0">Chi tiết sản phẩm</h5>
                        <button type="button" class="btn btn-success btn-sm" data-bs-toggle="modal" data-bs-target="#themSanPhamModal">
                            <i class="bi bi-plus-circle"></i> Thêm sản phẩm
                        </button>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover">
                                <thead class="table-primary">
                                <tr>
                                    <th>STT</th>
                                    <th>Mã SP</th>
                                    <th>Tên sản phẩm</th>
                                    <th>Đơn giá</th>
                                    <th>SL</th>
                                    <th>Thành tiền</th>
                                    <th>Thao tác</th>
                                </tr>
                                </thead>
                                <tbody id="chiTietHoaDonTable">
                                <c:forEach var="cthd" items="${hoaDon.chiTietHoaDonList}" varStatus="status">
                                    <tr>
                                        <td>${status.index + 1}</td>
                                        <td>${cthd.sanPham.maSanPham}</td>
                                        <td>${cthd.sanPham.tenSanPham}</td>
                                        <td class="text-end">
                                            <fmt:formatNumber value="${cthd.donGia}" pattern="#,##0" /> VNĐ
                                        </td>
                                        <td class="text-center">
                                            <input type="hidden" name="chiTietList[${status.index}].id" value="${cthd.id}">
                                            <input type="hidden" name="chiTietList[${status.index}].idSanPham" value="${cthd.sanPham.id}">
                                            <input type="hidden" name="chiTietList[${status.index}].donGia" value="${cthd.donGia}">
                                            <input type="number" class="form-control form-control-sm" style="width: 70px"
                                                   name="chiTietList[${status.index}].soLuong" value="${cthd.soLuong}" min="1"
                                                   onchange="capNhatThanhTien(this)">
                                        </td>
                                        <td class="text-end">
                                            <fmt:formatNumber value="${cthd.donGia * cthd.soLuong}" pattern="#,##0" /> VNĐ
                                        </td>
                                        <td class="text-center">
                                            <button type="button" class="btn btn-danger btn-sm" onclick="xoaSanPham(this)">
                                                <i class="bi bi-trash"></i>
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>

                        <div id="emptyProductsMessage" class="alert alert-warning ${empty hoaDon.chiTietHoaDonList ? '' : 'd-none'}">
                            Chưa có sản phẩm nào trong hóa đơn. Vui lòng thêm sản phẩm.
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal thêm sản phẩm -->
<div class="modal fade" id="themSanPhamModal" tabindex="-1" aria-labelledby="themSanPhamModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="themSanPhamModalLabel">Chọn sản phẩm</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="input-group mb-3">
                    <input type="text" class="form-control" id="searchSanPham" placeholder="Tìm kiếm sản phẩm...">
                    <button class="btn btn-outline-secondary" type="button" id="btnSearchSanPham">
                        <i class="bi bi-search"></i>
                    </button>
                </div>

                <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover">
                        <thead class="table-primary">
                        <tr>
                            <th>Mã SP</th>
                            <th>Tên sản phẩm</th>
                            <th>Giá bán</th>
                            <th>Tồn kho</th>
                            <th>Số lượng</th>
                            <th>Thao tác</th>
                        </tr>
                        </thead>
                        <tbody id="danhSachSanPham">
                        <c:forEach var="sp" items="${danhSachSanPham}">
                            <tr>
                                <td>${sp.maSanPham}</td>
                                <td>${sp.tenSanPham}</td>
                                <td class="text-end">
                                    <fmt:formatNumber value="${sp.giaBan}" pattern="#,##0" /> VNĐ
                                </td>
                                <td class="text-center">${sp.soLuongTon}</td>
                                <td>
                                    <input type="number" class="form-control form-control-sm" value="1" min="1" max="${sp.soLuongTon}">
                                </td>
                                <td class="text-center">
                                    <button type="button" class="btn btn-primary btn-sm"
                                            onclick="themSanPhamVaoHoaDon(${sp.id}, '${sp.maSanPham}', '${sp.tenSanPham}', ${sp.giaBan}, this)">
                                        <i class="bi bi-plus-circle"></i> Thêm
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</div>


<%@ include file="../layout/footer.jsp" %>