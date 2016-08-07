<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<c:if test="${delChk==true}">
	<script>
		alert("Good Bye!!")
	</script>
	<meta http-equiv="Refresh" content="0;url=index.do">
</c:if>
<c:if test="${delChk==false}">
	<script>
		alert("Failed!! Check Your Pass Word!")
		history.back(); 
	</script>
</c:if>