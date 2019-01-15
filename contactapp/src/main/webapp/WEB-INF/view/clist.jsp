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
				<h1>Contact List</h1>
				 
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
				
				<form action="<s:url value="/user/contact_search"/>">
					<input type="text" name="freeText" value="${param.freeText}" placeholder="Enter Text To Search">
					<button>Find</button>
				</form>
				<br/>
				
				<table border="1" cellpadding="3">
					<c:if test="${empty contactList}">
						<tr>
							<td align="center" colspan="8" class="error">No Records
								Present</td>
						</tr>
					</c:if>
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
					<c:forEach var="c" items="${contactList}" varStatus="st">
						<tr>
							<td>${st.count}</td>
							<td>${c.contactId}</td>
							<td>${c.name}</td>
							<td>${c.phone}</td>
							<td>${c.email}</td>
							<td>${c.address}</td>
							<td>${c.remark}</td>
							<s:url var="url_del" value="/user/del_contact">
								<s:param name="cid" value="${c.contactId}"/>
							</s:url>
							<s:url var="url_edit" value="/user/edit_contact">
								<s:param name="cid" value="${c.contactId}"/>
							</s:url>
							<td><a href="${url_edit}">Edit</a> | <a href="${url_del}">Delete</a></td>
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
