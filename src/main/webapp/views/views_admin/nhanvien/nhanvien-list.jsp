<%@ include file="../layout/header.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Danh sách nhân viên</h2>
        <a href="${pageContext.request.contextPath}/nhanvien/add" class="btn btn-primary">
            <i class="fas fa-plus"></i> Thêm nhân viên mới
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
                    <th>Mã NV</th>
                    <th>Tên nhân viên</th>
                    <th>Ngày sinh</th>
                    <th>SĐT</th>
                    <th>Giới tính</th>
                    <th>Quê quán</th>
                    <th>Chức vụ</th>
                    <th>Trạng thái</th>
                    <th>Thao tác</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="nv" items="${danhSachNhanVien}">
                    <tr>
                        <td>${nv.maNhanVien}</td>
                        <td>${nv.tenNhanVien}</td>
                        <td>${nv.ngaySinh}</td>
                        <td>${nv.sdt}</td>
                        <td>${nv.gioiTinh ? 'Nam' : 'Nữ'}</td>
                        <td>${nv.queQuan}</td>
                        <td>${nv.chucVu.tenChucVu}</td>
                        <td>
                                <span class="badge ${nv.trangThai ? 'bg-success' : 'bg-danger'}">
                                        ${nv.trangThai ? 'Đang làm việc' : 'Nghỉ việc'}
                                </span>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/nhanvien/edit?id=${nv.id}" class="btn btn-sm btn-warning">
                                <i class="fas fa-edit"></i>
                            </a>
                            <a href="${pageContext.request.contextPath}/nhanvien/detail?id=${nv.id}" class="btn btn-sm btn-info">
                                <i class="fas fa-info-circle"></i>
                            </a>
                            <button class="btn btn-sm btn-danger" onclick="confirmDelete(${nv.id}, '${nv.maNhanVien}')">
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
    function confirmDelete(id, maNhanVien) {
        if (confirm("Bạn có chắc chắn muốn xóa nhân viên " + maNhanVien + "?")) {
            window.location.href = "${pageContext.request.contextPath}/nhanvien/delete?id=" + id;
        }
    }
</script>
<%@ include file="../layout/footer.jsp" %>