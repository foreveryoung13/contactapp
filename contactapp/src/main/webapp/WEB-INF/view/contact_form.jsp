<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Contact Form - Contact Application</title>
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
					<h2 class="panel-title">Contact Form</h2>
				</div>

				<c:if test="${err!=null}">
					<p class="error">${err}</p>
				</c:if>
				<s:url var="url_csave" value="/user/save_contact" />
				<f:form action="${url_csave}" modelAttribute="command">

					<div class="form-group form-group-sm" style="margin-top: 10px;">
						<div class="col-sm-6">
							<div class="form-group row" id="form-group-custom">
								<label for="name" class="col-sm-4 control-label labelname">
									Name </label>
								<div class="col-sm-6">
									<f:input path="name" cssClass="form-control" autocomplete="off" />
								</div>
							</div>

							<div class="form-group row" id="form-group-custom">
								<label for="phone" class="col-sm-4 control-label labelname">
									Phone </label>
								<div class="col-sm-6">
									<f:input path="phone" cssClass="form-control"
										autocomplete="off" />
								</div>
							</div>

							<div class="form-group row" id="form-group-custom">
								<label for="address" class="col-sm-4 control-label labelname">
									Address </label>
								<div class="col-sm-6">
									<f:textarea path="address" cssClass="form-control"
										autocomplete="off" />
								</div>
							</div>
						</div>

						<div class="col-sm-6">
							<div class="form-group row" id="form-group-custom">
								<label for="email" class="col-sm-4 control-label labelname">
									Email </label>
								<div class="col-sm-6">
									<f:input path="email" cssClass="form-control"
										autocomplete="off" />
								</div>
							</div>
							<div class="form-group row" id="form-group-custom">
								<label for="remark" class="col-sm-4 control-label labelname">
									Remark </label>
								<div class="col-sm-6">
									<f:input path="remark" cssClass="form-control"
										autocomplete="off" />
								</div>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-12" style="margin-left: 14.4em">
								<input type="submit" value="Save" class="btn btn-primary"
									name="btnSubmit" />
							</div>
						</div>
					</div>
				</f:form>
			</div>
		</div>

		<div style="height: 25px">
			<jsp:include page="include/footer.jsp" />
		</div>

	</div>

</body>
</html>
