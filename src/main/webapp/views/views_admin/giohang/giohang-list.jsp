<%@ include file="../layout/header.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Danh sách giỏ hàng</h2>
        <a href="${pageContext.request.contextPath}/giohang/add" class="btn btn-primary">
            <i class="fas fa-plus"></i> Thêm giỏ hàng mới
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
                    <th>Mã giỏ hàng</th>
                    <th>Ngày tạo</th>
                    <th>Khách hàng</th>
                    <th>Trạng thái</th>
                    <th>Thao tác</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="gh" items="${danhSachGioHang}">
                    <tr>
                        <td>${gh.maGioHang}</td>
                        <td>${gh.ngayTao}</td>
                        <td>${gh.khachHang.tenKhachHang}</td>
                        <td>
                            <span class="badge ${gh.trangThai ? 'bg-success' : 'bg-danger'}">
                                    ${gh.trangThai ? 'Hoạt động' : 'Ngừng hoạt động'}
                            </span>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/giohang/edit?id=${gh.id}" class="btn btn-sm btn-warning">
                                <i class="fas fa-edit"></i>
                            </a>
                            <button class="btn btn-sm btn-danger" onclick="confirmDelete(${gh.id}, '${gh.maGioHang}')">
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
    function confirmDelete(id, maGioHang) {
        if (confirm("Bạn có chắc chắn muốn xóa giỏ hàng " + maGioHang + "?")) {
            window.location.href = "${pageContext.request.contextPath}/giohang/delete?id=" + id;
        }
    }
</script>
<%@ include file="../layout/footer.jsp" %>