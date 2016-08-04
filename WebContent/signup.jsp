<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset="utf-8">
<title>Fecan Your Trip</title>
<meta name="description" content="The Project a Bootstrap-based, Responsive HTML5 Template">
<meta name="author" content="htmlcoder.me">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="image/favicon.ico">
<link href='http://fonts.googleapis.com/css?family=Roboto:400,300,300italic,400italic,500,500italic,700,700italic' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Raleway:700,400,300' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=PT+Serif' rel='stylesheet' type='text/css'>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="fonts/font-awesome/css/font-awesome.css" rel="stylesheet">
<link href="fonts/fontello/css/fontello.css" rel="stylesheet">
<link href="plugins/magnific-popup/magnific-popup.css" rel="stylesheet">
<link href="css/animations.css" rel="stylesheet">
<link href="plugins/owl-carousel/owl.carousel.css" rel="stylesheet">
<link href="plugins/owl-carousel/owl.transitions.css" rel="stylesheet">
<link href="plugins/hover/hover-min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/skins/light_blue.css" rel="stylesheet">
<link href="css/custom.css" rel="stylesheet">
</head>
	<body class="no-trans   ">
		<div class="scrollToTop circle">
			<i class="icon-up-open-big"></i>
		</div>
		<div class="page-wrapper">
			<div class="fullscreen-bg"></div>
			<div class="pv-40 dark-translucent-bg">
				<div class="container">
					<div class="object-non-visible text-center" data-animation-effect="fadeInDownSmall" data-effect-delay="100">
						<div id="logo" class="logo">
							<h3 class="margin-clear">
								<a href="index.do" class="logo-font link-light">The <span class="text-default">Project</span></a>
							</h3>
						</div>
						<p class="small">Sign up</p>
						<div class="form-block center-block p-30 light-gray-bg border-clear text-left">
							<h2 class="title">Sign Up</h2>
							<form class="form-horizontal" role="form" action="signupProc.do" id="signform">
								<div class="form-group has-feedback">
									<label for="inputUserName" class="col-sm-3 control-label">ID
										<span class="text-danger small">*</span>
									</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="userid"
											name=user_id placeholder="User Name" required> <i
											class="fa fa-user form-control-feedback"></i>
									</div>
								</div>
								<div class="form-group has-feedback">
									<label for="inputEmail" class="col-sm-3 control-label">Email
										<span class="text-danger small">*</span>
									</label>
									<div class="col-sm-8">
										<input type="email" class="form-control" id="email"
											name="user_email" placeholder="Email" required> <i
											class="fa fa-envelope form-control-feedback"></i>
									</div>
								</div>
								<div class="form-group has-feedback">
									<label for="inputPassword" class="col-sm-3 control-label">Password
										<span class="text-danger small">*</span>
									</label>
									<div class="col-sm-8">
										<input type="password" class="form-control" id="password"
											name="user_passwd" placeholder="Password" required> <i
											class="fa fa-lock form-control-feedback"></i>
									</div>
								</div>
								<div class="form-group has-feedback">
									<label for="inputPassword" class="col-sm-3 control-label">RePassword
										<span class="text-danger small">*</span>
									</label>
									<div class="col-sm-8">
										<input type="password" class="form-control" id="repassword"
											name="user_repasswd" placeholder="Password" required>
										<i class="fa fa-lock form-control-feedback"></i>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-3 col-sm-8">
										<div class="checkbox">
											<label> <input type="checkbox" required>
												Accept our privacy policy and customer agreement
											</label>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-3 col-sm-8">
										<button type="submit" class="btn btn-group btn-default btn-animated" id="signbtn">
											Sign Up <i class="fa fa-check"></i>
										</button>
									</div>
								</div>
							</form>
						</div>	
						<p class="mt-20">Copyright © 2016 Fecan Your Trip Inc. All Rights Reserved</p>
					</div>
				</div>
			</div>
		</div>
	
		<script type="text/javascript" src="plugins/jquery.min.js"></script>
		<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="plugins/modernizr.js"></script>
		<script type="text/javascript" src="plugins/magnific-popup/jquery.magnific-popup.min.js"></script>
		<script type="text/javascript" src="plugins/waypoints/jquery.waypoints.min.js"></script>
		<script type="text/javascript" src="plugins/jquery.countTo.js"></script>
		<script src="plugins/jquery.parallax-1.1.3.js"></script>
		<script src="plugins/jquery.validate.js"></script>
		<script type="text/javascript" src="plugins/owl-carousel/owl.carousel.js"></script>
		<script type="text/javascript" src="plugins/jquery.browser.js"></script>
		<script type="text/javascript" src="plugins/SmoothScroll.js"></script>
		<script type="text/javascript" src="plugins/jquery.countdown/jquery.plugin.js"></script>
		<script type="text/javascript" src="plugins/jquery.countdown/jquery.countdown.js"></script>
		<script type="text/javascript" src="js/coming.soon.config.js"></script>
		<script type="text/javascript" src="js/template.js"></script>
		<script type="text/javascript" src="js/custom.js"></script>
	</body>
</html>