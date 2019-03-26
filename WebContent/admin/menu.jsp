<%@ page language="java"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Menu</title>
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

	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<div class="profile-sidebar">
			<div class="profile-userpic">
				<img src="images/name.png" class="img-responsive" alt="">
			</div>
			<div class="profile-usertitle">
				<div class="profile-usertitle-name">Username</div>
				<div class="profile-usertitle-status">
					<span class="indicator label-success"></span>Online
				</div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="divider"></div>
		<ul class="nav menu">

			<li class="parent "><a data-toggle="collapse" href="#sub-item-1">
					<em class="fa fa-navicon">&nbsp;</em> Quản lí sản phẩm <span
					data-toggle="collapse" href="#sub-item-1" class="icon pull-right"><em
						class="fa fa-plus"></em></span>
			</a>
				<ul class="children collapse" id="sub-item-1">
							<li><a class="" href="productsmanager.jsp"> <img alt=""
							src="images/checklist.png"> Danh sách sản phẩm
					</a></li>
					<li><a class="" href="addproduct.jsp"> <img alt=""
							src="images/plus-button.png"> Thêm sản phẩm
					</a></li>
				</ul></li>


			<li><a href="kindmanager.jsp"><img alt=""
					src="images/backend.png"> Quản lý loại sản phẩm</a></li>

			<li><a href="billmanager.jsp"><img alt=""
					src="images/invoice.png"> Đơn hàng</a></li>
			<li><a href="accountmanager.jsp"><img alt=""
					src="images/accountmanager.png"> Quản lí tài khoản</a></li>

			<li><a href="/LapTrinhWeb/Logout"><em
					class="fa fa-power-off">&nbsp;</em> Đăng xuất</a></li>
		</ul>
	</div>
	<!--/.sidebar-->
	
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