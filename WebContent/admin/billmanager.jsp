<%@page import="java.text.DecimalFormat"%>
<%@page import="web.dao.UserDAO"%>
<%@page import="java.util.List"%>
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
<title>Quản lý đơn hàng</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/datepicker3.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">

<!--Custom Font-->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
<!--[if lt IE 9]>
	<script src="js/html5shiv.js"></script>
	<script src="js/respond.min.js"></script>
	<![endif]-->
</head>
<body>
	<%
		DecimalFormat formatter = new DecimalFormat("###,###,###");

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
		<h2>QUẢN LÝ ĐƠN HÀNG</h2>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">STT</th>
					<th scope="col">Mã hóa đơn</th>
					<th scope="col">Khách hàng</th>
					<th scope="col">Tổng tiền</th>
					<th scope="col">Phương thức thanh toán</th>
					<th scope="col">Địa chỉ</th>
					<th scope="col">Ngày</th>
					<th scope="col">Trạng thái</th>
					

				</tr>
			</thead>



			<tbody>
				<%
					ArrayList<HoaDon> listHoaDon = HoaDonDAO.getListHoaDon();

					for (int i=0;i<listHoaDon.size();i++) {
						User userMua = UserDAO.getUserByID(listHoaDon.get(i).getId_user());
				%>

				<tr>
					<th scope="row"><%=i+1 %></th>
					<td><%=listHoaDon.get(i).getId_hoaDon() %></td>
					<td><%=userMua.getUserName()%></td>
					<td><%=formatter.format(listHoaDon.get(i).getTongTien())%></td>
					<td><%=listHoaDon.get(i).getPhuongThucThanhToan() %></td>
					<td><%=listHoaDon.get(i).getDiaChi() %></td>
					<td><%=listHoaDon.get(i).getDate() %></td>
					<td></td>
					<td><a href="billdetail.jsp?user=<%=userMua.getIdUser()%>&idHoaDon=<%=listHoaDon.get(i).getId_hoaDon()%>">Xem chi tiết</a></td>
					
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>


	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/chart.min.js"></script>
	<script src="js/chart-data.js"></script>
	<script src="js/easypiechart.js"></script>
	<script src="js/easypiechart-data.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/custom.js"></script>

</body>
</html>
