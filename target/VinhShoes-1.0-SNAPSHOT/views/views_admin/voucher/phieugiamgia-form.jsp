<%@ include file="../layout/header.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="container mt-4">
    <div class="card">
        <div class="card-header bg-primary text-white">
            <h3>${phieuGiamGia.id != null ? 'Cập nhật phiếu giảm giá' : 'Thêm phiếu giảm giá mới'}</h3>
        </div>
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/phieugiamgia/save" method="post">
                <input type="hidden" name="id" value="${phieuGiamGia.id}" />

                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="maPhieuGiamGia" class="form-label">Mã phiếu giảm giá</label>
                        <input type="text" class="form-control" id="maPhieuGiamGia" name="maPhieuGiamGia"
                               value="${phieuGiamGia.maPhieuGiamGia}" ${phieuGiamGia.id != null ? 'readonly' : ''} placeholder="Mã sẽ được tạo tự động">
                    </div>
                    <div class="col-md-6">
                        <label for="tenPhieuGiamGia" class="form-label">Tên phiếu giảm giá <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" id="tenPhieuGiamGia" name="tenPhieuGiamGia"
                               value="${phieuGiamGia.tenPhieuGiamGia}" required>
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="soLuong" class="form-label">Số lượng <span class="text-danger">*</span></label>
                        <input type="number" class="form-control" id="soLuong" name="soLuong"
                               value="${phieuGiamGia.soLuong}" min="0" required>
                    </div>
                    <div class="col-md-6">
                        <label for="daDung" class="form-label">Đã dùng</label>
                        <input type="number" class="form-control" id="daDung" name="daDung"
                               value="${phieuGiamGia.daDung}" min="0" ${phieuGiamGia.id != null ? '' : 'readonly'}>
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="kieuGiam" class="form-label">Kiểu giảm <span class="text-danger">*</span></label>
                        <select class="form-select" id="kieuGiam" name="kieuGiam" required>
                            <option value="">-- Chọn kiểu giảm --</option>
                            <option value="VND" ${phieuGiamGia.kieuGiam eq 'VND' ? 'selected' : ''}>VND</option>
                            <option value="%" ${phieuGiamGia.kieuGiam eq '%' ? 'selected' : ''}>%</option>
                        </select>
                    </div>
                    <div class="col-md-6">
                        <label for="mucGiam" class="form-label">Mức giảm <span class="text-danger">*</span></label>
                        <input type="number" class="form-control" id="mucGiam" name="mucGiam"
                               value="${phieuGiamGia.mucGiam}" min="0" step="1000" required>
                        <small class="text-muted" id="mucGiamNote">Nhập số tiền VND hoặc phần trăm giảm giá</small>
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="hoaDonToiThieu" class="form-label">Hóa đơn tối thiểu <span class="text-danger">*</span></label>
                        <input type="number" class="form-control" id="hoaDonToiThieu" name="hoaDonToiThieu"
                               value="${phieuGiamGia.hoaDonToiThieu}" min="0" step="10000" required>
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="ngayBatDau" class="form-label">Ngày bắt đầu <span class="text-danger">*</span></label>
                        <input type="date" class="form-control" id="ngayBatDau" name="ngayBatDau"
                               value="<fmt:formatDate value='${phieuGiamGia.ngayBatDau}' pattern='yyyy-MM-dd'/>" required>
                    </div>
                    <div class="col-md-6">
                        <label for="ngayKetThuc" class="form-label">Ngày kết thúc <span class="text-danger">*</span></label>
                        <input type="date" class="form-control" id="ngayKetThuc" name="ngayKetThuc"
                               value="<fmt:formatDate value='${phieuGiamGia.ngayKetThuc}' pattern='yyyy-MM-dd'/>" required>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="trangThai" class="form-label">Trạng thái</label>
                    <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" id="trangThai" name="trangThai"
                               value="true" ${phieuGiamGia.trangThai ? 'checked' : ''}>
                        <label class="form-check-label" for="trangThai">
                            ${phieuGiamGia.trangThai ? 'Hoạt động' : 'Khóa'}
                        </label>
                    </div>
                </div>

                <div class="text-center mt-3">
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-save me-2"></i>Lưu
                    </button>
                    <a href="${pageContext.request.contextPath}/phieugiamgia" class="btn btn-secondary ms-2">
                        <i class="fas fa-arrow-left me-2"></i>Quay lại
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    document.getElementById('kieuGiam').addEventListener('change', function() {
        const kieuGiam = this.value;
        const mucGiamNote = document.getElementById('mucGiamNote');
        const mucGiamInput = document.getElementById('mucGiam');

        if (kieuGiam === 'VND') {
            mucGiamNote.textContent = 'Nhập số tiền VND giảm';
            mucGiamInput.step = '1000';
        } else if (kieuGiam === '%') {
            mucGiamNote.textContent = 'Nhập phần trăm giảm giá (1-100)';
            mucGiamInput.step = '0.1';
            mucGiamInput.max = '100';
        }
    });

    // Trigger the change event on load to set the appropriate text
    document.addEventListener('DOMContentLoaded', function() {
        document.getElementById('kieuGiam').dispatchEvent(new Event('change'));
    });
</script>
<%@ include file="../layout/footer.jsp" %>