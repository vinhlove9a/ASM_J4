<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hệ Thống Quản Lý</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .sidebar {
            min-height: 100vh;
            background-color: #343a40;
            color: white;
        }
        .sidebar a {
            color: #f8f9fa;
            text-decoration: none;
            display: block;
            padding: 10px 15px;
        }
        .sidebar a:hover {
            background-color: #495057;
        }
        .content {
            padding: 20px;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-2 sidebar p-0">
            <div class="p-3 bg-primary">
                <h3>Admin Panel</h3>
            </div>
            <div class="mt-3">
                <a href="${pageContext.request.contextPath}/nhanvien"><i class="fas fa-users me-2"></i> Quản lý nhân viên</a>
                <a href="${pageContext.request.contextPath}/khachhang"><i class="fas fa-user-friends me-2"></i> Quản lý khách hàng</a>
                <a href="${pageContext.request.contextPath}/sanpham"><i class="fas fa-box me-2"></i> Quản lý sản phẩm</a>
                <a href="${pageContext.request.contextPath}/thuonghieu"><i class="fas fa-trademark me-2"></i> Quản lý thương hiệu</a>
                <a href="${pageContext.request.contextPath}/mausac"><i class="fas fa-palette me-2"></i> Quản lý màu sắc</a>
                <a href="${pageContext.request.contextPath}/kichthuoc"><i class="fas fa-ruler me-2"></i> Quản lý kích thước</a>
                <a href="${pageContext.request.contextPath}/chitietsanpham"><i class="fas fa-info-circle me-2"></i> Chi tiết sản phẩm</a>
                <a href="${pageContext.request.contextPath}/phieugiamgia"><i class="fas fa-tag me-2"></i> Phiếu giảm giá</a>
                <a href="${pageContext.request.contextPath}/hoadon"><i class="fas fa-file-invoice me-2"></i> Quản lý hóa đơn</a>
                <a href="${pageContext.request.contextPath}/chucvu"><i class="fas fa-sitemap me-2"></i> Quản lý chức vụ</a>
                <a href="${pageContext.request.contextPath}/giohang"><i class="fas fa-shopping-cart me-2"></i> Giỏ hàng</a>
            </div>
        </div>
        <div class="col-md-10 content">