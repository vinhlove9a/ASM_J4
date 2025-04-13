<%@ include file="../layout/header.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Danh sách chức vụ</h2>
        <a href="${pageContext.request.contextPath}/chucvu/add" class="btn btn-primary">
            <i class="fas fa-plus"></i> Thêm chức vụ mới
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
                    <th>Mã chức vụ</th>
                    <th>Tên chức vụ</th>
                    <th>Trạng thái</th>
                    <th>Thao tác</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="cv" items="${danhSachChucVu}">
                    <tr>
                        <td>${cv.maChucVu}</td>
                        <td>${cv.tenChucVu}</td>
                        <td>
                            <span class="badge ${cv.trangThai ? 'bg-success' : 'bg-danger'}">
                                    ${cv.trangThai ? 'Hoạt động' : 'Ngừng hoạt động'}
                            </span>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/chucvu/edit?id=${cv.id}" class="btn btn-sm btn-warning">
                                <i class="fas fa-edit"></i>
                            </a>
                            <button class="btn btn-sm btn-danger" onclick="confirmDelete(${cv.id}, '${cv.maChucVu}')">
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
    function confirmDelete(id, maChucVu) {
        if (confirm("Bạn có chắc chắn muốn xóa chức vụ " + maChucVu + "?")) {
            window.location.href = "${pageContext.request.contextPath}/chucvu/delete?id=" + id;
        }
    }
</script>
<%@ include file="../layout/footer.jsp" %>