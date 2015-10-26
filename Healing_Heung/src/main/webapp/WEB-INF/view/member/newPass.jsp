<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sform"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>새로운 패스 워드 설정</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/webjars/bootstrap/3.3.4/dist/css/bootstrap.min.css"/>">

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/joinform.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.validate.js"></script>
<script>
$(function() {
	
	$("#cancel").on("click",function(event){
		event.preventDefault();
		var url = "<%=request.getContextPath()%>/home";    
		$(location).attr('href',url);
	});
	
	$.validator.addMethod("passwordcheck", function(value, element) {
		return this.optional(element)
				|| /[a-z0-9]$/.test(value);

	});
	

	$("#newPassform").validate({
		rules : {
			
			memberPassword : {
				required : true,
				minlength : 8,
				passwordcheck : true
			},
			memberPasswordidentify : {
				required : true,
				equalTo : "#memberPassword",
				minlength : 8
			},
			
		},
		messages : {
			
			memberPassword : {
				required : "비밀번호를 입력해주세요.",
				minlength : "비밀번호의 최소길이는 8글자입니다.",
				passwordcheck : "패스워드는 영문 + 숫자 + 특수문자 조합이여야합니다.",
			},
			memberPasswordidentify : {
				required : "비밀번호를 한번 더 입력해주세요.",
				equalTo : "비밀번호가 서로 맞지 않습니다.",
				minlength : "비밀번호의 최소길이는 8글자입니다.",
			},

		}

	});
		
		
	});
</script>	
</head>
<body>
		<c:url value="/member_newPass" var="member"></c:url>
		<sform:form id="newPassform" method="post" action="${member}" class="form-horizontal" modelAttribute="member">
			<fieldset>
			<div id="formtogeter">
			<legend>새로운 비밀번호 설정</legend>
			<div class="form-group">
					<sform:label path="memberPassword" class="col-lg-2 control-label">비밀번호</sform:label>
					<div class="col-lg-10">
						<sform:input path="memberPassword" id="memberPassword"
							name="memberPassword" type="password" class="form-control"
							placeholder="Password" />

					</div>
				</div>
				<br>
				<div class="form-group">
					<sform:label path="memberPasswordidentify"
						class="col-lg-2 control-label">비밀번호 확인</sform:label>
					<div class="col-lg-10">
						<sform:input path="memberPasswordidentify"
							id="memberPasswordidentify" name="memberPasswordidentify"
							type="password" class="form-control" placeholder="Password" />
					</div>
				</div>
			<br>
				<sform:button id="join">비밀번호 설정 확인</sform:button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="<%=request.getContextPath()%>/home"><button id=cancel>취소</button></a>
				</div>
			</fieldset>
		</sform:form>
</body>
</html>