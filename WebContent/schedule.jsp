<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="bean.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<jsp:useBean id="sd" class="bean.ScheduleDAO" />
<jsp:useBean id="md" class="bean.MemberDAO" />
<%
	String mem_id = (String) session.getAttribute("mem_id");
	String mem_email = "";
	int scCnt = 0;
	if (mem_id == null){
		response.sendRedirect("index.do");
	} else {
		String grade = request.getParameter("grade");
		MemberDTO mDto = md.getMember(mem_id);
		mem_email = mDto.getUser_email();
		session.setAttribute("grade", grade);
		session.setAttribute("mem_id",mem_id); 	
		request.setAttribute("mem_id", mem_id);
		scCnt = sd.getScheduleCountById(mem_id);
	}
%>
<html>
	<head>
		<meta charset="utf-8">
		<title>Fecan Your Trip</title>	
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/write.js">writeSchedule()</script>
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
		<link href="css/image-picker.css" rel="stylesheet">
		<link href="jquery-ui/jquery-ui.css" rel="stylesheet" type="text/css">
		<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
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
			<div class="navbar-header">
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
					<li><a href="afterlogin.do">Home</a></li>
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
					</a> <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next"> 
					<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
		</div>
	
		<ul class="nav nav-tabs nav-justified">
			<li role="presentation"><a href="afterlogin.do#tr">Top Rating</a></li>
			<li role="presentation"><a href="aftershowall.do#sa">Show all Posts</a></li>
			<li role="presentation" class="active" id="sc"><a href="schedule.do#sc" style="font-weight: bold; color:#0099cc;">Scheduling</a></li>
			<li role="presentation"><a href="board.do#br">Board</a></li>
		</ul>
		<c:if test="${grant==2}">
		<div align="right"><a href="#scheduler" class="btn btn-warning btn-lg" data-toggle="modal">New Schedule</a>&nbsp;&nbsp;</div>
		</c:if>
		<c:set var="scnt" scope="session" value="<%=scCnt%>" />
		<c:if test="${scnt == 0}">
	      	<center><h3>No Contents</h3></center>
		</c:if>
		<c:if test="${scnt > 0}">
		<c:set var="number" value="${pgList.number}"/>
		<div class="container">
			<div class="row">
				<div class="main col-md-12">
					<div class="row">
					<c:forEach var="schedule" items="${scheduleList}">
						<div class="col-md-4 col-sm-6">
							<div class="ph-20 feature-box text-center object-non-visible animated object-visible fadeInDownSmall" data-animation-effect="fadeInDownSmall" data-effect-delay="100">
								<h3>${schedule.title}</h3><br>
								<a href="javascript:chkModal('${schedule.title}','${schedule.startdate}','${schedule.enddate}','${schedule.descrip}');"
								     id= "scheduleShort" data-toggle="modal">
								<img src="${schedule.imgpath}" height="200px" width="330px" ></a><br>
								<a href="scheduleDeletePro.do?sid=${schedule.sid}&pageNum=${pgList.currentPage}&userid=<%=mem_id%>" class="text-danger btn-sm-link"><b>Delete</b><i class="fa fa-times pl-10"></i></a>
								<div class="separator clearfix"></div>
								<p class="text-muted">
									<font color="blue"><fmt:formatDate pattern="yyyy-MM-dd" value="${schedule.regdate}" /></font>
								</p>
								<a href="scheduleContent.do?sid=${schedule.sid}&pageNum=${pgList.currentPage}#sc">Go To Schedule<i class="pl-5 fa fa-angle-double-right"></i></a>
							</div>
						</div>
					</c:forEach>
					</div>
				</div>
			</div>
			<div class="col-md-10 col-md-push-1">
				<center>
			  	<c:if test="${pgList.startPage > pgList.blockSize}">
			   		<a href="schedule.do?pageNum=${pgList.startPage-pgList.blockSize}">Prev</a>
				</c:if>
				<c:forEach var="i" begin="${pgList.startPage}"  end="${pgList.endPage}">
			   	<a href="schedule.do?pageNum=${i}">
			      <c:if test="${pgList.currentPage == i}">
			                   <B>[${i}]</B></c:if>
			      <c:if test="${pgList.currentPage != i}">
			                   [${i}]</c:if>            
			     </a>
				</c:forEach>
				<c:if test="${pgList.endPage < pgList.pageCount}">
				   <a href="schedule.do?pageNum=${pgList.startPage+pgList.blockSize}">
				      Next</a>
				</c:if><br></br>
				</center>
			</div>
		</div>
	   </c:if>
	
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
						<font color="black">Copyrights © 2016 Fecan Your Trip Inc., All Rights Reserved.</font>
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
	
		<form method="post" name="scheduleForm" id="scheduleForm" action="scheduleInsertPro.do">
			<input type="hidden" name="userid" value="<%=mem_id %>">
			<div class="modal fade" id="scheduler" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" style="width:55%;">
					<div class="modal-content" >
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span><span class="sr-only">Close</span>
							</button>
							<h4 align="center" class="modal-title" id="myModalLabel">Create the Itinerary</h4>
						</div>
						<div class="modal-body">
							<div><label for="inputName" class="col-sm-3 control-label" style="width:210px; vertical-align: bottom">The name of the itinerary <span class="text-danger small">*</span>
								</label>&nbsp;
								<input type="text" class="form-control" id="inputName" name="inputName" maxlength="30" placeholder="Enter title in in 30 characters" required style="width:250px"> 
								<i class="fa fa-pencil form-control-feedback"></i>
							</div>
							<br>
							<div>
								<label for="datePickerStart" class="col-sm-3 control-label">Start Date <span class="text-danger small">*</span></label>&nbsp;&nbsp;
								<input type="text" id="datePickerStart" name="datePickerStart" class="btn btn-default-transparent" value="" placeholder="Choose the Date">
							</div>
							<div>
								<label for="datePickerEnd" class="col-sm-3 control-label">End Date <span class="text-danger small">*</span></label>&nbsp;&nbsp;
								<input type="text" id="datePickerEnd" name="datePickerEnd" class="btn btn-default-transparent" value="" placeholder="Choose the Date">
							</div>
							<div>
								  <span style="padding-left:15px;"></span><label for="imgpath" class="control-label">Place<span class="text-danger small"> *</span></label>
								  <span style="padding-left:149px;"></span>
								  <select id="imgpath" name="imgpath" class="image-picker show-html control-label">
								  <option data-img-src="image/hanliver.jpg" value="image/hanliver.jpg">Han River</option>
								  <option data-img-src="image/palace.jpg" value="image/palace.jpg">Korean Palace</option>
								  <option data-img-src="image/newyork.jpg" value="image/newyork.jpg">New York</option>
								  <option data-img-src="image/london.jpg" value="image/london.jpg">London</option>
								  <option data-img-src="image/pusan.jpg" value="image/pusan.jpg">Busan</option>
								  <option data-img-src="image/paris.jpg" value="image/paris.jpg">Paris</option>
								  <option data-img-src="image/jeju.jpg" value="image/jeju.jpg">Jejudo</option>
								  <option data-img-src="image/van.jpg" value="image/van.jpg">Vancouver</option>
								</select>
							</div>
							<div>
								<label for="inputName" class="col-sm-3 control-label" style="width:220px;">Description of The Schedule</label>
								
								<input type="text" class="form-control" id="inputDesc" name="inputDesc" placeholder="Comment on Your Trip" required style="width:500px;"> 
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default-transparent btn-hvr hvr-sweep-to-right" onclick="writeSchedule();">Start!</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	
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
		
		<div class="modal fade" id="scheduleThumb" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	    	<div class="modal-dialog">
	      		<div class="modal-content">
	        		<div class="modal-header">
	   					 <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
	   					 <center><h4 class="modal-title" id="ScheduleModalLabel"></h4></center>
	        		</div>
	        		<div class="modal-body">
		        		<p>
		        		From: <font id="stDate" style="color:red;"></font>&nbsp; To: <font id="edDate" style="color:red;"></font>
		        		<pre id="itiThumb">
		        		</pre>
	        		</div>
	      		</div>
	    	</div>
	  	</div>
	  	
		<script src="js/jquery.js" type="text/javascript"></script>
	  	<script src="jquery-ui/jquery-ui.js" type="text/javascript"></script>
		<script src="js/image-picker.js" type="text/javascript"></script>
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
		
			$(function() {
			    $( "input[id^='datePicker']" ).datepicker({
			    });
			});
		
			$(function(){
				$("select").imagepicker({
					hide_select : false,
			        show_label  : false
				});
			});
		
			var chkModal = function (tt,sd,ed,de) {
				$(".modal-header #ScheduleModalLabel").text(tt);
				$(".modal-body #stDate").text(sd);
				$(".modal-body #edDate").text(ed);
				$(".modal-body #itiThumb").text(de);
				$("#scheduleThumb").modal("show");
			};
		</script>
	</body>
</html>