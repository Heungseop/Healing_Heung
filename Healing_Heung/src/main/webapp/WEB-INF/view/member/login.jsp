<%@page import="org.springframework.context.annotation.Import"%>
<%@page import="dto.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sform"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/webjars/bootstrap/3.3.4/dist/css/bootstrap.min.css"/>">

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/loginform.css">
<style type="text/css">
.loginId {
	text-align: center;
}
</style>
</head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){

		$("#loginbutton").on("click",function(){
			var id = $("#id").val();
			var pass = $("#pass").val();
			var $target = $("#failMsg");
			var $loginArea = $("#loginArea");
			var url = "<%=request.getContextPath()%>/member_login";
			$.ajax({
				type : "post",
				url : url,
				data : {
					id : id,
					pass : pass
				},
				success : function(response) {
					
					console.log(response);
					
					if (response["result"] == "success") {
						
						window.location.reload();
	
					} else {
						console.log(response["msg"]);
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
	<%!
		Member loginMember;
		Object loginObject;
	%>
		<div class="alert alert-warning">

		<marquee>반갑습니다. HEALING입니다.</marquee>
		
		<div id="loginArea">
		<%
			if (session.getAttribute("login") == null) {
				
		%>
		<div id="loginText">HEALING LOGIN</div>

		
		
		<input type="text" name="id" id="id" placeholder="id" required
			autofocus> <br> <input type="password" name="pass"
			id="pass" placeholder="Password" required>
		<button id="loginbutton">로그인</button>

		<a id="button" href="<%=request.getContextPath()%>/member_join">회원 가입</a> 
		<a id="button" href="<%=request.getContextPath()%>/member_searchId">아이디 찾기</a> 
		<a id="button" href="<%=request.getContextPath()%>/member_searchPass">패스워드 찾기</a>
			
		<%
			} else {
				loginObject =session.getAttribute("login");
				if(loginObject !=null && loginObject instanceof Member ){
					loginMember=(Member)loginObject;
				}
		%>
				<%=loginMember.getMemberName()%> 님 반갑습니다.<br>
				<a id="button" href="<%=request.getContextPath()%>/member_change">회원 수정</a>
				<a id="button" href="<%=request.getContextPath()%>/member_logout">로그 아웃</a>
				<a id="button" href="<%=request.getContextPath()%>/place_mypage">마이 페이지</a>
		<% 		
			}
		%>
		
		</div>
		
	</div>


</body>
</html>