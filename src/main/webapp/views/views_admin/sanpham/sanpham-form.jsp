<%@ include file="../layout/header.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="container mt-4">
    <div class="card">
        <div class="card-header bg-primary text-white">
            <h3>${sanPham.id != null ? 'Cập nhật sản phẩm' : 'Thêm sản phẩm mới'}</h3>
        </div>
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/admin/sanpham/save" method="post" enctype="multipart/form-data">
                <input type="hidden" name="id" value="${sanPham.id}" />
                <input type="hidden" name="idChiTietSanPham" value="${sanPham.chiTietSanPham.id}" />

                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="maSanPham" class="form-label">Mã sản phẩm</label>
                        <input type="text" class="form-control" id="maSanPham" name="maSanPham"
                               value="${sanPham.maSanPham}" ${sanPham.id != null ? 'readonly' : ''} placeholder="Mã sẽ được tạo tự động">
                    </div>
                    <div class="col-md-6">
                        <label for="tenSanPham" class="form-label">Tên sản phẩm <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" id="tenSanPham" name="tenSanPham"
                               value="${sanPham.tenSanPham}" required>
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-4">
                        <label for="idThuongHieu" class="form-label">Thương hiệu <span class="text-danger">*</span></label>
                        <select class="form-select" id="idThuongHieu" name="idThuongHieu" required>
                            <option value="">-- Chọn thương hiệu --</option>
                            <c:forEach var="th" items="${danhSachThuongHieu}">
                                <option value="${th.id}" ${sanPham.chiTietSanPham.thuongHieu.id == th.id ? 'selected' : ''}>
                                        ${th.tenThuongHieu}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <label for="idMauSac" class="form-label">Màu sắc <span class="text-danger">*</span></label>
                        <select class="form-select" id="idMauSac" name="idMauSac" required>
                            <option value="">-- Chọn màu sắc --</option>
                            <c:forEach var="ms" items="${danhSachMauSac}">
                                <option value="${ms.id}" ${sanPham.chiTietSanPham.mauSac.id == ms.id ? 'selected' : ''}>
                                        ${ms.tenMauSac}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <label for="idKichThuoc" class="form-label">Kích thước <span class="text-danger">*</span></label>
                        <select class="form-select" id="idKichThuoc" name="idKichThuoc" required>
                            <option value="">-- Chọn kích thước --</option>
                            <c:forEach var="kt" items="${danhSachKichThuoc}">
                                <option value="${kt.id}" ${sanPham.chiTietSanPham.kichThuoc.id == kt.id ? 'selected' : ''}>
                                        ${kt.tenKichThuoc}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="soLuong" class="form-label">Số lượng <span class="text-danger">*</span></label>
                        <input type="number" class="form-control" id="soLuong" name="soLuong"
                               value="${sanPham.chiTietSanPham.soLuong}" min="0" required>
                    </div>
                    <div class="col-md-6">
                        <label for="donGia" class="form-label">Đơn giá <span class="text-danger">*</span></label>
                        <input type="number" class="form-control" id="donGia" name="donGia"
                               value="${sanPham.chiTietSanPham.donGia}" min="1000" step="1000" required>
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="hinhAnh" class="form-label">Hình ảnh</label>
                        <input type="file" class="form-control" id="hinhAnh" name="hinhAnh">
                        <c:if test="${not empty sanPham.hinhAnh}">
                            <div class="mt-2">
                                <img src="${pageContext.request.contextPath}/uploads/${sanPham.hinhAnh}"
                                     width="100" height="100" alt="${sanPham.tenSanPham}">
                                <input type="hidden" name="hinhAnhCu" value="${sanPham.hinhAnh}">
                            </div>
                        </c:if>
                    </div>
                    <div class="col-md-6">
                        <label for="trangThai" class="form-label">Trạng thái</label>
                        <div class="form-check form-switch">
                            <input class="form-check-input" type="checkbox" id="trangThai" name="trangThai"
                                   value="true" ${sanPham.chiTietSanPham.trangThai ? 'checked' : ''}>
                            <label class="form-check-label" for="trangThai">
                                ${sanPham.chiTietSanPham.trangThai ? 'Còn hàng' : 'Hết hàng'}
                            </label>
                        </div>
                    </div>
                </div>

                <div class="text-center mt-3">
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-save me-2"></i>Lưu
                    </button>
                    <a href="${pageContext.request.contextPath}/admin/sanpham" class="btn btn-secondary ms-2">
                        <i class="fas fa-arrow-left me-2"></i>Quay lại
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>
<%@ include file="../layout/footer.jsp" %>
