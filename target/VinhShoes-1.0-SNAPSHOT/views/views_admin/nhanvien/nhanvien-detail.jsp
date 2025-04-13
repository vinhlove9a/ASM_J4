<%@ include file="../layout/header.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="container mt-4">
    <div class="card">
        <div class="card-header bg-info text-white">
            <h3>Chi tiết nhân viên</h3>
        </div>
        <div class="card-body">
            <div class="row mb-3">
                <div class="col-md-6">
                    <p><strong>Mã nhân viên:</strong> ${nhanVien.maNhanVien}</p>
                    <p><strong>Tên nhân viên:</strong> ${nhanVien.tenNhanVien}</p>
                    <p><strong>Ngày sinh:</strong> ${nhanVien.ngaySinh}</p>
                    <p><strong>Số điện thoại:</strong> ${nhanVien.sdt}</p>
                </div>
                <div class="col-md-6">
                    <p><strong>Giới tính:</strong> ${nhanVien.gioiTinh ? 'Nam' : 'Nữ'}</p>
                    <p><strong>Quê quán:</strong> ${nhanVien.queQuan}</p>
                    <p><strong>Chức vụ:</strong> ${nhanVien.chucVu.tenChucVu}</p>
                    <p><strong>Trạng thái:</strong>
                        <span class="badge ${nhanVien.trangThai ? 'bg-success' : 'bg-danger'}">
                            ${nhanVien.trangThai ? 'Đang làm việc' : 'Nghỉ việc'}
                        </span>
                    </p>
                </div>
            </div>

            <div class="text-center mt-3">
                <a href="${pageContext.request.contextPath}/nhanvien/edit?id=${nhanVien.id}" class="btn btn-warning">
                    <i class="fas fa-edit me-2"></i>Sửa
                </a>
                <a href="${pageContext.request.contextPath}/nhanvien" class="btn btn-secondary ms-2">
                    <i class="fas fa-arrow-left me-2"></i>Quay lại
                </a>
            </div>
        </div>
    </div>
</div>
<%@ include file="../layout/footer.jsp" %>