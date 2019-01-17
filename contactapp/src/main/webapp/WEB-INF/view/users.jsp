<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User List - Contact Application</title>
<s:url var="url_css" value="/static/css/style.css" />
<link href="${url_css}" rel="stylesheet" type="text/css" />
</head>
<s:url var="url_bg" value="/static/images/bg.jpg" />
<body background="${url_bg}">
	<table border="1" width="80%" align="center">
		<tr>
			<td height="100px"><jsp:include page="include/header.jsp" /></td>
		</tr>
		<tr>
			<td height="25px">
				<!-- Menu --> <jsp:include page="include/menu.jsp" /></td>
		</tr>
		<tr>
			<td height="350px" valign="top">
				<!-- Content -->
				<h1>Contact List</h1> <c:if test="${err!=null}">
					<p class="error">${err}</p>
				</c:if> <c:if test="${param.act eq 'sv'}">
					<p class="success">Your Save Contact Successfully!</p>
				</c:if> <c:if test="${param.act eq 'ed'}">
					<p class="success">Your Edit Contact Successfully!</p>
				</c:if> <c:if test="${param.act eq 'del'}">
					<p class="success">Your Delete Contact Successfully!</p>
				</c:if>

				<table border="1" cellpadding="3">
					<tr>
						<th>SR</th>
						<th>UID</th>
						<th>Name</th>
						<th>Phone</th>
						<th>Email</th>
						<th>Address</th>
						<th>Login Name</th>
						<th>Status</th>
					</tr>
					<c:forEach var="u" items="${userList}" varStatus="st">
						<tr>
							<td>${st.count}</td>
							<td>${u.userId}</td>
							<td>${u.name}</td>
							<td>${u.phone}</td>
							<td>${u.email}</td>
							<td>${u.address}</td>
							<td>${u.loginName}</td>
							<td><select id="id_${u.userId}">
									<option value="1">Active</option>
									<option value="2">Block</option>
							</select></td>
						</tr>
					</c:forEach>
				</table>
			</td>
		</tr>
		<tr>
			<td height="25px">
				<!-- Footer --> <jsp:include page="include/footer.jsp" /></td>
		</tr>
	</table>
</body>
</html>
