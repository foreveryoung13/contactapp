
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Dashboard - Contact Application</title>

<!-- Bootstrap Configuration -->
<link
	href="${pageContext.request.contextPath}/webjars/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">

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
			<div class="panel panel-info">
				<div class="panel-heading">
					<h2 class="panel-title">User Dashboard</h2>
				</div>
			</div>
		</div>
		<div style="height: 25px">
			<jsp:include page="include/footer.jsp" />
		</div>
	</div>

</body>
</html>
