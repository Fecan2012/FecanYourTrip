<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="bean.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<jsp:useBean id="md" class="bean.MemberDAO" />
<%
	String mem_id = (String) session.getAttribute("mem_id");
	String mem_email = "";
	if (mem_id == null){
		response.sendRedirect("index.do");
	} else {
		String grade = request.getParameter("grade");
		MemberDTO mDto = md.getMember(mem_id);
		mem_email = mDto.getUser_email();
		session.setAttribute("grade", grade);
		session.setAttribute("mem_id",mem_id); 	
	}
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
		<link href="css/style.css" rel="stylesheet" >
		<link href="css/style2.css" rel="stylesheet" >
		<link href="css/skins/light_blue.css" rel="stylesheet">
		<link href="css/custom.css" rel="stylesheet">
		<script>
			var signOut = function (usrid) {
				alert("Good Bye " + usrid + " !!");
				window.location.href = "index.do?sectl=1";
			};
		</script>
	</head>
	<body>
	<nav class="navbar navbar-default navbar-static-top no-margin" role="navigation" id="fetop">
		<div class="container-fluid">
			<div class="navbar-header ">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-LG-navbar-collapse-1" aria-expanded="false">
		        	<span class="sr-only">Toggle navigation</span>  
		        	<span class="icon-bar"></span>
		        	<span class="icon-bar"></span>
		        	<span class="icon-bar"></span>
	      		</button>  
	      		<div class="page-header no-margin no-padding">
	      			<a class="navbar-brand" href="afterlogin.do"><img src="image/logo.png"></a>    		
	      		</div>	      		
			</div>			
		<div class="collapse navbar-collapse navbar-right " id="bs-LG-navbar-collapse-1">
			<ul class="nav navbar-nav nav-tabs">
				<li><a href="#fetop">Home</a></li>
				<li><a href="afterabout.do">About</a></li>
				<li><a href="#mypage" role="button" data-toggle="modal">Manage</a></li>
				<li><a href="javascript:signOut('<%=mem_id%>');">Sign Out</a></li>
			</ul>
		</div>
		</div>
	</nav>
	
	<div class="jumbotron">
		<div class="container">
			<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
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
      			 	<div class="carousel-caption">
      				</div>
    		</div>
    		<div class="item">
     		 	<img src="image/slide2.jpg" alt="s2">
      			<div class="carousel-caption">
      			</div>
    		</div>
    		<div class="item">
     		 	<img src="image/slide3.jpg" alt="s3">
      			<div class="carousel-caption">
      			</div>
    		</div>
    		<div class="item">
     		 	<img src="image/slide4.jpg" alt="s4">
      			<div class="carousel-caption">
      			</div>
    		</div>
    		<div class="item">
     		 	<img src="image/slide5.jpg" alt="s5">
      			<div class="carousel-caption">
      			</div>
    		</div>
  		</div>

  		<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    		<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    		<span class="sr-only">Previous</span>
 		 </a>
  		<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
   		 <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    		<span class="sr-only">Next</span>
  		</a>
			</div>
		</div>
	</div>

	<ul class="nav nav-tabs nav-justified">
	  	<li role="presentation"><a href="afterlogin.do#tr">Top Rating</a></li>
	  	<li role="presentation" class="active" id="sa"><a href="#sa" style="font-weight: bold; color:#0099cc;">Show all Posts</a></li>
	  	<li role="presentation"><a href="schedule.do#sc">Scheduling</a></li>
	    <li role="presentation"><a href="board.do#br">Board</a></li>
	</ul>
	<div class="row" >
  		<div class="col-xs-6 col-md-3">
    		<a href="detail.do?imgPath=image/hanliver.jpg&tab=showall#toppoint" class="thumbnail" style="border: 0px solid;">
      			<img src="image/hanliver.jpg" alt="han">
    		</a>
    		<a href="detail.do?imgPath=image/palace.jpg&tab=showall#toppoint" class="thumbnail" style="border: 0px solid;">
      			<img src="image/palace.jpg" alt="pal">
    		</a>
      </div>
      <div class="col-xs-6 col-md-3">
        <a href="detail.do?imgPath=image/pusan.jpg&tab=showall#toppoint" class="thumbnail" style="border: 0px solid;">
            <img src="image/pusan.jpg" alt="new">
        </a>
        <a href="detail.do?imgPath=image/paris.jpg&tab=showall#toppoint" class="thumbnail" style="border: 0px solid;">
            <img src="image/paris.jpg" alt="london">
        </a>
  	 </div>
  	 <div class="col-xs-6 col-md-3">
        <a href="detail.do?imgPath=image/newyork.jpg&tab=showall#toppoint" class="thumbnail" style="border: 0px solid;">
            <img src="image/newyork.jpg" alt="new">
        </a>
        <a href="detail.do?imgPath=image/london.jpg&tab=showall#toppoint" class="thumbnail" style="border: 0px solid;">
            <img src="image/london.jpg" alt="london">
        </a>
  	 </div>
  	 <div class="col-xs-6 col-md-3">
        <a href="detail.do?imgPath=image/van.jpg&tab=showall#toppoint" class="thumbnail" style="border: 0px solid;">
            <img src="image/van.jpg" alt="new">
        </a>
        <a href="detail.do?imgPath=image/jeju.jpg&tab=showall#toppoint" class="thumbnail" style="border: 0px solid;">
            <img src="image/jeju.jpg" alt="london">
        </a>
  	 </div>
	</div>

<!-- footer-->
	<footer class="panel-footer">
		<div class="container">
			<div class="row">
			<div class="col-md-5">
				<h4>Contact</h4>
				<address>
					Bruce YS Kim<br>
					<a href="mailto:fecan2012@gmail.com">fecan2012@gmail.com</a>
				</address>
			</div>
			</div>
			<div class="bottom-footer">
				<div class="col-md-5"><font color="black">Copyrights © 2016 Fecan Your Trip Inc., All Rights Reserved.</font></div>
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
							<input type="text" class="form-control" name="mem_id" id="inputUserName" readonly="true" value="<%=mem_id%>" required> 
							<i class="fa fa-user form-control-feedback"></i>
						</div>
					</div>
					<div class="form-group has-feedback">
						<label for="inputEmail" class="col-sm-3 control-label">Your E-mail</label>
						<div class="col-sm-8">
							<input type="email" class="form-control" name="email" id="inputEmail" placeholder="<%=mem_email%>" value="" required> 
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