<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="bean.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<jsp:useBean id="md" class="bean.MemberDAO" />
<%
	String mem_id=(String)request.getAttribute("username");
	String mem_pw=(String)request.getAttribute("password");
	boolean chk=md.loginCheck(mem_id,mem_pw);
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Sign In Process</title>
	</head>
	<c:set var="check" scope="session" value="<%=chk%>" />
	<c:if test="${check==true}">
	<%
		session.setAttribute("mem_id",mem_id); 	
		request.setAttribute("mem_id", mem_id);
	%>
	<meta http-equiv="Refresh"  content="0;url=afterlogin.do">
	<script>alert("Welcome!!")</script>
	</c:if>
	<c:if test="${check==false}">
 	<script>
 		alert("Check your email and PW!!");
	</script>
	<meta http-equiv="Refresh" content="0;url=index.do">
    </c:if>
</html>