<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<s:url var="url_jqlib" value="/static/js/jquery-3.2.1.min.js" />
<script type="text/javascript" src="${url_jqlib}">
	
</script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#id_get_time").click(function() {
			$.ajax({
				url:'get_time',
				success : function(data){
					$("#id_time").html(data);
				}
			});
		});
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<h1>Ajax Test Page</h1>
	<button id="id_get_time">Get Server Time</button>
	<br />
	<p id="id_time" />
</body>
</html>