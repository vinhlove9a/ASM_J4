<%@ include file="../layout/header.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="container mt-4">
    <div class="card">
        <div class="card-header bg-primary text-white">
            <h3>${thuongHieu.id != null ? 'Cập nhật thương hiệu' : 'Thêm thương hiệu mới'}</h3>
        </div>
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/thuonghieu/save" method="post">
                <input type="hidden" name="id" value="${thuongHieu.id}" />

                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="maTH" class="form-label">Mã thương hiệu <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" id="maTH" name="maTH"
                               value="${thuongHieu.maTH}" required ${thuongHieu.id != null ? 'readonly' : ''}>
                    </div>
                    <div class="col-md-6">
                        <label for="tenTH" class="form-label">Tên thương hiệu <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" id="tenTH" name="tenTH"
                               value="${thuongHieu.tenTH}" required>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="trangThai" class="form-label">Trạng thái</label>
                    <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" id="trangThai" name="trangThai"
                               value="true" ${thuongHieu.trangThai ? 'checked' : ''}>
                        <label class="form-check-label" for="trangThai">
                            ${thuongHieu.trangThai ? 'Hoạt động' : 'Ngừng hoạt động'}
                        </label>
                    </div>
                </div>

                <div class="text-center mt-3">
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-save me-2"></i>Lưu
                    </button>
                    <a href="${pageContext.request.contextPath}/thuonghieu" class="btn btn-secondary ms-2">
                        <i class="fas fa-arrow-left me-2"></i>Quay lại
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>
<%@ include file="../layout/footer.jsp" %>