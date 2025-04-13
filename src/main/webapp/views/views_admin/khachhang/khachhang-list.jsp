<%@ include file="../layout/header.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Danh sách khách hàng</h2>
        <a href="${pageContext.request.contextPath}/khachhang/add" class="btn btn-primary">
            <i class="fas fa-plus"></i> Thêm khách hàng mới
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
                    <th>Mã KH</th>
                    <th>Tên khách hàng</th>
                    <th>Địa chỉ</th>
                    <th>Số điện thoại</th>
                    <th>Giới tính</th>
                    <th>Ngày sinh</th>
                    <th>Thao tác</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="kh" items="${danhSachKhachHang}">
                    <tr>
                        <td>${kh.maKhachHang}</td>
                        <td>${kh.tenKhachHang}</td>
                        <td>${kh.diaChi}</td>
                        <td>${kh.sdt}</td>
                        <td>${kh.gioiTinh ? 'Nam' : 'Nữ'}</td>
                        <td>${kh.ngaySinh}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/khachhang/edit?id=${kh.id}" class="btn btn-sm btn-warning">
                                <i class="fas fa-edit"></i>
                            </a>
                            <button class="btn btn-sm btn-danger" onclick="confirmDelete(${kh.id}, '${kh.maKhachHang}')">
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
    function confirmDelete(id, maKhachHang) {
        if (confirm("Bạn có chắc chắn muốn xóa khách hàng " + maKhachHang + "?")) {
            window.location.href = "${pageContext.request.contextPath}/khachhang/delete?id=" + id;
        }
    }
</script>
<%@ include file="../layout/footer.jsp" %>