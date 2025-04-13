<%@ include file="../layout/header.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="container mt-4">
    <div class="card">
        <div class="card-header bg-primary text-white">
            <h3>${chucVu.id != null ? 'Cập nhật chức vụ' : 'Thêm chức vụ mới'}</h3>
        </div>
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/chucvu/save" method="post">
                <input type="hidden" name="id" value="${chucVu.id}" />

                <div class="mb-3">
                    <label for="maChucVu" class="form-label">Mã chức vụ</label>
                    <input type="text" class="form-control" id="maChucVu" name="maChucVu"
                           value="${chucVu.maChucVu}" readonly placeholder="Mã sẽ được tạo tự động">
                </div>

                <div class="mb-3">
                    <label for="tenChucVu" class="form-label">Tên chức vụ <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="tenChucVu" name="tenChucVu"
                           value="${chucVu.tenChucVu}" required>
                </div>

                <div class="mb-3">
                    <label for="trangThai" class="form-label">Trạng thái</label>
                    <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" id="trangThai" name="trangThai"
                               value="true" ${chucVu.trangThai ? 'checked' : ''}>
                        <label class="form-check-label" for="trangThai">
                            ${chucVu.trangThai ? 'Hoạt động' : 'Ngừng hoạt động'}
                        </label>
                    </div>
                </div>

                <div class="text-center mt-3">
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-save me-2"></i>Lưu
                    </button>
                    <a href="${pageContext.request.contextPath}/chucvu" class="btn btn-secondary ms-2">
                        <i class="fas fa-arrow-left me-2"></i>Quay lại
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>
<%@ include file="../layout/footer.jsp" %>