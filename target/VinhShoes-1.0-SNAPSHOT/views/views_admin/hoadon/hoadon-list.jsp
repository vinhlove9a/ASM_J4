<%@ include file="../layout/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Danh sách hóa đơn</h2>
        <a href="${pageContext.request.contextPath}/hoadon/add" class="btn btn-primary">
            <i class="fas fa-plus"></i> Tạo hóa đơn mới
        </a>
    </div>

    <c:if test="${not empty successMessage}">
        <div class="alert alert-success">${successMessage}</div>
    </c:if>
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger">${errorMessage}</div>
    </c:if>

    <div class="card mb-4">
        <div class="card-header">
            <h5>Tìm kiếm hóa đơn</h5>
        </div>
        <div class="card-body">
            <form method="get" action="${pageContext.request.contextPath}/hoadon">
                <div class="row">
                    <div class="col-md-3 mb-3">
                        <label for="maHoaDon" class="form-label">Mã hóa đơn</label>
                        <input type="text" class="form-control" id="maHoaDon" name="maHoaDon" value="${param.maHoaDon}">
                    </div>
                    <div class="col-md-3 mb-3">
                        <label for="khachHang" class="form-label">Khách hàng</label>
                        <input type="text" class="form-control" id="khachHang" name="khachHang" value="${param.khachHang}">
                    </div>
                    <div class="col-md-3 mb-3">
                        <label for="tungay" class="form-label">Từ ngày</label>
                        <input type="date" class="form-control" id="tungay" name="tungay" value="${param.tungay}">
                    </div>
                    <div class="col-md-3 mb-3">
                        <label for="denngay" class="form-label">Đến ngày</label>
                        <input type="date" class="form-control" id="denngay" name="denngay" value="${param.denngay}">
                    </div>
                    <div class="col-md-3 mb-3">
                        <label for="trangThai" class="form-label">Trạng thái</label>
                        <select class="form-select" id="trangThai" name="trangThai">
                            <option value="">Tất cả</option>
                            <option value="1" ${param.trangThai == '1' ? 'selected' : ''}>Đã thanh toán</option>
                            <option value="0" ${param.trangThai == '0' ? 'selected' : ''}>Chưa thanh toán</option>
                        </select>
                    </div>
                    <div class="col-md-3 align-self-end mb-3">
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-search me-2"></i>Tìm kiếm
                        </button>
                        <a href="${pageContext.request.contextPath}/hoadon" class="btn btn-secondary">
                            <i class="fas fa-sync me-2"></i>Làm mới
                        </a>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <div class="card">
        <div class="card-body">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>Mã HD</th>
                    <th>Khách hàng</th>
                    <th>Nhân viên</th>
                    <th>Ngày tạo</th>
                    <th>Tổng tiền</th>
                    <th>Giảm giá</th>
                    <th>Thanh toán</th>
                    <th>PTTT</th>
                    <th>Trạng thái</th>
                    <th>Thao tác</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="hd" items="${danhSachHoaDon}">
                    <tr>
                        <td>${hd.maHoaDon}</td>
                        <td>${hd.khachHang.tenKhachHang}</td>
                        <td>${hd.nhanVien.tenNhanVien}</td>
                        <td><fmt:formatDate value="${hd.ngayTao}" pattern="dd/MM/yyyy HH:mm"/></td>
                        <td><fmt:formatNumber value="${hd.tongTien}" type="currency" currencySymbol="₫"/></td>
                        <td><fmt:formatNumber value="${hd.giamGia}" type="currency" currencySymbol="₫"/></td>
                        <td><fmt:formatNumber value="${hd.thanhTien}" type="currency" currencySymbol="₫"/></td>
                        <td>${hd.phuongThucThanhToan}</td>
                        <td>
                                <span class="badge ${hd.trangThai ? 'bg-success' : 'bg-warning'}">
                                        ${hd.trangThai ? 'Đã thanh toán' : 'Chưa thanh toán'}
                                </span>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/hoadon/detail?id=${hd.id}" class="btn btn-sm btn-info">
                                <i class="fas fa-info-circle"></i>
                            </a>
                            <c:if test="${!hd.trangThai}">
                                <a href="${pageContext.request.contextPath}/hoadon/edit?id=${hd.id}" class="btn btn-sm btn-warning">
                                    <i class="fas fa-edit"></i>
                                </a>
                                <button class="btn btn-sm btn-danger" onclick="confirmDelete(${hd.id}, '${hd.maHoaDon}')">
                                    <i class="fas fa-trash"></i>
                                </button>
                            </c:if>
                            <a href="${pageContext.request.contextPath}/hoadon/print?id=${hd.id}" class="btn btn-sm btn-secondary" target="_blank">
                                <i class="fas fa-print"></i>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script>
    function confirmDelete(id, maHoaDon) {
        if (confirm("Bạn có chắc chắn muốn xóa hóa đơn " + maHoaDon + "?")) {
            window.location.href = "${pageContext.request.contextPath}/hoadon/delete?id=" + id;
        }
    }
</script>
<%@ include file="../layout/footer.jsp" %>