<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="bean.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="mem"   class="bean.MemberDTO" />
<jsp:setProperty name="mem" property="*" />
<jsp:useBean id="md" class="bean.MemberDAO" />
<%
  boolean chk=md.memberInsert(mem);
  String mem_id = mem.getUser_id();
  if (chk) {
	  session.setAttribute("mem_id", mem_id);
  }
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">	
		<title>Fecan Your Trip</title>	
	</head>
	<c:set var="flag" scope="session" value="<%=chk%>" />
	<c:if test="${flag==true}">
		<script>
			alert("Succeed!")
		</script>
		<meta http-equiv="Refresh" content="0;url=afterlogin.do">
	</c:if>
	<c:if test="${flag==false}">
		<script>
			alert("Try again!");
			history.go(-1);//history.back();
		</script>
	</c:if>
</html>