<%@ page language="java"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>TTSHOP - Thời trang nam cao cấp</title>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />

</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="container">
		<div class="contact">
			<h1 class=" contact-in" style="color: #FCA311;">KẾT NỐI</h1>

			<div class="col-md-6 contact-top">
				<h3>Bản đồ</h3>
				<div class="map">
					<iframe
						src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.5223240402765!2d106.78381231533447!3d10.847820460836845!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175276bb276eaf7%3A0x56a6a0eafe0e3b09!2zOTcgRMaw4budbmcgTWFuIFRoaeG7h24sIEhp4buHcCBQaMO6LCBRdeG6rW4gOSwgSOG7kyBDaMOtIE1pbmgsIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1551799187932"></iframe>
				</div>
				<ul class=" ">
					<li>97 Man Thiện, Hiệp Phú, Quận 9, TP Hồ Chí Minh</li>
					<li>098686868</li>
					<li><a href="mailto:info@ttshop.vn"> info@ttshop.vn</a></li>
				</ul>
			</div>
			<div class="col-md-6 contact-top">
				<form action="">
					<h3>Bạn muốn kết nối với chúng tôi?</h3>
					<div>
						<span>Tên của bạn </span> <input type="text" value="">
					</div>
					<div>
						<span>Địa chỉ Email </span> <input type="text" value="">
					</div>
					<div>
						<span>Tiêu đề</span> <input type="text" value="">
					</div>
					<div>
						<span>Nội dung</span>
						<textarea> </textarea>
					</div>
					<input type="submit" value="Gửi">
				</form>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>