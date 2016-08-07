<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:if test="${pwMatch==true}">
<c:set var="passwd" value="${passWd}"/>
	<script>
		alert("Your Password is: " + <c:out value='${passwd}'/>);
		history.go(-1);
	</script>
</c:if>
<c:if test="${pwMatch==false}">
  <script>
         alert("There is a problem!");
  </script>
  <meta http-equiv="Refresh" content="0;url=index.do">
</c:if>