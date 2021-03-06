<%@page import="web.dao.DanhMucDAO"%>
<%@page import="web.model.DanhMuc"%>
<%@page import="web.dao.TheLoaiDAO"%>
<%@page import="web.model.TheLoai"%>
<%@page import="web.model.User"%>
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
		
		<%
			if (request.getParameter("adsc")!=null && request.getParameter("adscedit")==null && request.getParameter("delpro")==null )
			{
				if (request.getParameter("adsc").equals("1")){
					%>
					<p style="color: #30a5ff;">Đã thêm sản phẩm!</p>
					<%
				}
			}else if (request.getParameter("adsc")==null && request.getParameter("adscedit")!=null && request.getParameter("delpro")==null){
				if (request.getParameter("adscedit").equals("1")){
					%>
					<p style="color: #30a5ff;">Đã chỉnh sửa sản phẩm!</p>
					<%
				}
			}else if (request.getParameter("adsc")==null && request.getParameter("adscedit")==null && request.getParameter("delpro")!=null){
				if (request.getParameter("delpro").equals("1")){
					%>
					<p style="color: #30a5ff;">Đã xóa sản phẩm!</p>
					<%
				}
			}
		%>
		<table class="table">
			<thead>
				<tr>
					<th scope="col" style="width: 2em;">STT</th>
					<th scope="col" style="width: 6em;">Mã sản phẩm</th>
					<th scope="col" style="width: 6em;">Loại</th>
					<th scope="col" style="width: 6em;">Danh mục</th>
					<th scope="col" style="width: 6em;">Tên sản phẩm</th>
					<th scope="col" style="width: 6em;">Hình ảnh</th>
					<th scope="col" style="width: 6em;">Giá</th>
					<th scope="col" style="width: 6em;">Số lượng</th>
					<th scope="col" style="width: 7em;">Mô tả</th>
					<th scope="col" style="width: 6em;">Quản lí</th>

				</tr>
			</thead>
			<tbody>
				<%
					for (int i = 0; i < listSP.size(); i++) {
						TheLoai theLoai = TheLoaiDAO.getMotTheLoai(listSP.get(i).getTheLoai());
						DanhMuc danhMuc = DanhMucDAO.getMotDanhMuc(listSP.get(i).getDanhMuc());
				%>
				<tr>
					<th scope="row"><%=i+1 %></th>
					<td ><%=listSP.get(i).getIdSanPham()%></td>
					<td ><%=theLoai.getTenTheLoai()%></td>
					<td><%=danhMuc.getTenDanhMuc()%></td>
					<td><%=listSP.get(i).getTenSanPham()%></td>
					<td><img alt=""
						src="/LapTrinhWeb/images/<%=listSP.get(i).getAnhSanPham()%>"
						width="150px" height="200px"></td>
					<td><%=formatter.format(listSP.get(i).getGiaSanPham())%> VNĐ</td>
					<td><%=listSP.get(i).getSoLuong()%></td>
					<td><%=listSP.get(i).getMoTaSanPham()%></td>
					<td>
					<a href="editproduct.jsp?idSanPham=<%=listSP.get(i).getIdSanPham()%>">Sửa</a>|
					<a href="/LapTrinhWeb/ProductsManager?idSanPham=<%=listSP.get(i).getIdSanPham()%>&c=xoa">Xóa</a>
					</td>
				</tr>
				<%
					}
				%>

			</tbody>
		</table>
	</div>




</body>
</html>