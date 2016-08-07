<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="bean.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:if test="${check==1}">
	<script>
		alert("Success!!")
	</script>
	<meta http-equiv="Refresh" content="0;url=afterlogin.do">
</c:if>
<c:if test="${check!=1}">
	<script>
		alert("Fail!!")
		history.back(); 
	</script>
</c:if>