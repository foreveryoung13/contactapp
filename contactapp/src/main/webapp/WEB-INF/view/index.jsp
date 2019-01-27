<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Bootstrap Configuration -->
<link
	href="${pageContext.request.contextPath}/webjars/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">

<title>User Login - Contact Application</title>
<s:url var="url_css" value="/static/css/style.css" />
<link href="${url_css}" rel="stylesheet" type="text/css" />
</head>
<s:url var="url_bg" value="" />
<body background="${url_bg}">

	<div class="container">
		<div style="height: 100px">
			<jsp:include page="include/header.jsp" />
		</div>

		<div style="height: 25px; margin-bottom: 55px; margin-top: -30px;">
			<jsp:include page="include/menu.jsp" />
		</div>

		<div style="height: 350px;">
			<div class="col-6 offset-3 align-self-center">
				<div class="card">
					<div class="panel panel-info">
						<div class="panel-heading">
							<h2 class="panel-title">Login</h2>
						</div>

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
							<p class="success">User Registered Successfully. Please Login
								!</p>
						</c:if>
						<c:choose>
							<c:when
								test="${sessionScope.userId!=null && sessionScope.role == 1}">
								<c:redirect url="/user/dashboard" />
							</c:when>
							<c:when
								test="${sessionScope.userId!=null && sessionScope.role == 2}">
								<c:redirect url="/user/clist" />
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>

						<s:url var="url_login" value="/login" />
						<f:form action="login" modelAttribute="command">
							<div class="form-group">
								<label for="Username" style="font-size: 12px;">User Name</label>
								<f:input path="loginName" class="form-control"
									placeholder="Username" name="username" autocomplete="off" />
							</div>
							<div class="form-group" style="margin-top: -15px;">
								<label for="Password" style="font-size: 12px;">Password</label>
								<f:password path="password" class="form-control"
									placeholder="Password" name="password" />
							</div>

							<input type="submit" value="Login" name="submit"
								class="btn btn-primary" />
							<s:url var="url_reg_form" value="/reg_form" />
							<a href="${url_reg_form}"> New user registration</a>
						</f:form>

					</div>
				</div>
			</div>
		</div>

		<div style="height: 25px">
			<jsp:include page="include/footer.jsp" />
		</div>

	</div>
</body>
</html>
