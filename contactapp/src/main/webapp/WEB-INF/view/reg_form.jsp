<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Login - Contact Application</title>
<!-- Bootstrap Configuration -->
<link
	href="${pageContext.request.contextPath}/webjars/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">


<s:url var="url_css" value="/static/css/style.css" />
<link href="${url_css}" rel="stylesheet" type="text/css" />
<s:url var="url_jqlib" value="/static/js/jquery-3.2.1.min.js" />
<script type="text/javascript" src="${url_jqlib}"></script>
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
					<h2 class="panel-title">User Registration</h2>
				</div>
				<c:if test="${err!=null}">
					<p class="error">${err}</p>
				</c:if>
				<s:url var="url_reg" value="/register" />
				<f:form action="${url_reg}" modelAttribute="command">

					<div class="form-group form-group-sm">
						<div class="col-sm-6">
							<div class="form-group row" id="form-group-custom">
								<label for="name" class="col-sm-4 control-label labelname">
									Name </label>
								<div class="col-sm-6">
									<f:input path="user.name" cssClass="form-control"
										autocomplete="off" />
								</div>
							</div>
							<div class="form-group row" id="form-group-custom">
								<label for="phone" class="col-sm-4 control-label labelname">
									Phone </label>
								<div class="col-sm-6">
									<f:input path="user.phone" cssClass="form-control"
										autocomplete="off" />
								</div>
							</div>
							<div class="form-group row" id="form-group-custom">
								<label for="email" class="col-sm-4 control-label labelname">
									Email </label>
								<div class="col-sm-6">
									<f:input path="user.email" cssClass="form-control"
										autocomplete="off" />
								</div>
							</div>
							<div class="form-group row" id="form-group-custom">
								<label for="address" class="col-sm-4 control-label labelname">
									Address </label>
								<div class="col-sm-6">
									<f:textarea path="user.address" cssClass="form-control"
										autocomplete="off" />
								</div>
							</div>

						</div>

						<div class="col-sm-6">
							<div class="form-group row" id="form-group-custom">
								<label for="username" class="col-sm-4 control-label labelname">
									Username </label>
								<div class="col-sm-6 input-group">
									<f:input id="id_username" path="user.loginName"
										cssClass="form-control" autocomplete="off" />
									<span class="input-group-btn">
										<button type="button" class="btn btn-primary btn-sm" id="id_check_avail">Check</button>
									</span>									
								</div>
								<div id="id_res_div" class="error" style="margin-left: 13.5em;">
								</div>
							</div>

							<div class="form-group row" id="form-group-custom">
								<label for="password" class="col-sm-4 control-label labelname">
									password </label>
								<div class="col-sm-6 input-group">
									<f:password path="user.password" cssClass="form-control"
										autocomplete="off" />
								</div>
							</div>
						</div>
					</div>

					<div class="form-group row">
						<div class="col-sm-12" style="margin-left: 14.4em">
							<input type="submit" value="Save" class="btn btn-primary"
								name="btnSubmit" />
						</div>
					</div>

				</f:form>
			</div>
		</div>

		<div style="height: 25px">
			<jsp:include page="include/footer.jsp" />
		</div>

	</div>

	<script>
		$(document).ready(function() {
			$("#id_check_avail").click(function() {
				$.ajax({
					url : 'check_avail',
					data : {
						username : $("#id_username").val()
					},
					success : function(data) {
						$("#id_res_div").html(data);
					}
				});
			});
		});
	</script>

</body>
</html>
