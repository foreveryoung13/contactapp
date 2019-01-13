
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Login - Contact Application</title>
<link href="static/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body background="static/images/bg.jpg">
	<table border="1" width="80%" align="center">
		<tr>
			<td height="100px"><jsp:include page="include/header.jsp" /></td>
		</tr>
		<tr>
			<td height="25px">
				<!-- Menu --> <jsp:include page="include/menu.jsp" /></td>
			</td>
		</tr>
		<tr>
			<td height="350px" valign="top">
				<!-- Content -->
				<h1>User Login</h1> 
				<s:url var="url_login" value="/login" /> 
				<f:form action="login" modelAttribute="command">
						<table border="1">
							<tr>
								<td>Username</td>
								<td><f:input path="loginName"/> </td>
							</tr>
							<tr>
								<td>Password</td>
								<td><f:input path="password" /> </td>
							</tr>
							<tr>
								<td colspan="2" align="right">
								<button>Login</button> 
								<a href=""> New User Registration</a> </td>
							</tr>
						</table>
				</f:form>
			</td>
		</tr>
		<tr>
			<td height="25px">
				<!-- Footer --> <jsp:include page="include/footer.jsp" /></td>
			</td>
		</tr>
	</table>
</body>
</html>
