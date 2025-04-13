<%@ include file="../layout/header.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="container mt-4">
    <div class="card">
        <div class="card-header bg-primary text-white">
            <h3>${nhanVien.id != null ? 'Cập nhật nhân viên' : 'Thêm nhân viên mới'}</h3>
        </div>
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/nhanvien/save" method="post">
                <input type="hidden" name="id" value="${nhanVien.id}" />

                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="maNhanVien" class="form-label">Mã nhân viên</label>
                        <input type="text" class="form-control" id="maNhanVien" name="maNhanVien"
                               value="${nhanVien.maNhanVien}" ${nhanVien.id != null ? 'readonly' : ''} placeholder="Mã sẽ được tạo tự động">
                    </div>
                    <div class="col-md-6">
                        <label for="tenNhanVien" class="form-label">Tên nhân viên <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" id="tenNhanVien" name="tenNhanVien"
                               value="${nhanVien.tenNhanVien}" required>
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="ngaySinh" class="form-label">Ngày sinh</label>
                        <input type="date" class="form-control" id="ngaySinh" name="ngaySinh"
                               value="${nhanVien.ngaySinh}">
                    </div>
                    <div class="col-md-6">
                        <label for="sdt" class="form-label">Số điện thoại <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" id="sdt" name="sdt"
                               value="${nhanVien.sdt}" required>
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-6">
                        <label class="form-label">Giới tính</label>
                        <div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="gioiTinh" id="gioiTinhNam"
                                       value="true" ${nhanVien.gioiTinh ? 'checked' : ''}>
                                <label class="form-check-label" for="gioiTinhNam">Nam</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="gioiTinh" id="gioiTinhNu"
                                       value="false" ${!nhanVien.gioiTinh ? 'checked' : ''}>
                                <label class="form-check-label" for="gioiTinhNu">Nữ</label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <label for="queQuan" class="form-label">Quê quán</label>
                        <input type="text" class="form-control" id="queQuan" name="queQuan"
                               value="${nhanVien.queQuan}">
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="matKhau" class="form-label">Mật khẩu ${nhanVien.id == null ? '<span class="text-danger">*</span>' : ''}</label>
                        <input type="password" class="form-control" id="matKhau" name="matKhau"
                        ${nhanVien.id == null ? 'required' : ''}>
                        <small class="text-muted">${nhanVien.id != null ? 'Để trống nếu không muốn thay đổi mật khẩu' : ''}</small>
                    </div>
                    <div class="col-md-6">
                        <label for="idChucVu" class="form-label">Chức vụ <span class="text-danger">*</span></label>
                        <select class="form-select" id="idChucVu" name="idChucVu" required>
                            <option value="">-- Chọn chức vụ --</option>
                            <c:forEach var="cv" items="${danhSachChucVu}">
                                <option value="${cv.id}" ${nhanVien.chucVu.id == cv.id ? 'selected' : ''}>
                                        ${cv.tenChucVu}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="trangThai" class="form-label">Trạng thái</label>
                    <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" id="trangThai" name="trangThai"
                               value="true" ${nhanVien.trangThai ? 'checked' : ''}>
                        <label class="form-check-label" for="trangThai">
                            ${nhanVien.trangThai ? 'Đang làm việc' : 'Nghỉ việc'}
                        </label>
                    </div>
                </div>

                <div class="text-center mt-3">
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-save me-2"></i>Lưu
                    </button>
                    <a href="${pageContext.request.contextPath}/nhanvien" class="btn btn-secondary ms-2">
                        <i class="fas fa-arrow-left me-2"></i>Quay lại
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>
<%@ include file="../layout/footer.jsp" %>