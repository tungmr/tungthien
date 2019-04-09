<%@ page language="java"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta charset="UTF-8">
<title>TTSHOP - Thời trang nam cao cấp</title>
<link rel="stylesheet" type="text/css" href="css/mystyle.css">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
</head>
<body>
	
	<div class="bottom">
		<div class="container">
			<div class="about">
				<div class="info">
					<h2 style="text-align: center;">TTShop.vn</h2>
					<ul>
						<li style="font-size: 20px;">Chất lượng
							<ul>
								<li>TTShop cam kết chất lượng cho tất cả sản phẩm bán tại
									cửa hàng TTShop bằng chính sách bảo hành 365 ngày và chăm sóc
									trọn đời sau khi hết bảo hành.</li>
							</ul>
						</li>
						<li style="font-size: 20px;">Phục vụ
							<ul>
								<li>TTShop cam kết chất lượng phục vụ tốt nhất, chuyên
									nghiệp nhất cho mọi khách hàng bằng chính sách hoàn tiền và
									tặng quà nếu nhân viên phục vụ quí khách không chu đáo.</li>
							</ul>
						</li>
						<li style="font-size: 20px;">Hỗ trợ
							<ul>
								<li>Nếu bạn gặp rắc rối về sản phẩm hay chất lượng dịch vụ
									của TTShop, hãy gọi ngay đến số 098686868.</li>
							</ul>
						</li>
					</ul>
				</div>

				<div class="help ">
					<h2 style="text-align: center;">Trợ giúp và tư vấn</h2>
					<ul>
						<li><img src="images/right.png" width="11px" height="11px">
							<a href="#">Liện hệ</a></li>
						<li><img src="images/right.png" width="11px" height="11px">
							<a href="#">Cách chọn size quần áo</a></li>
						<li><img src="images/right.png" width="11px" height="11px">
							<a href="#">Câu hỏi thường gặp</a></li>
						<li><img src="images/right.png" width="11px" height="11px">
							<a href="#">Chính sách đổi hàng</a></li>
					</ul>
				</div>

				<div class="contact" style="padding: 0;">
					<h2 style="text-align: center;">Kết nối</h2>
					<ul>
						<li><a href="#" title="Đi đến trang facebook chúng tôi"><img
								src="images/facebook.png"></a></li>
						<li><a href="#" title="Đi đến trang instagram chúng tôi"><img
								src="images/instagram.png"></a></li>
						<li><a href="#" title="Đi đến trang youtube chúng tôi"><img
								src="images/youtube.png"></a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="footer" style="margin-top: 10px">
			<p>&copy; Copyright 2019 TungMR, ThienLe</p>
		</div>
	</div>

	<!-- Cuộn trơn -->
	<script type="text/javascript">
		document.querySelectorAll('a[href^="#"]').forEach(anchor => {
		    anchor.addEventListener('click', function (e) {
		        e.preventDefault();
		        document.querySelector(this.getAttribute('href')).scrollIntoView({
		            behavior: 'smooth'
		        });
		    });
		});
	</script>
</body>
</html>