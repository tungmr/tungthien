<%@page import="web.dao.DanhMucDAO"%>
<%@page import="web.dao.TheLoaiDAO"%>
<%@page import="web.model.DanhMuc"%>
<%@page import="java.util.List"%>
<%@page import="web.model.TheLoai"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="web.dao.SanPhamDAO"%>
<%@page import="web.model.SanPham"%>
<%@page import="web.model.User"%>
<%@ page language="java"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Chỉnh sửa sản phẩm</title>
</head>
<body>
	

	<jsp:include page="header.jsp"></jsp:include>

	<jsp:include page="menu.jsp"></jsp:include>
	
	<%
		int idSanPham = 0;
		if (request.getParameter("idSanPham")!=null){
			idSanPham = Integer.parseInt(request.getParameter("idSanPham"));
		}
		
		SanPham sanPham = SanPhamDAO.getSanPhamByIdSanPham(idSanPham);
		DecimalFormat formatter = new DecimalFormat("###,###,###");
		List<TheLoai> listTL = TheLoaiDAO.getTheLoai();
		List<DanhMuc> listDM = DanhMucDAO.getDanhMuc();

	%>

	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<h2>CHỈNH SỬA SẢN PHẨM</h2>
		
		<form action="/LapTrinhWeb/ProductsManager" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label for="exampleFormControlInput1">Tên sản phẩm</label> <input
					type="text" class="form-control" id="exampleFormControlInput1"
					value="<%=sanPham.getTenSanPham()%>" name="tenSanPham">
			</div>
			<div class="form-group">
				<label for="exampleFormControlInput1">Giá sản phẩm</label> <input
					type="number" class="form-control" id="exampleFormControlInput1"
					value="<%=sanPham.getGiaSanPham() %>" name="giaSanPham">
			</div>
			<div class="form-group">
				<label for="exampleFormControlSelect1">Loại</label> <select
					class="form-control" id="exampleFormControlSelect1" name="theLoai">
					<%for (TheLoai theLoai : listTL){ 
					%>
					<option value="<%=theLoai.getiD()%>"
					<%if (sanPham.getTheLoai() == theLoai.getiD())
					{
						%>selected<%
					}
						
					%>
					><%=theLoai.getTenTheLoai() %></option>
					<%} %>
				</select>
			</div>
			<div class="form-group">
				<label for="exampleFormControlSelect1">Danh mục</label> <select
					class="form-control" id="exampleFormControlSelect1" name="danhMuc">
					<%for (DanhMuc danhMuc : listDM){ %>
					<option value="<%=danhMuc.getiD()%>"
					<% if (sanPham.getDanhMuc()== danhMuc.getiD()) 
					{
					%>
						selected
					<%
					}
					%>
					><%=danhMuc.getTenDanhMuc() %></option>
					<%} %>
					
				</select>
			</div>
			<div class="form-group">
				<label for="exampleFormControlInput1">Số lượng</label> <input
					type="number" class="form-control" id="exampleFormControlInput1"
					value="<%=sanPham.getSoLuong() %>" name="soLuong">
			</div>
		
			<div class="form-group">
				<label for="exampleFormControlTextarea1">Mô tả</label>
				<textarea class="form-control" id="exampleFormControlTextarea1"
					rows="3" name="moTa"><%=sanPham.getMoTaSanPham()%></textarea>
			</div>
			<div class="form-group">
				<label for="">Hình ảnh</label> <br>
				<img alt="" src="/LapTrinhWeb/images/<%=sanPham.getAnhSanPham()%>">
				<input type="file" name="hinhAnh" accept="image/*"> 
			</div>
			<input type="hidden" name="idSanPham" value=<%=sanPham.getIdSanPham() %>>
			<input type="hidden" name="c" value="capnhap">
			<div class="form-group">
				<input type="submit" value="CẬP NHẬP"> <br>
				<br>
				<a href="productsmanager.jsp">Hủy cập nhập</a>
			</div>
		</form>
		
		

	</div>

	


</body>
</html>