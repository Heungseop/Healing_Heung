<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sform"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 찾기</title>

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
		
		
		
		$("#searchIdButton").on("click",function(event){
			
			event.preventDefault();
			
			var name=$("#name").val();
			var phone=$("#phone").val();
			var email=$("#email").val();
			
			console.log(name);
			console.log(phone);
			console.log(email);
			var url = "<%=request.getContextPath()%>/member_searchId";
			$.ajax({
				type : "post",
				url : url,
				data : {
					name : name,
					phone : phone,
					email : email
				},
				success : function(response) {
					
					console.log(response);
					
					if (response["result"] == "success") {
						alert("당신의 아이디는 : " + response["memberId"] + " 입니다.");

					} else {
						
						alert(response["msg"]);
					}
				},
				error : function() {
					console.log("ajax fail..");
				}
				
			});
			
		});
		
		
		
		
		
	});
</script>

<body>


	<c:url value="/member_searchId" var="member"></c:url>
		<sform:form  method="post" action="${member}" class="form-horizontal" modelAttribute="member">
			<fieldset>
			<div id="formtogeter">
			<legend>아이디 찾기</legend>
			<div class="form-group">
				<sform:label path=""  class="col-lg-2 control-label">이름</sform:label>
					<div class="col-lg-10">
						<sform:input path="" id="name" name="memberName"  type="text" class="form-control" placeholder="Name"/>
					</div>
			</div>
			<br>
			<div class="form-group">
				<sform:label path="" id="name" class="col-lg-2 control-label">Email</sform:label>
					<div class="col-lg-10">	
						<sform:input path="" id="email" name="memberEmail" type="text" class="form-control" placeholder="Email"/>
					</div>
			</div>
			<br>
			<div class="form-group">
				<sform:label path="memberPhone" class="col-lg-2 control-label">폰 번호</sform:label>
					<div class="col-lg-10">	
						<sform:input path="memberPhone" id="phone" name="memberPhone" type="text" class="form-control" placeholder="PhoneNumber"/>
					
					</div>
			</div>
			<br>
				<button id="searchIdButton">아이디 찾기</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="<%=request.getContextPath()%>/home"><button id="cancel">취소</button></a>
				</div>
			</fieldset>
		</sform:form>
</body>
</html>