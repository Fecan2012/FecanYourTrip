<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="bean.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:if test="${check==1}">
	<script>
    	alert("Deleted!!")
	</script>
	<meta http-equiv="Refresh"  content="0;url=boardContent.do?pageNum=${pageNum}&num=${num}#br">
</c:if>  
<c:if test="${check!=1}">
	<script>
		alert("You can not delete board!")
		history.back() ;
	</script>
</c:if>