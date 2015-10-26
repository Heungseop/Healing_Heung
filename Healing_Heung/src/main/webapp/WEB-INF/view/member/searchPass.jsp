<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sform"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀 번호 찾기</title>

<link rel="stylesheet" type="text/css"
	href="<c:url value="/webjars/bootstrap/3.3.4/dist/css/bootstrap.min.css"/>">

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/joinform.css">
</head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.validate.js"></script>
<script>
	$(function() {
		
		$("#cancel").on("click",function(event){
			event.preventDefault();
			var url = "<%=request.getContextPath()%>/home";    
			$(location).attr('href',url);
		});
		$.validator.addMethod("phonenumbercheck", function(value, element) {
			return this.optional(element)
					|| /^\d{3}-\d{3,4}-\d{4}$/.test(value);

		});
		$.validator.addMethod("hanglecheck", function(value, element) {
			return this.optional(element)
					|| /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/.test(value);

		});
		$.validator.addMethod("emailcheck", function(value, element) {
			return this.optional(element)
					|| /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i.test(value);

		});
		
		$("#searchPassform").validate({
			rules : {
				memberId : {
					required : true,
					minlength : 5
				},
				memberName : {
					required : true,
				hanglecheck :true,
				},
				memberEmail : {
					required : true,
					emailcheck : true,
				},
				memberPhone : {
					required : true,
					phonenumbercheck : true

				}
			},
			messages : {
				memberId : {
					required : "아이디를 입력해주세요.",
					minlength : "아이디의 최소길이는 5글자입니다.",
				},
				memberName : {
					required : "이름을 입력해주세요.",
				hanglecheck : "한글이 아닙니다.",
				},
				memberEmail : {
					required : "이메일을 입력해주세요.",
					emailcheck : "이메일 형식이 아닙니다.",
				},
				memberPhone : {
					required : "핸드폰 번호를 입력해주세요.",
					phonenumbercheck : "핸드폰 형식으로 입력해주세요.",
				}
				

			}

		});
		
		
	});
</script>
<body>
	<c:url value="/member_searchPass" var="member"></c:url>
		<sform:form id="searchPassform" method="post" action="${member}" class="form-horizontal" modelAttribute="member">
			<fieldset>
			<div id="formtogeter">
			<legend>패스워드 찾기</legend>

			<div class="form-group">
					<sform:label path="memberId" class="col-lg-2 control-label">아이디</sform:label>
					<div class="col-lg-10">

						<sform:input path="memberId" id="memberId" name="memberId"
							type="text" class="form-control" placeholder="Id" />
					</div>
				</div>
			<br>
			<div class="form-group">
				<sform:label path="memberName" class="col-lg-2 control-label">이름</sform:label>
					<div class="col-lg-10">
						<sform:input path="memberName" id="name" name="memberName" type="text" class="form-control" placeholder="Name"/>
					</div>
			</div>
			<br>
			<div class="form-group">
				<sform:label path="memberEmail" class="col-lg-2 control-label">Email</sform:label>
					<div class="col-lg-10">	

						<sform:input path="memberEmail" id="email" name="memberEmail" type="text" class="form-control" placeholder="Email"/>
					</div>

			</div>

			
			<br>
			<div class="form-group">
				<sform:label path="memberPhone" class="col-lg-2 control-label">Phone</sform:label>
					<div class="col-lg-10">	

						<sform:input path="memberPhone" type="text" name="memberPhone" class="form-control" placeholder="Phone"/>

			</div>
			<br>
			<br><br>
				<sform:button id="join">패스워드 찾기</sform:button>

				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="<%=request.getContextPath()%>/home"><button id=cancel>취소</button></a>

				</div>
			</fieldset>
		</sform:form>
</body>
</html>