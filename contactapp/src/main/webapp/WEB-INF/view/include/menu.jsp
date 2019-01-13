<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>

<c:if test="${sessionScope.userId==null}">
	<a href="#">Home</a> | <a href="#">Login</a> | <a href="#">Register</a> | <a
		href="#">About</a> | <a href="#">Help</a>
	<p>${sessionScope.userId}</p>
</c:if>

<c:if test="${sessionScope.userId!=null && sessionScope.role == 1}">
	<a href="#">Home</a> | <a href="#">User List</a> | <a href="#">Logout</a>
</c:if>

<c:if test="${sessionScope.userId!=null && sessionScope.role == 2}">
	<a href="#">Home</a> | <a href="#">Add Contact</a> | <a href="#">Contact
		List</a> | <a href="#">Logout</a>
</c:if>