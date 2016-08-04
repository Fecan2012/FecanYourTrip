<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="bean.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:if test="${check==1}">
	<script>
		alert("Delete Success!")
	</script>
	<meta http-equiv="Refresh" content="0;url=schedule.do?pageNum=${pageNum}#sc">
</c:if>  
<c:if test="${check!=1}">
	<script>
		alert("Rack of Authority!")
		history.back() ;//history.go(-1)
	</script>
</c:if>