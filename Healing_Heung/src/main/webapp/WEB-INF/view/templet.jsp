<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<style>
#footer{
	
}
#parent {
	display: flex;	
	width: 1400px;
}
nav{
	flex : none;
	
}
section {
	flex : none;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome to Healing</title>

<link rel="stylesheet" href="<c:url value="/webjars/bootstrap/3.3.4/dist/css/bootstrap.min.css" />">

</head>

<body>

<%
	String contentpage = null;
	if(request.getParameter("contentpage") != null) {
		contentpage = request.getParameter("contentpage");
	} else if(request.getAttribute("contentpage") != null) {
		contentpage = request.getAttribute("contentpage").toString();
	} else if(request.getAttribute("contentpage") != null) {
		contentpage = session.getAttribute("contentpage").toString();
	}

	if(contentpage == null) {
		contentpage = "/WEB-INF/view/main.jsp";	
	}
%>
	<div id=main_templeat>
	<jsp:include page="header.jsp"></jsp:include>
	
	<div id="parent">
	<jsp:include page="nav.jsp"></jsp:include>	
	<jsp:include page="<%=contentpage%>"></jsp:include>
	</div>
	<br>
	<div id="footer">
	
	<jsp:include page="footer.jsp"></jsp:include>
	</div>
	</div>
</body>
<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.5.1/fotorama.css"
	type="text/css" />
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.5.1/fotorama.js"></script>

<script type="text/javascript">

</script>
</html>