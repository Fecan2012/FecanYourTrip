<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:if test="${check==1}">
 <meta http-equiv="Refresh" content="0;url=board.do?pageNum=${pageNum}#br">
</c:if>
<c:if test="${check==0}">
  <script>
         alert("You do not have authority.\n Check Once Again!");
         history.go(-1);
  </script>
</c:if>