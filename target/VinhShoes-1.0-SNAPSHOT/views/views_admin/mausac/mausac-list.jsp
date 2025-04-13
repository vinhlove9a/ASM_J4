<%@ include file="../layout/header.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Danh sách màu sắc</h2>
        <a href="${pageContext.request.contextPath}/mausac/add" class="btn btn-primary">
            <i class="fas fa-plus"></i> Thêm màu sắc mới
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
                    <th>Mã màu sắc</th>
                    <th>Tên màu sắc</th>
                    <th>Trạng thái</th>
                    <th>Thao tác</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="ms" items="${danhSachMauSac}">
                    <tr>
                        <td>${ms.maMS}</td>
                        <td>${ms.tenMS}</td>
                        <td>
                            <span class="badge ${ms.trangThai ? 'bg-success' : 'bg-danger'}">
                                    ${ms.trangThai ? 'Hoạt động' : 'Ngừng hoạt động'}
                            </span>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/mausac/edit?id=${ms.id}" class="btn btn-sm btn-warning">
                                <i class="fas fa-edit"></i>
                            </a>
                            <button class="btn btn-sm btn-danger" onclick="confirmDelete(${ms.id}, '${ms.maMS}')">
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
    function confirmDelete(id, maMS) {
        if (confirm("Bạn có chắc chắn muốn xóa màu sắc " + maMS + "?")) {
            window.location.href = "${pageContext.request.contextPath}/mausac/delete?id=" + id;
        }
    }
</script>
<%@ include file="../layout/footer.jsp" %>