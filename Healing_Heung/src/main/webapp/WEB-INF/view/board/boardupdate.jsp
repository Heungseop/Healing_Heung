<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sform"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 수정</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/webjars/bootstrap/3.3.4/dist/css/bootstrap.min.css"/>">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/boardwrite.css">
	<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.validate.js"></script>
<script>
	$(function() {
		$("#cancel").on("click",function(event){
			event.preventDefault();
			var url = "<%=request.getContextPath()%>/home";    
			$(location).attr('href',url);
		});
	});
</script>
</head>
<body>
<c:url value="/board_update" var="board"></c:url>
<sform:form id="boardform" method="post" action="${board}"
		class="form-horizontal" modelAttribute="updateboard">
<div class="board_main">
<fieldset>
	<legend> 게시글 수정 </legend>
	<div id="main_table">
		<div class="form-group">
				<sform:label path="boardTitle" class="col-lg-2 control-label">글제목</sform:label>
					<div class="col-lg-10">
						<sform:input path="boardTitle" name="boardTitle" type="" class="form-control" />
					</div>
		</div>
			<br>
			<sform:label path="boardNo"></sform:label>
							<sform:input path="boardNo" id="boardNo" type="hidden" name="boardNo" />
		<div class="form-group">
				<sform:label path="courseNo" class="col-lg-2 control-label">코스 번호</sform:label>
					<div class="col-lg-10">
						<sform:input path="courseNo" name="courseNo" type="Number" class="form-control" />
					</div>
		</div>
			<br>
		<div class="form-group">
				<sform:label path="boardComment" class="col-lg-2 control-label">게시글</sform:label>
					<div class="col-lg-10">
						<sform:textarea id="boardtextarea" path="boardComment" name="boardComment" type="text" class="form-control" />
					</div>
		</div>
		<sform:button>수정완료</sform:button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="<%=request.getContextPath()%>/home"><button id=cancel>취소</button></a>
	</div>
	</fieldset>
	</div>
	</sform:form>

</body>
</html>