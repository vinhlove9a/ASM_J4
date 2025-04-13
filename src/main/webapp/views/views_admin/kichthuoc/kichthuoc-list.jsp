<%@ include file="../layout/header.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Danh sách kích thước</h2>
        <a href="${pageContext.request.contextPath}/kichthuoc/add" class="btn btn-primary">
            <i class="fas fa-plus"></i> Thêm kích thước mới
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
                    <th>Mã kích thước</th>
                    <th>Tên kích thước</th>
                    <th>Trạng thái</th>
                    <th>Thao tác</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="kt" items="${danhSachKichThuoc}">
                    <tr>
                        <td>${kt.maKT}</td>
                        <td>${kt.tenKT}</td>
                        <td>
                            <span class="badge ${kt.trangThai ? 'bg-success' : 'bg-danger'}">
                                    ${kt.trangThai ? 'Hoạt động' : 'Ngừng hoạt động'}
                            </span>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/kichthuoc/edit?id=${kt.id}" class="btn btn-sm btn-warning">
                                <i class="fas fa-edit"></i>
                            </a>
                            <button class="btn btn-sm btn-danger" onclick="confirmDelete(${kt.id}, '${kt.maKT}')">
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
    function confirmDelete(id, maKT) {
        if (confirm("Bạn có chắc chắn muốn xóa kích thước " + maKT + "?")) {
            window.location.href = "${pageContext.request.contextPath}/kichthuoc/delete?id=" + id;
        }
    }
</script>
<%@ include file="../layout/footer.jsp" %>