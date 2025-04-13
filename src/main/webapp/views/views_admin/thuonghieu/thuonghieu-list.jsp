<%@ include file="../layout/header.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Danh sách thương hiệu</h2>
        <a href="${pageContext.request.contextPath}/thuonghieu/add" class="btn btn-primary">
            <i class="fas fa-plus"></i> Thêm thương hiệu mới
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
                    <th>STT</th>
                    <th>Mã thương hiệu</th>
                    <th>Tên thương hiệu</th>
                    <th>Trạng thái</th>
                    <th>Thao tác</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="th" items="${danhSachThuongHieu}" varStatus="status">
                    <tr>
                        <td>${status.index + 1}</td>
                        <td>${th.maTH}</td>
                        <td>${th.tenTH}</td>
                        <td>
                                <span class="badge ${th.trangThai ? 'bg-success' : 'bg-danger'}">
                                        ${th.trangThai ? 'Hoạt động' : 'Ngừng hoạt động'}
                                </span>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/thuonghieu/edit?id=${th.id}" class="btn btn-sm btn-warning">
                                <i class="fas fa-edit"></i>
                            </a>
                            <button class="btn btn-sm btn-danger" onclick="confirmDelete(${th.id}, '${th.maTH}')">
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
    function confirmDelete(id, maTH) {
        if (confirm("Bạn có chắc chắn muốn xóa thương hiệu " + maTH + "?")) {
            window.location.href = "${pageContext.request.contextPath}/thuonghieu/delete?id=" + id;
        }
    }
</script>
<%@ include file="../layout/footer.jsp" %>