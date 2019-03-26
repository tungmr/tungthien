<%@ page language="java"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Đăng nhập</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/style-login.css">
</head>
<body>
	<%
	
		if (session.getAttribute("user")!=null)
		{
			response.sendRedirect("index.jsp");
		}
	
		String e = "";
		if (request.getParameter("e")!=null){
			e = request.getParameter("e");
		}
		
	
	%>

	<div class="login-box">
			<img alt="" class="avatar" src="images/account.png">
			<h1 style="font-weight: bold;">Đăng nhập</h1>
			<form action="HandlerLogin" method="POST">
			<p>Tên đăng nhập </p>
			<input type="text" name="username" placeholder="Nhập vào tên đăng nhập của bạn">
			<p>Mật khẩu </p>
			<input type="password" name="password" placeholder="Nhập vào mật khẩu của bạn">
			<%
			if (e.equals("1")){
				System.out.println(e);
			%>
				<p id="noti" style="color: red; margin-bottom: 10px; ">Thông tin đăng nhập không đúng!</p>
			<%
			}	
			%>
			<input type="submit" value="Xác nhận">
			<a href="register.jsp">Đăng kí tài khoản!</a>
			
			</form>
	</div>

</body>
</html>