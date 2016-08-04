<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="bean.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="md" class="bean.MemberDAO" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String mem_id = (String) session.getAttribute("mem_id");
	session.setAttribute("mem_id",mem_id); 	
	MemberDTO mDto = md.getMember(mem_id);
%>
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
<link href="css/style2.css" rel="stylesheet">
<link href="css/skins/light_blue.css" rel="stylesheet">
<link href="css/custom.css" rel="stylesheet">
<script>
	$(function() {
		var point = $('#toppoint').offset().top
		$(document).scrollTop(point)
	})
	
	function putRating(pt,ta) {
				var x = document.getElementById("sscore").innerHTML;
				if (x == 0) {
					alert("You sould put at least 1");
					return false;
				} else {
					var path = "rateUpdatePro.do?imgPath=" + pt + "&score=" + x +"&tab=" + ta;
					window.location.href = path;
				}
			 }
</script>
<style>
	.star-input>.input,
	.star-input>.input>label:hover,
	.star-input>.input>input:focus+label,
	.star-input>.input>input:checked+label{display: inline-block;vertical-align:middle;background:url('image/grade_img.png')no-repeat;}
	.star-input{display:inline-block; white-space:nowrap;width:225px;height:40px;padding:25px;line-height:30px;}
	.star-input>.input{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
	.star-input>.input>input{position:absolute;width:1px;height:1px;opacity:0;}
	star-input>.input.focus{outline:1px dotted #ddd;}
	.star-input>.input>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
	.star-input>.input>label:hover,
	.star-input>.input>input:focus+label,
	.star-input>.input>input:checked+label{background-size: 150px;background-position: 0 bottom;}
	.star-input>.input>label:hover~label{background-image: none;}
	.star-input>.input>label[for="p1"]{width:30px;z-index:5;}
	.star-input>.input>label[for="p2"]{width:60px;z-index:4;}
	.star-input>.input>label[for="p3"]{width:90px;z-index:3;}
	.star-input>.input>label[for="p4"]{width:120px;z-index:2;}
	.star-input>.input>label[for="p5"]{width:150px;z-index:1;}
	.star-input>output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}
</style>
</head>
<body>
	<nav class="navbar navbar-default navbar-static-top no-margin" role="navigation" id="fetop">
		<div class="container-fluid">
			<div class="navbar-header ">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-LG-navbar-collapse-1" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<div class="page-header no-margin no-padding">
					<a class="navbar-brand" href="afterlogin.do"><img src="image/logo.png"></a>
				</div>
			</div>
			<div class="collapse navbar-collapse navbar-right "
				id="bs-LG-navbar-collapse-1">
				<ul class="nav navbar-nav nav-tabs">
					<li><a href="#fetop">Home</a></li>
					<li><a href="afterabout.do">About</a></li>
					<li><a href="#mypage" role="button" data-toggle="modal">Manage</a></li>
					<li><a href="index.do">Sign Out</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="jumbotron">
		<div class="container">
			<div id="carousel-example-generic" class="carousel slide"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
					<li data-target="#carousel-example-generic" data-slide-to="1"></li>
					<li data-target="#carousel-example-generic" data-slide-to="2"></li>
					<li data-target="#carousel-example-generic" data-slide-to="3"></li>
					<li data-target="#carousel-example-generic" data-slide-to="4"></li>
				</ol>
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<img src="image/slide1.jpg" alt="s1">
						<div class="carousel-caption"></div>
					</div>
					<div class="item">
						<img src="image/slide2.jpg" alt="s2">
						<div class="carousel-caption"></div>
					</div>
					<div class="item">
						<img src="image/slide3.jpg" alt="s3">
						<div class="carousel-caption"></div>
					</div>
					<div class="item">
						<img src="image/slide4.jpg" alt="s4">
						<div class="carousel-caption"></div>
					</div>
					<div class="item">
						<img src="image/slide5.jpg" alt="s5">
						<div class="carousel-caption"></div>
					</div>
				</div>

				<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev"> 
				<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#carousel-example-generic"
					role="button" data-slide="next"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</div>
	</div>

	<ul class="nav nav-tabs nav-justified" id="toppoint">
	<c:choose>
	<c:when test="${tab =='top'}">
		<li role="presentation" class="active" id="tr"><a href="afterlogin.do#tr" style="font-weight: bold; color: #0099cc;">Top Rating</a></li>
		<li role="presentation"><a href="aftershowall.do#sa">Show all Posts</a></li>
	</c:when>
	<c:otherwise>
		<li role="presentation"><a href="afterlogin.do#tr">Top Rating</a></li>
  		<li role="presentation" class="active" id="sa"><a href="aftershowall.do#sa" style="font-weight: bold; color:#0099cc;">Show all Posts</a></li>
	</c:otherwise> 
	</c:choose>
		<li role="presentation"><a href="schedule.do#sc">Scheduling</a></li>
    	<li role="presentation"><a href="board.do#br">Board</a></li>
	</ul><br>
	  		<div class="jumbotron">
	    		<div class="container" align="center">
	    		<div class="row">
	    			<div class="col-xs-12 col-sm-6 col-md-4">
	      			<img style="margin-right:40px;" src="${postContent.imgpath}" height="200px" width="330px" class="pull-left">
	      			</div>
	      		<div class="col-xs-12 col-sm-6 col-md-8">
	            <h2 align="center" style="font-weight: bold; color:#0099cc;">${postContent.title}</h2>
	            <p class="lead">
	            	${postContent.comments}
	            </p>
	            </div>
	            </div>
	            <div class="row">
	            <div class="col-xs-12 col-sm-6 col-md-8" align="left">
	             <br><h3 style="font-weight: bold; color: #0099cc;" align="center">Recommendation</h3>
	      		<p class="text-primary">
	            	${postContent.itinerary}
	            </p>
	            </div>
	            <div class="col-xs-12 col-sm-6 col-md-4">
	            	<br><h3 style="font-weight: bold; color: #0099cc;">Rating</h3>
	            	<div class="container" style="width:1000px;">
	            	<c:forEach begin="1" end="${postContent.raitings}">
   					<img src="image/star.png" height="40px" width="40px" align="left"/>
					</c:forEach>
					<c:forEach begin="${postContent.raitings}" end="4">
   					<img src="image/emptyStar.png" height="40px" width="40px" align="left"/>
					</c:forEach>
	            	<h3 style="font-weight: bold; color: red;"><fmt:formatNumber value="${postContent.raitings}" pattern=".0"/></h3>
	            	</div>
	            	<span class="star-input">
						<span class="input">
					    	<input type="radio" name="star-input" value="1" id="p1">
					    	<label for="p1">1</label>
					    	<input type="radio" name="star-input" value="2" id="p2">
					    	<label for="p2">2</label>
					    	<input type="radio" name="star-input" value="3" id="p3">
					    	<label for="p3">3</label>
					    	<input type="radio" name="star-input" value="4" id="p4">
					    	<label for="p4">4</label>
					    	<input type="radio" name="star-input" value="5" id="p5">
					    	<label for="p5">5</label>
					  	</span>
						<output for="star-input">&nbsp;&nbsp;Score <b id="sscore" >0</b></output>
						<br>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
						<button type="button" class="btn btn-default-transparent btn-hvr hvr-sweep-to-right" id="ratingbutton" 
							onclick="putRating('${postContent.imgpath}','${tab}');">Rating</button>
					</span>
	            </div>
	            </div>
	  		</div>
	      </div>

	<footer class="panel-footer">
		<div class="container">
			<div class="row">
				<div class="col-md-5">
					<h4>Contact</h4>
					<address>
						Bruce YS Kim<br> <a href="mailto:fecan2012@gmail.com">fecan2012@gmail.com</a>
					</address>
				</div>
			</div>
			<div class="bottom-footer">
				<div class="col-md-5">
					<font color="black">Copyrights © 2016 Fecan Your Trip Inc.,
						All Rights Reserved.</font>
				</div>
				<div class="col-md-7">
					<ul class="footer-nav">
						<li><a href="afterlogin.do"><font color="black">Home</font></a></li>
						<li><a href="afterabout.do"><font color="black">About</font></a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>

	<div class="modal fade" id="mypage" tabindex="-1" role="dialog" aria-labelledby="findpass" aria-hidden="true">
			<p class="small">YourTrip</p>
			<div class="form-block center-block p-30 light-gray-bg border-clear">
				<h2 class="title text-left">Manage User Info</h2>
				<form class="form-horizontal text-left" action="userUpdate.do">
					<div class="form-group has-feedback">
						<label for="inputUserName" class="col-sm-3 control-label">Your ID</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="mem_id" id="inputUserName" readonly="true" value="<%=mDto.getUser_id()%>" required> 
							<i class="fa fa-user form-control-feedback"></i>
						</div>
					</div>
					<div class="form-group has-feedback">
						<label for="inputEmail" class="col-sm-3 control-label">Your E-mail</label>
						<div class="col-sm-8">
							<input type="email" class="form-control" name="email" id="inputEmail" placeholder="<%=mDto.getUser_email()%>" value="" required> 
							<i class="fa fa-envelope form-control-feedback"></i>
						</div>
					</div>
					<div class="form-group has-feedback">
						<label for="inputPassword" class="col-sm-3 control-label">Password<span class="text-danger small">*</span>
						</label>
						<div class="col-sm-8">
							<input type="password" class="form-control" name="mem_passwd" id="password" placeholder="Password" value="" required>
							<i class="fa fa-lock form-control-feedback"></i>
						</div>
					</div>
					<div class="form-group has-feedback">
						<label for="inputPassword" class="col-sm-3 control-label">RePassword<span class="text-danger small">*</span></label>
						<div class="col-sm-8">
							<input type="password" class="form-control" name="mem_repasswd" id="password" placeholder="Password" required> 
							<i class="fa fa-lock form-control-feedback"></i>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-3 col-sm-8" align="right">
							<button type="reset" class="btn btn-group btn-default" id="resetbtn">
								RESET
							</button>
							<button type="submit" class="btn btn-group btn-default btn-animated" id="submitbtn">
								SAVE<i class="fa fa-user"></i>
							</button>
						</div>
					</div>
				</form>
				<a href="#" id="tal">Deactivate Account</a>
				<div id="ss"></div>
			</div>
		</div>

	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/star.js"></script>
	<script>
		$(function() {
			$('#tal').click(function() {
				if (!confirm("Are You Sure?")) {
					return false;
				} else {
					var inputString = prompt('Enter Your Passwd', 'Pass Word');
					$.post('userDeletePro.do', {
						"passwd" : inputString
					}, function(args) {
						$('#ss').html(args)
					})
				}
			})
		});
	</script>
</body>
</html>