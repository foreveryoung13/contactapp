<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="${pageContext.request.contextPath}/webjars/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<s:url var="url_logout" value="/logout"></s:url>
	<ul class="nav nav-tabs">
		<c:if test="${sessionScope.userId==null}">
			<s:url var="url_reg_form" value="/reg_form" />
			<li><a href="#">Home</a></li>
			<li><a href="#">Login</a></li>
			<li><a href="${url_reg_form}">Register</a></li>
			<li><a href="#">About</a></li>
		</c:if>

		<c:if test="${sessionScope.userId!=null && sessionScope.role == 1}">
			<s:url var="url_ulist" value="/admin/users" />
			<s:url var="url_ahome" value="/admin/dashboard" />
			<li><a href="${url_ahome}">Home</a></li>
			<li><a href="${url_ulist}">User List</a></li>
			<li><a href="${url_logout}">Logout</a></li>
		</c:if>

		<c:if test="${sessionScope.userId!=null && sessionScope.role == 2}">
			<s:url var="url_uhome" value="/user/dashboard" />
			<s:url var="url_cform" value="/user/contact_form" />
			<s:url var="url_clist" value="/user/clist" />
			<li><a href="${url_uhome}">Home</a></li>
			<li><a href="${url_cform}">Add Contact</a></li>
			<li><a href="${url_clist}">Contact List</a></li>
			<li><a href="${url_logout}">Logout</a></li>
		</c:if>

	</ul>
</body>
</html>







