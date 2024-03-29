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
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/write.js"></script>
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
		<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
		<script>
			var signOut = function (usrid) {
				alert("Good Bye " + usrid + " !!");
				window.location.href = "index.do?sectl=1";
			};
			
			$(function(){
				var point = $('#toppoint').offset().top
				$(document).scrollTop(point)
				$('.form-control').focus(function(){
					if(!$('#repleUpdate'))
					$(this).val('')
				})
				$('.rereple').hide()
			})
			
			 var replecheck=function(){
				var reple2=$('#replex').val()
				if(reple2.length==0){
					alert('Enter Reply!!')
					return false;
				}
			 }
			 
			var replecheck2=function(i){
				var reple2=$('#reple'+i).val()
				if(reple2.length==0){
					alert('Enter Reply!!')
					return false;
				}
			 }
			 
			 var showreple=function(i){
				 $('.rereple').hide()
				 $('#repleid'+i).show()
			 }
			 
			 var repleupdate=function(i){
				 $('.rereple').hide()
				 $('#repleupdate'+i).show()
			 }
		</script>
	</head>
	<body>

	<nav class="navbar navbar-default navbar-static-top no-margin" role="navigation">
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
		
	<ul class="nav nav-tabs nav-justified" id="toppoint">
  		<li role="presentation"><a href="afterlogin.do#tr">Top Rating</a></li>
	  	<li role="presentation"><a href="aftershowall.do#sa">Show all Posts</a></li>
	  	<li role="presentation"><a href="schedule.do#sc">Scheduling</a></li>
	    <li role="presentation" class="active" id="br"><a href="#br" style="font-weight: bold; color:#0099cc;">Board</a></li>
	</ul>
	<br><br><br><br>

	<div class="page-header">
		<center><h1><span class="text-rotator text-default" data-rotator-animation-effect="tada"> Subject : </span> ${article.subject }</h1></center>
	</div>									

	<div class="col-md-8 col-md-push-2">
		<table border="1" class="table table-colored">
			<thead>
				<tr>
					<th id="arnum"><center>Num : ${article.num}</center></th>
					<th><center>Writer : ${article.userid}</center></th>
					<th><center>Date : ${article.regdate}</center></th>
					<th><center>Count : ${article.readcount}</center></th>
				</tr>
			</thead>	 
			<tr>									
				<td colspan="4" style="line-height:200%">
				<p>${article.content}</p></td>
    		</tr>
    	</table>
	<p align="right"><button type="button" class="btn btn-default-transparent btn-hvr hvr-sweep-to-right" onclick="location='board.do#br'" >
	  List
	</button>
	<c:if test="${grant==2}">
	<button type="button" class="btn btn-default-transparent btn-hvr hvr-sweep-to-right" data-toggle="modal" data-target="#updateModal"  >
	 Edit
	</button>
	<button type="button" class="btn btn-default-transparent btn-hvr hvr-sweep-to-right"  onclick="location='boardDeletePro.do?num=${article.num}&pageNum=${pageNum}&userid=<%=mem_id%>'" >
	 Delete
	</button>
		</c:if>
	</p>
	
	<c:if test="${pgList.count > 0}">
	<table border="0" class="table">
	<c:set var="number" value="${pgList.number}"/>
	  <c:forEach var="reple" items="${repleList}" varStatus="status">
		<tr>
			<td width="900">
			 	<c:if test="${reple.re_level > 0}">
					<c:forEach begin="0" end="${reple.re_level}">
					&nbsp;
					</c:forEach>	 		
					<i class="icon-level-down"></i>	  
			 	 </c:if>
				 <span class="comment-meta"><i class="fa fa-user"></i></span>
				 <span class="comment-meta"> ${reple.userid}</span>
				 <span class="comment-meta">${reple.regdate}</span>
			</td>
		
			<td width="200">
				<span class="col-md-3"><a href="repleDeletePro.do?userid=<%=mem_id %>&articleNum=${reple.num}&repleNum=${reple.repleNum}&pageNum=${pageNum}">
				<i class="fa fa-trash" id="trash"></i></a></span>
				<span class="col-md-3"><a href="javascript:repleupdate(${status.count})"><i class="fa fa-cogs" id="cogs"></i></a></span>
				<span class="col-md-3"><a href="javascript:showreple(${status.count})"><i class="fa fa-commenting" id="comment"></i></a></span>
			</td>
		</tr>
		<tr>
			<td>
			<c:if test="${reple.re_level > 0}">
			<c:forEach begin="0" end="${reple.re_level}">
			&nbsp;
			</c:forEach>	 
		 	 </c:if>
			${reple.repleContent}
			</td>
			<td></td>
		</tr>
		<tr>
			<td colspan="2">
				<div class="rereple" id="repleid${status.count}">
					<form method="post" name="replewriteform" action="repleWritePro.do">
						<input type="hidden" name="re_num" value="${reple.re_num}">
						<input type="hidden" name="replenum" value="${reple.repleNum}">
			  			<input type="hidden" name="re_step" value="${reple.re_step }">
			  			<input type="hidden" name="pagenum" value="${pageNum}">
			  			<input type="hidden" name="userid" value="<%=mem_id%>">
			  			<input type="hidden" name="re_level" value="${reple.re_level }">
			  			<input type="hidden" name="articlenum" value="${article.num}">
						<textarea class="form-control" rows="5" id="reple${status.count}" name="replecontent"></textarea> 
						<p align="right">
						<button type="button" class="btn btn-default-transparent btn-hvr hvr-sweep-to-right" id="replebutton" 
							onclick="replecheck2(${status.count});submit()">Reply</button>
			 			</p>
			 		</form>
				</div>
				<div class="rereple" id="repleupdate${status.count}">
					<form method="post"  action="repleUpdatePro.do">
						<input type="hidden" name="re_num" value="${reple.re_num}">
						<input type="hidden" name="replenum" value="${reple.repleNum}">
					  	<input type="hidden" name="re_step" value="${reple.re_step }">
					  	<input type="hidden" name="pagenum" value="${pageNum}">
					  	<input type="hidden" name="userid" value="<%=mem_id%>">
					  	<input type="hidden" name="re_level" value="${reple.re_level }">
					  	<input type="hidden" name="articlenum" value="${article.num}">
						<textarea class="form-control" rows="5" id="repleUpdate" name="replecontent">${reple.repleContent }</textarea> 
						<p align="right">
						<button type="button" class="btn btn-default-transparent btn-hvr hvr-sweep-to-right" id="replebutton"
							onclick="repleupdate(${status.count});submit()">SAVE</button>
					 	</p>
					 </form>
				</div>
			</td>
		</tr>
		</c:forEach>
	</table>
	</c:if>
	<form method="post" name="replewriteform" action="repleWritePro.do">
		<input type="hidden" name="re_num" value="0">
		<input type="hidden" name="replenum" value="0">
	  	<input type="hidden" name="re_step" value="0">
	  	<input type="hidden" name="pagenum" value="${pageNum}">
	  	<input type="hidden" name="userid" value="<%=mem_id%>">
	  	<input type="hidden" name="re_level" value="0">
	  	<input type="hidden" name="articlenum" value="${article.num}">
		<textarea class="form-control" rows="5" id="replex" name="replecontent"></textarea> 
		<p align="right">
		<button type="button" class="btn btn-default-transparent btn-hvr hvr-sweep-to-right" id="replebutton"
			onclick="replecheck();submit()">Reply</button></p>
	 </form>
  </div>

	<form method="post" name="updateform" id="updateform" action="boardUpdatePro.do?num=${article.num}&pageNum=${pageNum}&userid=<%=mem_id%>">
		<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
			<h4 class="modal-title" id="myModalLabel">Edit Post</h4>
		      </div>
		      <div class="modal-body">
	            <div class="control-group">
	              <label class="control-label" for="username"><h4>subject</h4></label>
	              <div class="controls">
	                <input type="text" id="subject" name="subject" placeholder="" class="form-control input-lg" value="${article.subject}">
	              </div>
	            </div>
	            <div class="control-group">
	            <label for="message-text" class="control-label"><h4>content</h4></label>
	            <textarea class="form-control" id="content" name="content" rows="10" >${article.content}</textarea>
	            </div>
		      </div>
		      <div class="modal-footer">
			<button type="button" class="btn btn-default-transparent btn-hvr hvr-sweep-to-right" data-dismiss="modal">Cancel</button>
			<button type="button" class="btn btn-default-transparent btn-hvr hvr-sweep-to-right" onclick="writeUpdate()">Save</button>
		      </div>
		    </div>
		  </div>
		</div>
	</form>

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
					<li><a href="#fetop"><font color="black">Home</font></a></li>
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
							<input type="email" class="form-control" name="email" id="inputEmail" placeholder="<%=mem_email%>" value="" required> value="" required> 
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
	<script src="js/script.min.js"></script>
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