<%@ page language="java"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Đăng kí tài khoản</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/style-login.css">

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"
	type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var x_timer;
		$("#username").keyup(function(e) {
			clearTimeout(x_timer);
			var user_name = $(this).val();
			x_timer = setTimeout(function() {
				check_username_ajax(user_name);
			}, 1000);
		});

		function check_username_ajax(username) {
			$("#user-result").html('<img src="img/ajax-loader.gif" />');
			$.post('CheckUserServlet', {
				'username' : username
			}, function(data) {
				$("#user-result").html(data);
			});
		}
	});
</script>

<script type="text/javascript">
	$(document).ready(function() {
		var x_timer;
		$("#email").keyup(function(e) {
			clearTimeout(x_timer);
			var emailAddress = $(this).val();
			x_timer = setTimeout(function() {
				check_email_ajax(emailAddress);
			}, 1000);
		});

		function check_email_ajax(emailAddress) {
			$("#email-result").html('<img src="img/ajax-loader.gif" />');
			$.post('CheckEmailServlet', {
				'email' : emailAddress
			}, function(data) {
				$("#email-result").html(data);
			});
		}
	});
</script>

<script type="text/javascript">
	$(document).ready(function() {
		var x_timer;
		$("#repassword").keyup(function(e) {
			clearTimeout(x_timer);
			var repassword = $(this).val();
			var password = document.getElementById("password").value;
			x_timer = setTimeout(function() {
				check_password_ajax(repassword, password);
			}, 1000);
		});

		function check_password_ajax(repassword, password) {
			$("#password-result").html('<img src="img/ajax-loader.gif" />');
			$.post('CheckPasswordServlet', {
				'repassword' : repassword,
				'password' : password
			}, function(data) {
				$("#password-result").html(data);
			});
		}
	});
</script>


</head>
<body>

	<%
		String e = "";
		if (request.getParameter("e") != null) {
			e = request.getParameter("e");
		}
	%>

	<div class="login-box" style="width: 40em; height: 55em;">
		<img alt="" class="avatar" src="images/account.png">
		<h1 style="font-weight: bold;">Đăng kí tài khoản</h1>
		<form action="HandlerUser" method="POST">
			<p>Họ và tên</p>
			<input type="text" name="name"
				 placeholder="Nhập vào họ tên của bạn" value=""
				maxlength="100">
			<p>Tên đăng nhập</p>
			<span id="user-result"></span> <input type="text" name="username"
				id="username" placeholder="Nhập vào tên đăng nhập của bạn" value=""
				maxlength="50">
			<p>Mật khẩu</p>
			<input type="password" name="password" id="password" value=""
				placeholder="Nhập vào mật khẩu của bạn">
			<p>Nhập lại mật khẩu</p>
			<span id="password-result"></span> <input type="password" value=""
				name="repassword" id="repassword"
				placeholder="Nhập lại mật khẩu của bạn">
			<p>Email</p>
			<span id="email-result"></span> <input type="text" name="email"
				value="" placeholder="Nhập vào Email của bạn" maxlength="30"
				id="email">
			<p>Số điện thoại</p>
			<input type="text" name="phoneNumber" value=""
				placeholder="Nhập vào số điện thoại của bạn" maxlength="30">
			<%
				if (e.equals("1")) {
					
			%>
			<p id="noti" style="color: red; margin-bottom: 10px;">Kiểm tra
				lại thông tin!</p>
			<%
				} else if (e.equals("0")) {
			%>
			<p id="noti" style="color: green; margin: 20px 0px;;">
				Đăng ký thành công, mời bạn <a href="login.jsp"> đăng nhập!</a>
			</p>
			<%
				}
			%>
			<input type="submit" value="Xác nhận">

		</form>
	</div>

</body>
</html>