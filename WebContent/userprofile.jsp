<%@page import="java.text.DecimalFormat"%>
<%@page import="web.dao.HoaDonDAO"%>
<%@page import="web.model.HoaDon"%>
<%@page import="java.util.ArrayList"%>
<%@page import="web.model.User"%>
<%@ page language="java"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Quản lí tài khoản</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/datepicker3.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">
</head>
<body>

	<%
		User user = null;
		if (session.getAttribute("user") != null) {
			user = (User) session.getAttribute("user");
		} else {
			response.sendRedirect("index.jsp");
		}
	%>

	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
		<h4>Thông tin tài khoản</h4>
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col"
						style="color: #fff; background-color: #14213d; border-color: #fca311;">Họ
						tên</th>
					<th scope="col"
						style="color: #fff; background-color: #14213d; border-color: #fca311;">Username</th>
					<th scope="col"
						style="color: #fff; background-color: #14213d; border-color: #fca311;">Email</th>
					<th scope="col"
						style="color: #fff; background-color: #14213d; border-color: #fca311;">Số
						điện thoại</th>
				</tr>
			</thead>
			<tbody style="color: black;">
				<tr>
					<th><%=user.getName()%></th>
					<td><%=user.getUserName()%></td>
					<td><%=user.getEmailUser()%></td>
					<td><%=user.getPhoneNumberUser()%></td>
				</tr>


			</tbody>
		</table>


		<h4>Thông tin các đơn hàng</h4>
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col"
						style="color: #fff; background-color: #14213d; border-color: #fca311;">STT</th>
					<th scope="col"
						style="color: #fff; background-color: #14213d; border-color: #fca311;">Mã
						hóa đơn</th>
					<th scope="col"
						style="color: #fff; background-color: #14213d; border-color: #fca311;">Tổng
						tiền</th>
					<th scope="col"
						style="color: #fff; background-color: #14213d; border-color: #fca311;">Phương
						thức thanh toán</th>
					<th scope="col"
						style="color: #fff; background-color: #14213d; border-color: #fca311;">Địa
						chỉ nhận hàng</th>
					<th scope="col"
						style="color: #fff; background-color: #14213d; border-color: #fca311;">Ngày</th><th scope="col"
						style="color: #fff; background-color: #14213d; border-color: #fca311;"></th>
				</tr>
			</thead>
			<tbody style="color: black;">

				<%
					DecimalFormat formatter = new DecimalFormat("###,###,###");
					ArrayList<HoaDon> listHD = HoaDonDAO.getHoaDonCuaUser(user.getIdUser());
					for (int i = 0; i < listHD.size(); i++) {
				%>

				<tr>
					<th scope="row"><%=i + 1%></th>
					<td><%=listHD.get(i).getId_hoaDon()%></td>
					<td><%=formatter.format(listHD.get(i).getTongTien())%> VNĐ</td>
					<td><%=listHD.get(i).getPhuongThucThanhToan()%></td>
					<td><%=listHD.get(i).getDiaChi()%></td>
					<td><%=listHD.get(i).getDate()%></td>
					<td><a href="userbill.jsp?idHoaDon=<%=listHD.get(i).getId_hoaDon()%>">Xem chi tiết</a></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>