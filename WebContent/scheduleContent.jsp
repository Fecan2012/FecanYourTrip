<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="bean.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="md" class="bean.MemberDAO" />
<%
	String mem_id = (String)session.getAttribute("mem_id");
	session.setAttribute("mem_id",mem_id); 	
	MemberDTO mDto = md.getMember(mem_id);
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
		<script src="script.js" language="JavaScript" ></script>	
		<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
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
				<li><a href="index.do">Sign Out</a></li>
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
		
		<div style="margin-left:25px; margin-right:25px;">
  			<br>
  			<div class = "row">
  				<div class="col-md-6">
  					<center>
	  				<span style="font-size: 35px; font-weight: bold; color:#0099cc;">${schedule.title}</span>
	  				<br><br>
	  				<span style="font-weight: bold; color:red;">Date Created: <fmt:formatDate pattern="yyyy-MM-dd" value="${schedule.regdate}" /></span>
	  				<br><br>
	  				<img id="defaultPla" src="${schedule.imgpath}" height="220px" width="363px" >
	  				<br>
	  				<span style="font-size: 30px; font-weight: bold;">Recommend places</span>
	  				<br><br>
	  				<c:set var="placesArray" value="${post.itinerary}"/>
					<c:set var="places" value="${fn:split(placesArray, ',')}" />
					<c:set var="pLength" value="${fn:length(places)}"/>
	  				<p class="text-primary">
	  					<c:forEach var="place" items="${places}" varStatus="loop">
	            			<a href="javascript:rdPla('${place}');">${place}</a><c:if test="${loop.count != pLength}">,
	            			</c:if>
	            		</c:forEach>
	            	</p>
	  				</center>
  				</div>
  				<div class="col-md-6">
  					<div class="embed-responsive embed-responsive-16by9" id= "map-canvas"></div><br>
				    <p align="right"><span id="recoPlace" style="font-size: 25px; font-weight: bold; padding-right: 35px;"></span>
				    <button type="button" class="btn btn-default-transparent btn-hvr hvr-sweep-to-right" onclick="javascript:searchBox();">Search</button>&nbsp;&nbsp;
				    <button type="button" class="btn btn-default-transparent btn-hvr hvr-sweep-to-right" onclick="javascript:addIti();">Add</button></p>
  				</div>
  			</div>
  		</div>
		<hr>
		
	<div class="list-group" style="margin-left:45px; margin-right:45px;">
		 <h3 style="color:#0099cc;">Itinerary</h3>
		 <ul class="nav nav-pills">
		 <c:set var="daysNum" scope="session" value="${schedule.days}"/>
		 <c:forEach var="i" begin="1" end="${daysNum}">
		 <c:set var="itID" scope="session" value="#itDay${i}"/>
		 <c:choose>
		 	<c:when test="${i == 1}">
		 		<li class="active"><a data-toggle="pill" href="${itID}">Day ${i}</a></li>
		 	</c:when>
		 	<c:otherwise>
		 		<li><a data-toggle="pill" href="${itID}">Day ${i}</a></li>
		 	</c:otherwise>
		 </c:choose>
		 </c:forEach>
		 </ul>
		  <div class="tab-content">
		  <c:forEach var="i" begin="1" end="${daysNum}">
		  	<c:set var="itTab" scope="session" value="itDay${i}"/>
		  	<c:set var="daySpan" scope="session" value="itiPlace${i}"/>
		  	<c:set var="itDel" scope="session" value="delIt${i}"/>
		    <div id="${itTab}" style="clear: both;" class="tab-pane fade in active">
		      <h4 style="color:#0099cc;">Day ${i}</h4>
		      <div style="float:left;">
			      <c:set var="dayStr" scope="session" value="${itHash[i].place}"/>
			      <c:if test="${fn:length(dayStr) gt 0}">
			      <c:set var="eachStr" value="${fn:split(dayStr, '|')}" />
			      <c:forEach var="ei" items="${eachStr}" varStatus="loop">
			      	 <c:set var="itSpan" scope="session" value="${daySpan}${loop.count}"/>
				     <span style="display:inline-block;" id="${itSpan}"><b>${ei}</b> | <br><center><a href="javascript:itinDel('${itSpan}');" style="color:red;">delete</a></center></span>
			      </c:forEach>
			      </c:if>
		      </div>
		      <c:if test="${fn:length(dayStr) gt 0}">
		      <br><br>
		      </c:if>
		    </div>
		  </c:forEach>
		  </div>
		  <div align="right"><a href="javascript:itiUpdate('${daysNum}','${schedule.sid}','${pageNum}');" class="btn btn-warning btn-lg">Save Schedule</a></div>
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
		<script src="js/jquery.js" type="text/javascript"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="https://maps.googleapis.com/maps/api/js?sensor=false&key=AIzaSyA-MwD0vQIJ93gSYen-lnN6JA7B5UOnNI4&v=3.exp&libraries=places"></script>
		<script>
			<c:set var="defalutImgPath" value="${schedule.imgpath}"/>
			var dePlace = '<c:out value="${defalutImgPath}"/>';	
		
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
			
			$( window ).ready(function() {
				$("[id^=itDay]").css({"display":"none"});
    			$("#itDay1").css({"display":"inline"});
			});
			
			$('.nav-pills > li > a').click( function() {
				// $("[id^=itDay]").css({"display":"none"});
				var chkD = $(this).text();
				var day = chkD.charAt(4);
				var divId = "#itDay" + day;
				$("[id^=itDay]").css({"display":"none"});
				$(divId).css({"display":"inline"});
			} );
			
			var rdPla = function (rp) {
				$("#recoPlace").text(rp);
			};
			
			var addIti = function () {
				var chkID = $('.nav-pills .active').text();
				var day = chkID.charAt(4);
				var itPla = document.getElementById('recoPlace').innerHTML;
				if (itPla != "") {
					var divId = "itDay" + day;
					var spanId = "itiPlace" +day;
					var appnPla = $("#" + divId + " > div >  span > b");
					var compNum = 0;
					for (i = 0; i < appnPla.length; i++) {
						var compIti = appnPla[i].innerHTML;
						compIti = compIti.trim();
						itPla = itPla.trim();
						if (itPla == compIti) {
							alert("You already put this place to your schedule!");
							return false;
						} else {
							compNum = compNum + 1;
						}
					}
					if (compNum == appnPla.length) {
						var appTag =  "<span style=\"display:inline-block;\" id=" + (spanId+(compNum+1)) + "><b>" + itPla +
						"</b> | <br><center><a href= \"javascript:itinDel('" + (spanId+(compNum+1)) + "');\" style=\"color:red;\">delete</a></center></span>";
						$( "#" + divId + " > div" ).append(appTag);
					} 
				} else{
					alert ("You should choose place first!!");
					return false;
				}
			}
			
			var itinDel = function (deIt) {
				deIt = "#" + deIt
				$(deIt).remove();
			}
			
			var itiUpdate=function(dlen, sid, pg){
				var emptyLen = 0;
				var dayList = "";
				for (i = 1; i <= dlen; i++) {
					var divId = "itDay" + i;
					var bList = "";
					var itiStr = $("#" + divId + " > div >  span");
					if(itiStr.length == 0) {
						emptyLen = emptyLen + 1;
					} else {
						var appnPla = $("#" + divId + " > div >  span > b");
						for (j = 0; j < appnPla.length; j++) {
							var compIti = appnPla[j].innerHTML;
							compIti = compIti.trim();
							bList = bList + compIti + ' | ';
						}
						bList = bList.slice(0,-1);
					}
					dayList = dayList + i + '/' + bList + ','
				}
				if (dayList.length > 0) {
					dayList = dayList.slice(0,-1);
				}
				if (emptyLen == dlen) {
					alert("Set at least one day schedule!");
					return false;
				}
				var strPath = "itineraryUpdatePro.do?daylen=" + dlen + "&daylist=" + dayList + "&sid=" + sid + "&pageNum=" + pg;
				location.href = strPath;
			 }
			
			var searchBox = function () {
				var input = document.getElementById('recoPlace').innerHTML;
				var map = new google.maps.Map(document.getElementById('map-canvas'), {
		            	zoom: 15
		            	});
				var geocoder = new google.maps.Geocoder();
		            
				geocoder.geocode( { 'address' : input }, function( results, status ) {
					if( status == google.maps.GeocoderStatus.OK ) {
						map.setCenter( results[0].geometry.location );
						var marker = new google.maps.Marker( {
							map     : map,
							position: results[0].geometry.location
							} );
		                } else {
		                    alert("Can not find!");
		                    init();
		                }
		            } );
			};
			
			function init() {
				var x = latPlace(dePlace);
				var y = lngPlace(dePlace);
				var map = new google.maps.Map(document.getElementById('map-canvas'), {
					center: { 
						lat: x,
						lng: y
						},
						zoom: 12
						});
				}
			
			function latPlace(pla) {
				var lat;
				switch (pla) {
					case "image/hanliver.jpg":
				        lat = 37.52857;
				        break;
				    case "image/palace.jpg":
				        lat = 37.57584;
				        break;
				    case "image/newyork.jpg":
				        lat = 40.71278;
				        break;
				    case "image/london.jpg":
				        lat = 51.50735;
				        break;
				    case "image/pusan.jpg":
				        lat = 35.17955;
				        break;
				    case "image/paris.jpg":
				        lat = 48.85661;
				        break;
				    case "image/jeju.jpg":
				        lat = 33.49962;
				        break;
				    case "image/van.jpg":
				        lat = 45.63873;
				        break;
				}
				return lat;
			}
			
			function lngPlace(pla) {
				var lng;
				switch (pla) {
					case "image/hanliver.jpg":
						lng = 126.92897;
				        break;
				    case "image/palace.jpg":
				    	lng = 126.97358;
				        break;
				    case "image/newyork.jpg":
				    	lng = -74.00594;
				        break;
				    case "image/london.jpg":
				    	lng = -0.12776;
				        break;
				    case "image/pusan.jpg":
				    	lng = 129.07564;
				        break;
				    case "image/paris.jpg":
				    	lng = 2.35222;
				        break;
				    case "image/jeju.jpg":
				    	lng = 126.53119;
				        break;
				    case "image/van.jpg":
				    	lng = -122.66149;
				        break;
				}
				return lng;
			}
			google.maps.event.addDomListener(window, 'load', init());
		</script>
	</body>
</html>