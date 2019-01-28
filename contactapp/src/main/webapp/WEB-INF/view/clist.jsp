<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Contact List - Contact Application</title>
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
					<h2 class="panel-title">Contact List</h2>
				</div>

				<div class="panel-body">

					<c:if test="${err!=null}">
						<p class="error">${err}</p>
					</c:if>
					<c:if test="${param.act eq 'sv'}">
						<p class="success">Your Save Contact Successfully!</p>
					</c:if>
					<c:if test="${param.act eq 'ed'}">
						<p class="success">Your Edit Contact Successfully!</p>
					</c:if>
					<c:if test="${param.act eq 'del'}">
						<p class="success">Your Delete Contact Successfully!</p>
					</c:if>

					<div align="right">
						<form action="<s:url value="/user/contact_search"/>">
							<input type="text" name="freeText" value="${param.freeText}"
								placeholder="Enter text to search">
							<button>Find</button>
						</form>
					</div>

					<form action="<s:url value="/user/bulk_cdelete"/>">
						<table class="table table-hover">
							<c:if test="${empty contactList}">
								<tr>
									<td align="center" colspan="8" class="error">No Records
										Present</td>
								</tr>
							</c:if>
							<thead>
								<tr>
									<th>SR</th>
									<th>CID</th>
									<th>Name</th>
									<th>Phone</th>
									<th>Email</th>
									<th>Address</th>
									<th>Remark</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="c" items="${contactList}" varStatus="st">
									<tr>
										<td align="center"><input type="checkbox" name="cid"
											value="${c.contactId}"></td>
										<td>${c.contactId}</td>
										<td>${c.name}</td>
										<td>${c.phone}</td>
										<td>${c.email}</td>
										<td>${c.address}</td>
										<td>${c.remark}</td>
										<s:url var="url_del" value="/user/del_contact">
											<s:param name="cid" value="${c.contactId}" />
										</s:url>
										<s:url var="url_edit" value="/user/edit_contact">
											<s:param name="cid" value="${c.contactId}" />
										</s:url>
										<td><a href="${url_edit}" class="btn btn-success btn-sm">Edit</a>
											<a href="${url_del}" class="btn btn-danger btn-sm">Delete</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div>
							<button class="btn btn-danger btn-sm" style="margin-left: 5px;">Deletes</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div style="height: 25px">
			<jsp:include page="include/footer.jsp" />
		</div>
	</div>
</body>
</html>
