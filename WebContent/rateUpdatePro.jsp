<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String mem_id = (String) session.getAttribute("mem_id");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Raiting</title>
<script>
	alert('Update')
</script>
</head>
<body>
	<c:choose>
		<c:when test="${mem_id!=null}">
			<meta http-equiv="Refresh" content="0;url=detail.do?imgPath=${postContent.imgpath}&tab=${tab}#toppoint">
		</c:when>
		<c:otherwise>
			<meta http-equiv="Refresh" content="0;url=predetail.do?imgPath=${postContent.imgpath}&tab=${tab}#toppoint">
		</c:otherwise>
	</c:choose>
</body>
</html>