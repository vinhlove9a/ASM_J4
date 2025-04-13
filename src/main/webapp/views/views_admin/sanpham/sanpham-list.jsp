<%@ include file="../layout/header.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container mt-4">
    <!-- Tiêu đề trang và nút thêm mới -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Danh sách sản phẩm</h2>
        <a href="${pageContext.request.contextPath}/admin/sanpham?page=${param.page}&action=add" class="btn btn-primary">
            <i class="fas fa-plus"></i> Thêm sản phẩm mới
        </a>
    </div>

    <!-- Form tìm kiếm -->
    <form action="${pageContext.request.contextPath}/admin/sanpham/search" method="get" class="mb-3">
        <div class="input-group">
            <input type="text" name="keyword" class="form-control" placeholder="Tìm kiếm sản phẩm...">
            <button class="btn btn-primary" type="submit">
                <i class="fas fa-search"></i> Tìm kiếm
            </button>
        </div>
    </form>

    <!-- Thông báo (thành công hoặc lỗi) -->
    <c:if test="${not empty successMessage}">
        <div class="alert alert-success">${successMessage}</div>
    </c:if>
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger">${errorMessage}</div>
    </c:if>

    <!-- Khu vực hiển thị Form thêm / Chi tiết sản phẩm -->
    <c:choose>
        <c:when test="${param.action == 'add'}">
            <div class="card mb-4">
                <div class="card-header bg-primary text-white">
                    <h3>Thêm sản phẩm mới</h3>
                </div>
                <div class="card-body">
                    <!-- Form thêm sản phẩm -->
                    <!-- Bạn có thể đặt form thêm sản phẩm vào đây -->
                </div>
            </div>
        </c:when>
        <c:when test="${param.action == 'detail' and not empty sanPhamDetail}">
            <div class="card mb-4">
                <div class="card-header bg-info text-white">
                    <h3>Chi tiết sản phẩm</h3>
                </div>
                <div class="card-body">
                    <!-- Hiển thị chi tiết sản phẩm với tất cả các thuộc tính -->
                    <p><strong>Mã SP:</strong> ${sanPhamDetail.maSanPham}</p>
                    <p><strong>Tên sản phẩm:</strong> ${sanPhamDetail.tenSanPham}</p>
                    <p>
                        <strong>Hình ảnh:</strong>
                        <c:if test="${not empty sanPhamDetail.hinhAnh}">
                            <img src="${pageContext.request.contextPath}/${sanPhamDetail.hinhAnh}" width="100" height="100" alt="${sanPhamDetail.tenSanPham}">
                        </c:if>
                        <c:if test="${empty sanPhamDetail.hinhAnh}">
                            <img src="${pageContext.request.contextPath}/images/no-image.png" width="100" height="100" alt="No Image">
                        </c:if>
                    </p>
                    <p>
                        <strong>Thương hiệu:</strong>
                        <c:if test="${not empty sanPhamDetail.chiTietSanPham.thuongHieu}">
                            ${sanPhamDetail.chiTietSanPham.thuongHieu.tenThuongHieu}
                        </c:if>
                    </p>
                    <p>
                        <strong>Màu sắc:</strong>
                        <c:if test="${not empty sanPhamDetail.chiTietSanPham.mauSac}">
                            ${sanPhamDetail.chiTietSanPham.mauSac.tenMauSac}
                        </c:if>
                    </p>
                    <p>
                        <strong>Kích cỡ:</strong>
                        <c:if test="${not empty sanPhamDetail.chiTietSanPham.kichThuoc}">
                            ${sanPhamDetail.chiTietSanPham.kichThuoc.tenKichThuoc}
                        </c:if>
                    </p>
                    <p><strong>Số lượng:</strong> ${sanPhamDetail.chiTietSanPham.soLuong}</p>
                    <p><strong>Đơn giá:</strong> ${sanPhamDetail.chiTietSanPham.donGia}</p>
                    <p>
                        <strong>Trạng thái:</strong>
                        <c:if test="${sanPhamDetail.chiTietSanPham.trangThai}">
                            Còn hàng
                        </c:if>
                        <c:if test="${not sanPhamDetail.chiTietSanPham.trangThai}">
                            Hết hàng
                        </c:if>
                    </p>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <%-- Không hiển thị khu vực form nếu không có action hợp lệ --%>
        </c:otherwise>
    </c:choose>

    <!-- Danh sách sản phẩm -->
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
                    <th>Kích cỡ</th>
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
                                <img src="${pageContext.request.contextPath}/${sp.hinhAnh}" width="50" height="50" alt="${sp.tenSanPham}">
                            </c:if>
                            <c:if test="${empty sp.hinhAnh}">
                                <img src="${pageContext.request.contextPath}/images/no-image.png" width="50" height="50" alt="No Image">
                            </c:if>
                        </td>
                        <td>${sp.tenSanPham}</td>
                        <td>
                            <c:if test="${not empty sp.chiTietSanPham.thuongHieu}">
                                ${sp.chiTietSanPham.thuongHieu.tenThuongHieu}
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${not empty sp.chiTietSanPham.mauSac}">
                                ${sp.chiTietSanPham.mauSac.tenMauSac}
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${not empty sp.chiTietSanPham.kichThuoc}">
                                ${sp.chiTietSanPham.kichThuoc.tenKichThuoc}
                            </c:if>
                        </td>
                        <td>${sp.chiTietSanPham.soLuong}</td>
                        <td>${sp.chiTietSanPham.donGia}</td>
                        <td>
                                <span class="badge ${sp.chiTietSanPham.trangThai ? 'bg-success' : 'bg-danger'}">
                                        ${sp.chiTietSanPham.trangThai ? 'Còn hàng' : 'Hết hàng'}
                                </span>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/admin/sanpham/edit?id=${sp.id}" class="btn btn-sm btn-warning">
                                <i class="fas fa-edit"></i>
                            </a>
                            <a href="${pageContext.request.contextPath}/admin/sanpham?page=${param.page}&action=detail&id=${sp.id}" class="btn btn-sm btn-info">
                                <i class="fas fa-info-circle"></i>
                            </a>
                            <a href="javascript:void(0);" onclick="confirmDelete('${sp.id}', '${sp.maSanPham}')" class="btn btn-sm btn-danger">
                                <i class="fas fa-trash"></i>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Form ẩn để xóa sản phẩm -->
    <form id="deleteForm" method="post" action="${pageContext.request.contextPath}/admin/sanpham/delete" style="display: none;">
        <input type="hidden" name="id" id="deleteId">
    </form>

    <!-- Phân trang -->
    <div class="d-flex justify-content-center mt-4">
        <nav aria-label="Phân trang">
            <ul class="pagination">
                <c:forEach var="i" begin="1" end="${tongSoTrang}">
                    <li class="page-item ${i == trangHienTai ? 'active' : ''}">
                        <a class="page-link" href="${pageContext.request.contextPath}/admin/sanpham?page=${i}">
                                ${i}
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </nav>
    </div>
</div>

<script>
    function confirmDelete(id, maSanPham) {
        if (confirm("Bạn có chắc chắn muốn xóa sản phẩm " + maSanPham + "?")) {
            document.getElementById("deleteId").value = id;
            document.getElementById("deleteForm").submit();
        }
    }
</script>
<%@ include file="../layout/footer.jsp" %>
