<%@page import="java.text.DecimalFormat"%>
<%@page import="web.dao.SanPhamDAO"%>
<%@page import="web.model.SanPham"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Quản lý sản phẩm</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="menu.jsp"></jsp:include>
	<%
		ArrayList<SanPham> listSP = SanPhamDAO.getListSanPham();
		DecimalFormat formatter = new DecimalFormat("###,###,###");
	%>

	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<h2>QUẢN LÝ SẢN PHẨM</h2>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">STT</th>
					<th scope="col">Mã sản phẩm</th>
					<th scope="col">Loại</th>
					<th scope="col">Danh mục</th>
					<th scope="col">Tên sản phẩm</th>
					<th scope="col">Hình ảnh</th>
					<th scope="col">Giá</th>
					<th scope="col">Mô tả</th>

				</tr>
			</thead>
			<tbody>
				<%
					for (int i = 0; i < listSP.size(); i++) {
				%>
				<tr>
					<th scope="row"><%=i+1 %></th>
					<td><%=listSP.get(i).getIdSanPham()%></td>
					<td><%=listSP.get(i).getTheLoai()%></td>
					<td><%=listSP.get(i).getDanhMuc()%></td>
					<td><%=listSP.get(i).getTenSanPham()%></td>
					<td><img alt=""
						src="/LapTrinhWeb/<%=listSP.get(i).getAnhSanPham()%>"></td>
					<td><%=formatter.format(listSP.get(i).getGiaSanPham())%> VNĐ</td>
					<td><%=listSP.get(i).getMoTaSanPham()%></td>
				</tr>
				<%
					}
				%>

			</tbody>
		</table>
	</div>




</body>
</html>