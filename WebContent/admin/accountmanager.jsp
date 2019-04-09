<%@page import="web.dao.UserDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="web.model.User"%>
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


	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<h2>QUẢN LÝ TÀI KHOẢN</h2>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">STT</th>
					<th scope="col">ID User</th>
					<th scope="col">Họ tên</th>
					<th scope="col">Username</th>
					<th scope="col">Email</th>
					<th scope="col">Số điện thoại</th>
				</tr>
			</thead>
			<tbody>
			
			<%
				ArrayList<User> listUser = UserDAO.getListUser();
			
				for (int i=0;i<listUser.size();i++){
					
				
			%>
			
				<tr>
					<th scope="row"><%=i+1 %></th>
					<td><%=listUser.get(i).getIdUser() %></td>
					<td><%=listUser.get(i).getName() %></td>
					<td><%=listUser.get(i).getUserName() %></td>
					<td><%=listUser.get(i).getEmailUser() %></td>
					<td><%=listUser.get(i).getPhoneNumberUser()%></td>
				</tr>
				<%} %>
				
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