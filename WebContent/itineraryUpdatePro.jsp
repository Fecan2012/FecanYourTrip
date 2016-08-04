<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:if test="${check!=1}">
  <script>
         alert("Scheudle Updated!!");
  </script>
 <meta http-equiv="Refresh" content="0;url=scheduleContent.do?sid=${sid}&pageNum=${pageNum}">
</c:if>
<c:if test="${check==1}">
  <script>
         alert("No Change!!");
         history.go(-1);
  </script>
</c:if>