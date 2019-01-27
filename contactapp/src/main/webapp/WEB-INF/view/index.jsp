<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/webjars/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">

<title>User Login - Contact Application</title>
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
				<h1>User Login</h1> 
				<c:if test="${err!=null}">
					<p class="error">${err}</p>
				</c:if> 
				<c:if test="${param.act eq 'lo'}">
					<p class="success">Logout Successfully!</p>
				</c:if> 
				<c:if test="${param.act eq 'log'}">
					<p class="error">Your not log in, login first please!</p>
				</c:if>
				<c:if test="${param.act eq 'reg'}">
					<p class="success">User Registered Successfully. Please Login !</p>
				</c:if>  
				
				<c:choose>
				  <c:when test="${sessionScope.userId!=null && sessionScope.role == 1}">
				    <c:redirect url="/user/dashboard"/>
				  </c:when>
				  <c:when test="${sessionScope.userId!=null && sessionScope.role == 2}">
				    <c:redirect url="/user/clist"/>
				  </c:when>
				  <c:otherwise>
				    
				  </c:otherwise>
				</c:choose>
				
				<s:url var="url_login" value="/login" /> <f:form action="login"
					modelAttribute="command">
					<table border="1">
						<tr>
							<td>Username</td>
							<td><f:input path="loginName" /></td>
						</tr>
						<tr>
							<td>Password</td>
							<td><f:password path="password" /></td>
						</tr>
						<tr>
							<td colspan="2" align="right">
								<s:url var="url_reg_form" value="/reg_form" />
								<button class="btn btn-primary">Login</button> <a href="${url_reg_form}"> New User Registration</a>
							</td>
						</tr>
					</table>
				</f:form>
			</td>
		</tr>
		<tr>
			<td height="25px">
				<!-- Footer --> <jsp:include page="include/footer.jsp" /></td>
		</tr>
	</table>
</body>
</html>
