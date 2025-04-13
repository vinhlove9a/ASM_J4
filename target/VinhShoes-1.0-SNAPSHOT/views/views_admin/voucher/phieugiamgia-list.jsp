<%@ include file="../layout/header.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Danh sách phiếu giảm giá</h2>
        <a href="${pageContext.request.contextPath}/phieugiamgia/add" class="btn btn-primary">
            <i class="fas fa-plus"></i> Thêm phiếu giảm giá mới
        </a>
    </div>

    <c:if test="${not empty successMessage}">
        <div class="alert alert-success">${successMessage}</div>
    </c:if>
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger">${errorMessage}</div>
    </c:if>

    <div class="card">
        <div class="card-body">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>Mã PGG</th>
                    <th>Tên phiếu</th>
                    <th>Số lượng</th>
                    <th>Đã dùng</th>
                    <th>Kiểu giảm</th>
                    <th>Mức giảm</th>
                    <th>Hóa đơn tối thiểu</th>
                    <th>Thời gian</th>
                    <th>Trạng thái</th>
                    <th>Thao tác</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="pgg" items="${danhSachPhieuGiamGia}">
                    <tr>
                        <td>${pgg.maPhieuGiamGia}</td>
                        <td>${pgg.tenPhieuGiamGia}</td>
                        <td>${pgg.soLuong}</td>
                        <td>${pgg.daDung}</td>
                        <td>${pgg.kieuGiam}</td>
                        <td>
                            <c:choose>
                                <c:when test="${pgg.kieuGiam eq 'VND'}">
                                    <fmt:formatNumber value="${pgg.mucGiam}" type="currency" currencySymbol="₫"/>
                                </c:when>
                                <c:otherwise>
                                    ${pgg.mucGiam}%
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td><fmt:formatNumber value="${pgg.hoaDonToiThieu}" type="currency" currencySymbol="₫"/></td>
                        <td>
                            <fmt:formatDate value="${pgg.ngayBatDau}" pattern="dd/MM/yyyy"/> -
                            <fmt:formatDate value="${pgg.ngayKetThuc}" pattern="dd/MM/yyyy"/>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${pgg.trangThai}">
                                    <span class="badge bg-success">Hoạt động</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge bg-danger">Đã khóa</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/phieugiamgia/edit?id=${pgg.id}"
                               class="btn btn-sm btn-warning">
                                <i class="fas fa-edit"></i>
                            </a>
                            <a href="${pageContext.request.contextPath}/phieugiamgia/detail?id=${pgg.id}"
                               class="btn btn-sm btn-info">
                                <i class="fas fa-info-circle"></i>
                            </a>
                            <button class="btn btn-sm btn-danger"
                                    onclick="confirmDelete(${pgg.id}, '${pgg.maPhieuGiamGia}')">
                                <i class="fas fa-trash"></i>
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script>
    function confirmDelete(id, maPhieuGiamGia) {
        if (confirm("Bạn có chắc chắn muốn xóa phiếu giảm giá " + maPhieuGiamGia + "?")) {
            window.location.href = "${pageContext.request.contextPath}/phieugiamgia/delete?id=" + id;
        }
    }
</script>
<%@ include file="../layout/footer.jsp" %>