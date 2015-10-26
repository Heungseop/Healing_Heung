<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sform"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 보기</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/webjars/bootstrap/3.3.4/dist/css/bootstrap.min.css"/>">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/boardwrite.css">
	<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.validate.js"></script>
<script>
	$(function() {
		
		var courseCheck = false;
		
		$("#cancel").on("click",function(event){
			event.preventDefault();
			var url = "<%=request.getContextPath()%>/home";    
			$(location).attr('href',url);
		});
		
		
		$("#boardform").validate({
			rules : {
				courseNo : {
					required : true,
				}		
			},
			messages : {
				courseNo : {
					required : "코스 번호을 입력해주세요 ,코스를 등록하지않으려면 0을 입력해주세요.",
				}
			
			}

		});
		$("#boardinsert").on("click",function(){
			
			 if($("#courseNo").val() !=0 && !courseCheck){
				event.preventDefault();
				alert("코스 존재 여부를 체크해주세요. (코스를 공유하지않으려면 코스번호를 0으로 설정해주세요.)");
				return false;
			}
			 
			
			
		});
		$("#CourseNoCheckButton").on("click",function(){
			event.preventDefault();
			
			var courseNo =$("#courseNo").val();
			
			if($("#courseNo").val() ==""){
				alert("코스 번호를 입력해주세요.");
				return false;
			}
			
			var url = "<%=request.getContextPath()%>/board_course_no_check_ajax";
			
			$.ajax({
				type : "get",
				url : url,
				data : {
					courseNo : courseNo
				},
				success : function(response) {
					
					console.log(response);
					
					if (response["result"] == "success") {
					
						alert(response["success"]);
						courseCheck =true;
						
					}else{
						console.log(response["fail"]);
						alert(response["fail"]);
					}
			
				},
				error : function() {
					alert("입력한 값이 올바르지 않습니다.");
					console.log("ajax fail..");
				}
				
			});  //2번쨰 ajax
			
		})
		$("#courseNo").on("focus",function(){
			courseCheck =false;
		});
		
		
		
		
	});
</script>
</head>
<body>
<c:url value="/board_write" var="board"></c:url>
<sform:form id="boardform" method="post" action="${board}"
		class="form-horizontal" modelAttribute="board">
<div class="board_main">
<fieldset>
	<legend> 게시글 작성 </legend>
	<div id="main_table">
		<div class="form-group">
				<sform:label path="boardTitle" class="col-lg-2 control-label">글제목</sform:label>
					<div class="col-lg-10">
						<sform:input path="boardTitle" name="boardTitle" type="text" class="form-control" />
					</div>
		</div>
			<br>
		<div class="form-group">
				<sform:label path="courseNo" class="col-lg-2 control-label">코스 번호</sform:label>
					<div class="col-lg-10">
						<div class="input-group">
						<sform:input path="courseNo" id="courseNo" name="courseNo" type="text" class="form-control" />
						
						<div id="CourseNoCheckButton" class="input-group-addon btn ">코스 존재 여부 </div>
						</div> 
					</div>
		</div>
		<br>
			
		<div class="form-group">
				<sform:label path="boardComment" class="col-lg-2 control-label">게시글</sform:label>
					<div class="col-lg-10">
						<sform:textarea path="boardComment" name="boardComment" type="text" class="form-control" />
					</div>
		</div>
		<sform:button id="boardinsert">작성완료</sform:button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="<%=request.getContextPath()%>/home"><button id=cancel>취소</button></a>
	</div>
	</fieldset>
	</div>
	</sform:form>

</body>
</html>