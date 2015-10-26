<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 수정 완료</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/webjars/bootstrap/3.3.4/dist/css/bootstrap.min.css"/>">

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/joinform.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/joinresult.css">
	
</head>
<body>
	<div class="form-horizontal">
	<div id="formtogeter">
	<div id="formto">
	<br><br><br><br>
	<img id="result" src="<%=request.getContextPath()%>/resources/result.jpg">
	<font id="font">게시물 수정이 완료되었습니다.</font>
	<img src="<%=request.getContextPath()%>/resources/result.jpg">
	<br>
	<font id="okfont">게시판 메인화면으로 돌아가려면 확인 버튼을 누르세요.<br></font>
	<a href="<%=request.getContextPath()%>/board_main?page=1"><button id="ok">확인</button></a>
	</div>
	</div>
	</div>
</body>
</html>