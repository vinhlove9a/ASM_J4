<%@ include file="../layout/header.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="container mt-4">
    <div class="card">
        <div class="card-header bg-primary text-white">
            <h3>${kichThuoc.id != null ? 'Cập nhật kích thước' : 'Thêm kích thước mới'}</h3>
        </div>
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/kichthuoc/save" method="post">
                <input type="hidden" name="id" value="${kichThuoc.id}" />

                <div class="mb-3">
                    <label for="maKT" class="form-label">Mã kích thước</label>
                    <input type="text" class="form-control" id="maKT" name="maKT"
                           value="${kichThuoc.maKT}" readonly placeholder="Mã sẽ được tạo tự động">
                </div>

                <div class="mb-3">
                    <label for="tenKT" class="form-label">Tên kích thước <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="tenKT" name="tenKT"
                           value="${kichThuoc.tenKT}" required>
                </div>

                <div class="mb-3">
                    <label for="trangThai" class="form-label">Trạng thái</label>
                    <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" id="trangThai" name="trangThai"
                               value="true" ${kichThuoc.trangThai ? 'checked' : ''}>
                        <label class="form-check-label" for="trangThai">
                            ${kichThuoc.trangThai ? 'Hoạt động' : 'Ngừng hoạt động'}
                        </label>
                    </div>
                </div>

                <div class="text-center mt-3">
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-save me-2"></i>Lưu
                    </button>
                    <a href="${pageContext.request.contextPath}/kichthuoc" class="btn btn-secondary ms-2">
                        <i class="fas fa-arrow-left me-2"></i>Quay lại
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>
<%@ include file="../layout/footer.jsp" %>