<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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