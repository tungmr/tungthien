<%@page import="java.text.DecimalFormat"%>
<%@page import="web.dao.SanPhamDAO"%>
<%@page import="web.model.SanPham"%>
<%@page import="web.dao.HoaDonDAO"%>
<%@page import="web.model.HoaDon"%>
<%@page import="web.dao.UserDAO"%>
<%@page import="web.model.User"%>
<%@page import="web.dao.ChiTietHoaDonDAO"%>
<%@page import="web.model.ChiTietHoaDon"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Chi tiết hóa đơn</title>
</head>
<body>
	<%
		User user = null;
		if (session.getAttribute("user") != null) {
			user = (User) session.getAttribute("user");
		}
		if (user != null && user.getRoleUser() == 0) {
			response.sendRedirect("/LapTrinhWeb/index.jsp");
		} else if (user == null) {
			response.sendRedirect("/LapTrinhWeb/login.jsp");
		}
	%>

	<jsp:include page="header.jsp"></jsp:include>

	<jsp:include page="menu.jsp"></jsp:include>

	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<h2>CHI TIẾT ĐƠN HÀNG</h2>


		<%
			DecimalFormat formatter = new DecimalFormat("###,###,###");

			int idUser = 0;
			long idHoaDon = 0L;
			if (request.getParameter("user") != null && request.getParameter("idHoaDon") != null) {
				idUser = Integer.parseInt(request.getParameter("user"));
				idHoaDon = Long.parseLong(request.getParameter("idHoaDon"));
			}

			ArrayList<ChiTietHoaDon> listChiTietHoaDon = ChiTietHoaDonDAO.getListChiTietHoaDon(idHoaDon);
			User userMua = UserDAO.getUserByID(idUser);
			HoaDon hoaDon = HoaDonDAO.getHoaDonByID(idHoaDon);
		%>
		<h3>Thông tin người mua</h3>

		<table class="table">
			<thead>
				<tr>
					<th scope="col">Họ tên</th>
					<th scope="col">Username</th>
					<th scope="col">Email</th>
					<th scope="col">Số điện thoại</th>
					<th scope="col">Địa chỉ</th>

				</tr>
			</thead>
			<tbody>
			</tbody>


			<tr>
				<td><%=userMua.getName()%></td>
				<td><%=userMua.getUserName()%></td>
				<td><%=userMua.getEmailUser()%></td>
				<td><%=userMua.getPhoneNumberUser()%></td>
				<td><%=hoaDon.getDiaChi() %></td>

			</tr>
		</table>

		<h3>Các sản phẩm mua</h3>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">STT</th>
					<th scope="col">Mã hóa đơn</th>
					<th scope="col">Mã sản phẩm</th>
					<th scope="col">Tên sản phẩm</th>
					<th scope="col">Đơn giá</th>
					<th scope="col">Số lượng</th>
					<th scope="col">Phương thức thanh toán</th>

				</tr>
			</thead>
			<tbody>
			</tbody>
			<%
				for (int i = 0; i < listChiTietHoaDon.size(); i++) {
					SanPham sanPham = SanPhamDAO.getSanPhamByIdSanPham(listChiTietHoaDon.get(i).getMaSanPham());
			%>

			<tr>
				<th scope="row"><%=i + 1%></th>
				<td><%=listChiTietHoaDon.get(i).getId_HoaDon()%></td>
				<td><%=listChiTietHoaDon.get(i).getMaSanPham()%></td>
				<td><%=sanPham.getTenSanPham()%></td>
				<td><%=formatter.format(listChiTietHoaDon.get(i).getGiaSanPham())%></td>
				<td><%=listChiTietHoaDon.get(i).getSoLuong()%></td>
				<td><%=hoaDon.getPhuongThucThanhToan()%></td>


			</tr>
			<%
				}
			%>
		</table>


	</div>




</body>
</html>