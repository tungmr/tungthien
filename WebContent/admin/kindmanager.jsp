<%@page import="web.dao.TheLoaiDAO"%>
<%@page import="web.model.TheLoai"%>
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
<link href="./style.css" rel="stylesheet">

<title>Quản lý loại sản phẩm</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="menu.jsp"></jsp:include>
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<h2>QUẢN LÝ LOẠI SẢN PHẨM</h2>

		<a href="addkindmanager.jsp" class="addkinda">
		<img alt="" src="images/plus-button.png">Thêm loại sản phẩm mới</a>
		<%
		if(request.getParameter("adsc")!=null)
		if (request.getParameter("adsc").equals("1")){
			%>
			<p style="color: blue;">Đã thêm loại sản phẩm mới!</p>
			<%
		}
		
		if(request.getParameter("delsc")!=null)
			if (request.getParameter("delsc").equals("1")){
				%>
				<p style="color: blue;">Đã xóa!</p>
				<%
			}
		
		if(request.getParameter("edsc")!=null)
			if (request.getParameter("edsc").equals("1")){
				%>
				<p style="color: blue;">Đã chỉnh sửa loại sản phẩm!</p>
				<%
			}
		%>

		<table class="table">
			<thead>
				<tr>
					<th scope="col">STT</th>
					<th scope="col">Mã loại</th>
					<th scope="col">Tên</th>
					<th scope="col">Thuộc danh mục</th>
				</tr>
			</thead>
			<tbody>

				<%
					TheLoaiDAO theLoaiDAO = new TheLoaiDAO();
					List<TheLoai> listTheLoai = theLoaiDAO.getTheLoai();
					for (int i = 0; i < listTheLoai.size(); i++) {
				%>

				<tr>
					<th scope="row"><%=i + 1%></th>
					<td><%=listTheLoai.get(i).getiD()%></td>
					<td><%=listTheLoai.get(i).getTenTheLoai()%></td>
					<td><%=listTheLoai.get(i).getDanhMuc()%></td>
					<td><a
						href="editkindmanager.jsp?idTheLoai=<%=listTheLoai.get(i).getiD()%>">
							<img alt="" src="images/edit.png">Sửa
					</a>| <a
						href="/LapTrinhWeb/KindManager?c=xoa&idTheLoai=<%=listTheLoai.get(i).getiD()%>">
							<img alt="" src="images/delete.png">Xóa
					</a></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>

	</div>

</body>
</html>