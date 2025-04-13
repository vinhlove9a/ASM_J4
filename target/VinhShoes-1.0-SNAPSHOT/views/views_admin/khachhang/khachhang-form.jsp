<%@ include file="../layout/header.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="container mt-4">
    <div class="card">
        <div class="card-header bg-primary text-white">
            <h3>${khachHang.id != null ? 'Cập nhật khách hàng' : 'Thêm khách hàng mới'}</h3>
        </div>
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/khachhang/save" method="post">
                <input type="hidden" name="id" value="${khachHang.id}" />

                <div class="mb-3">
                    <label for="maKhachHang" class="form-label">Mã khách hàng</label>
                    <input type="text" class="form-control" id="maKhachHang" name="maKhachHang"
                           value="${khachHang.maKhachHang}" readonly placeholder="Mã sẽ được tạo tự động">
                </div>

                <div class="mb-3">
                    <label for="tenKhachHang" class="form-label">Tên khách hàng <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="tenKhachHang" name="tenKhachHang"
                           value="${khachHang.tenKhachHang}" required>
                </div>

                <div class="mb-3">
                    <label for="diaChi" class="form-label">Địa chỉ</label>
                    <input type="text" class="form-control" id="diaChi" name="diaChi"
                           value="${khachHang.diaChi}">
                </div>

                <div class="mb-3">
                    <label for="sdt" class="form-label">Số điện thoại <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="sdt" name="sdt"
                           value="${khachHang.sdt}" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Giới tính</label>
                    <div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="gioiTinh" id="gioiTinhNam"
                                   value="true" ${khachHang.gioiTinh ? 'checked' : ''}>
                            <label class="form-check-label" for="gioiTinhNam">Nam</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="gioiTinh" id="gioiTinhNu"
                                   value="false" ${!khachHang.gioiTinh ? 'checked' : ''}>
                            <label class="form-check-label" for="gioiTinhNu">Nữ</label>
                        </div>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="ngaySinh" class="form-label">Ngày sinh</label>
                    <input type="date" class="form-control" id="ngaySinh" name="ngaySinh"
                           value="${khachHang.ngaySinh}">
                </div>

                <div class="mb-3">
                    <label for="matKhau" class="form-label">Mật khẩu <span class="text-danger">*</span></label>
                    <input type="password" class="form-control" id="matKhau" name="matKhau" required>
                    <small class="text-muted">${khachHang.id != null ? 'Để trống nếu không muốn thay đổi mật khẩu' : ''}</small>
                </div>

                <div class="text-center mt-3">
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-save me-2"></i>Lưu
                    </button>
                    <a href="${pageContext.request.contextPath}/khachhang" class="btn btn-secondary ms-2">
                        <i class="fas fa-arrow-left me-2"></i>Quay lại
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>
<%@ include file="../layout/footer.jsp" %>