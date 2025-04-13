<%@ include file="../layout/header.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="container mt-4">
    <div class="card">
        <div class="card-header bg-primary text-white">
            <h3>${gioHang.id != null ? 'Cập nhật giỏ hàng' : 'Thêm giỏ hàng mới'}</h3>
        </div>
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/giohang/save" method="post">
                <input type="hidden" name="id" value="${gioHang.id}" />

                <div class="mb-3">
                    <label for="maGioHang" class="form-label">Mã giỏ hàng</label>
                    <input type="text" class="form-control" id="maGioHang" name="maGioHang"
                           value="${gioHang.maGioHang}" readonly placeholder="Mã sẽ được tạo tự động">
                </div>

                <div class="mb-3">
                    <label for="ngayTao" class="form-label">Ngày tạo</label>
                    <input type="date" class="form-control" id="ngayTao" name="ngayTao"
                           value="${gioHang.ngayTao}" required>
                </div>

                <div class="mb-3">
                    <label for="idKhachHang" class="form-label">Khách hàng <span class="text-danger">*</span></label>
                    <select class="form-select" id="idKhachHang" name="idKhachHang" required>
                        <option value="">-- Chọn khách hàng --</option>
                        <c:forEach var="kh" items="${danhSachKhachHang}">
                            <option value="${kh.id}" ${gioHang.khachHang.id == kh.id ? 'selected' : ''}>
                                    ${kh.tenKhachHang}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="trangThai" class="form-label">Trạng thái</label>
                    <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" id="trangThai" name="trangThai"
                               value="true" ${gioHang.trangThai ? 'checked' : ''}>
                        <label class="form-check-label" for="trangThai">
                            ${gioHang.trangThai ? 'Hoạt động' : 'Ngừng hoạt động'}
                        </label>
                    </div>
                </div>

                <div class="text-center mt-3">
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-save me-2"></i>Lưu
                    </button>
                    <a href="${pageContext.request.contextPath}/giohang" class="btn btn-secondary ms-2">
                        <i class="fas fa-arrow-left me-2"></i>Quay lại
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>
<%@ include file="../layout/footer.jsp" %>