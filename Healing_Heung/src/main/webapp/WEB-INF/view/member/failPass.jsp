<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀 번호 찾기 실패</title>
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
				<br>
				<br>
				<br>
				<br> 
				<img id="result" src="<%=request.getContextPath()%>/resources/fail.jpg"> <font
					id="font">비밀번호 찾기가 실패하였습니다.</font> 
					
				<br><font id="failfont">뒤로 가기<br></font> <a href="<%=request.getContextPath()%>/member_searchPass"><button id="ok">확인</button></a>
			</div>
		</div>

	</div>
</body>
</html>