<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sform"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 수정</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/webjars/bootstrap/3.3.4/dist/css/bootstrap.min.css"/>">

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/joinform.css">
</head>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.validate.js"></script>
<script>
	$(function() {
		
		
		$.validator.addMethod("phonenumbercheck", function(value, element) {
			return this.optional(element)
					|| /^\d{3}-\d{3,4}-\d{4}$/.test(value);

		});
		$.validator.addMethod("emailcheck", function(value, element) {
			return this.optional(element)
					|| /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i.test(value);

		});
		$.validator.addMethod("passwordcheck", function(value, element) {
			return this.optional(element)
					|| /[a-z0-9]$/.test(value);

		});
		

		$("#memberchangeform").validate({
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
				
				memberEmail : {
					required : true,
					emailcheck : true,
				},
				memberPhone : {
					required : true,
					phonenumbercheck : true

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
				memberEmail : {
					required : "이메일을 입력해주세요.",
					emailcheck : "이메일 형식이 아닙니다.",
				},
				memberPhone : {
					required : "핸드폰 번호를 입력해주세요.",
					phonenumbercheck : "핸드폰 형식으로 입력해주세요.",
				},
				

			}

		});
		$("#cancel").on("click",function(event){
			event.preventDefault();
			var url = "<%=request.getContextPath()%>/home";    
			$(location).attr('href',url);
		});
		
	

	});
	</script>
<body>
	<c:url value="/member_change" var="member"></c:url>
	<sform:form id="memberchangeform"  method="post" action="${member}" class="form-horizontal" modelAttribute="member">
			<fieldset>
			<div id="formtogeter">
			<legend>회원수정</legend>
			<div class="form-group">
				<sform:label path="memberId" class="col-lg-2 control-label">아이디</sform:label>
					<div class="col-lg-10">
						<sform:input path="memberId" type="text disabled" class="form-control" placeholder="Id" readonly="true"/>
					</div>
			</div>
			<br>
			<div class="form-group">
				<sform:label path="memberPassword" class="col-lg-2 control-label">비밀번호</sform:label>
					<div class="col-lg-10">
						<sform:input path="memberPassword" name="memberPassword" type="password" class="form-control" placeholder="Password"/>
					</div>
			</div>
			<br>
			<div class="form-group">
				<sform:label path="memberPasswordidentify" class="col-lg-2 control-label">비밀번호 확인</sform:label>
					<div class="col-lg-10">
						<sform:input path="memberPasswordidentify" name="memberPasswordidentify" type="password" class="form-control" placeholder="Password"/>
					</div>
			</div>
			<br>
			<div class="form-group">
				<sform:label path="memberName" class="col-lg-2 control-label">이름</sform:label>
					<div class="col-lg-10">
						<sform:input path="memberName" type="text disabled" class="form-control" placeholder="Name" readonly="true"/>
					</div>
			</div>
			<br>
			<div class="form-group">
				<sform:label path="memberEmail" class="col-lg-2 control-label">Email</sform:label>
					<div class="col-lg-10">	
						<sform:input path="memberEmail" name="memberEmail" type="email" class="form-control" placeholder="Email"/>
					</div>
			</div>
			<br>
			<div class="form-group">
				<sform:label path="memberPhone" class="col-lg-2 control-label">폰 번호</sform:label>
					<div class="col-lg-10">	
						<sform:input path="memberPhone" type="text" name="memberPhone" class="form-control" placeholder="PhoneNumber"/>
					</div>
			</div>
			<br>
			<div class="form-group">
		<sform:label path="memberBirth" class="col-lg-2 control-label">생년 월일</sform:label>

					<div class="col-lg-10">	
						<sform:input path="memberBirth" type="Date disabled" class="form-control" readonly="true" /><br>
					</div>
			</div>
				<sform:button id="join">회원 수정 완료</sform:button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="<%=request.getContextPath()%>/home"><button id=cancel>취소</button></a>
				</div>
			</fieldset>
		</sform:form>
</body>
</html>