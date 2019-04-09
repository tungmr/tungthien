<%@page import="web.model.User"%>
<%@page import="web.dao.DanhMucDAO"%>
<%@page import="web.model.DanhMuc"%>
<%@page import="java.util.List"%>
<%@ page language="java"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Quản lý loại sản phẩm</title>
</head>
<body>
	
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="menu.jsp"></jsp:include>
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<h2>THÊM LOẠI SẢN PHẨM</h2>
		<%
			DanhMucDAO danhMucDAO = new DanhMucDAO();
			List<DanhMuc> listDanhMuc = danhMucDAO.getDanhMuc();
		%>


		<form action="/LapTrinhWeb/KindManager?c=them" method="post">
			<div class="form-group">
				<label for="exampleFormControlInput1">Tên loại sản phẩm</label> <input
					type="text" class="form-control" id="exampleFormControlInput1"
					placeholder="nhập tên loại sản phẩm" name="tenTheLoai">
			</div>
			<div class="form-group">
				<label for="exampleFormControlSelect1">Mã danh mục</label> <select
					class="form-control" id="exampleFormControlSelect1"
					name="idDanhMuc">
					<%
						for (int i = 0; i < listDanhMuc.size(); i++) {
					%>
					<option value="<%=listDanhMuc.get(i).getiD()%>"><%=listDanhMuc.get(i).getiD()%></option>
					<%
						}
					%>
				</select>
				<input type="hidden" name="idTheLoai" value="x">
			</div>
			<div class="form-group">
				<input type="submit" value="XÁC NHẬN">
			</div>
		</form>



		<h4>Thông tin danh mục</h4>

		<table class="table">
			<thead>
				<tr>
					<th scope="col">STT</th>
					<th scope="col">Mã danh mục</th>
					<th scope="col">Tên danh mục</th>
				</tr>
			</thead>
			<tbody>

				<%
					for (int i = 0; i < listDanhMuc.size(); i++) {
				%>

				<tr>
					<th scope="row"><%=i + 1%></th>
					<td><%=listDanhMuc.get(i).getiD()%></td>
					<td><%=listDanhMuc.get(i).getTenDanhMuc()%></td>

				</tr>

				<%
					}
				%>

			</tbody>
		</table>

	</div>
</body>
</html>