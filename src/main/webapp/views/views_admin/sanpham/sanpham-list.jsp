<%@ include file="../layout/header.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Danh sách sản phẩm</h2>
        <a href="${pageContext.request.contextPath}/sanpham/add" class="btn btn-primary">
            <i class="fas fa-plus"></i> Thêm sản phẩm mới
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
                    <th>Mã SP</th>
                    <th>Hình ảnh</th>
                    <th>Tên sản phẩm</th>
                    <th>Thương hiệu</th>
                    <th>Màu sắc</th>
                    <th>Kích thước</th>
                    <th>Số lượng</th>
                    <th>Đơn giá</th>
                    <th>Trạng thái</th>
                    <th>Thao tác</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="sp" items="${danhSachSanPham}">
                    <tr>
                        <td>${sp.maSanPham}</td>
                        <td>
                            <c:if test="${not empty sp.hinhAnh}">
                                <img src="${pageContext.request.contextPath}/uploads/${sp.hinhAnh}"
                                     width="50" height="50" alt="${sp.tenSanPham}">
                            </c:if>
                            <c:if test="${empty sp.hinhAnh}">
                                <img src="${pageContext.request.contextPath}/images/no-image.png"
                                     width="50" height="50" alt="No Image">
                            </c:if>
                        </td>
                        <td>${sp.tenSanPham}</td>
                        <td>${sp.chiTietSanPham.thuongHieu.tenTH}</td>
                        <td>${sp.chiTietSanPham.mauSac.tenMS}</td>
                        <td>${sp.chiTietSanPham.kichThuoc.tenKT}</td>
                        <td>${sp.chiTietSanPham.soLuong}</td>
                        <td>${sp.chiTietSanPham.donGia}</td>
                        <td>
                                <span class="badge ${sp.chiTietSanPham.trangThai ? 'bg-success' : 'bg-danger'}">
                                        ${sp.chiTietSanPham.trangThai ? 'Còn hàng' : 'Hết hàng'}
                                </span>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/sanpham/edit?id=${sp.id}" class="btn btn-sm btn-warning">
                                <i class="fas fa-edit"></i>
                            </a>
                            <a href="${pageContext.request.contextPath}/sanpham/detail?id=${sp.id}" class="btn btn-sm btn-info">
                                <i class="fas fa-info-circle"></i>
                            </a>
                            <button class="btn btn-sm btn-danger" onclick="confirmDelete(${sp.id}, '${sp.maSanPham}')">
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
    function confirmDelete(id, maSanPham) {
        if (confirm("Bạn có chắc chắn muốn xóa sản phẩm " + maSanPham + "?")) {
            window.location.href = "${pageContext.request.contextPath}/sanpham/delete?id=" + id;
        }
    }
</script>
<%@ include file="../layout/footer.jsp" %>