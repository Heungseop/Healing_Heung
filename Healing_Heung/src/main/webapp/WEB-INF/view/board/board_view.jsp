<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dto.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sform"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 내용</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/board_view.css">
</head>
<body>
	<%!
		Object loginObject;
		Member loginMember;
		int i = 0;
		int j = 0;
	%>
	<%
		Board b = (Board) request.getAttribute("board");
		SimpleDateFormat fm = new SimpleDateFormat("yyyy. MM. dd. HH:mm");
	%>
	<div class="whole">
		<div class="top block">
			<div class="block bdtitle">
				<%=b.getBoardTitle()%></div>
			<div class="block date"><%=fm.format(b.getBoardRegDate())%></div>
		</div>
		<div class="line"></div>
		<div class="mid">
			<div class="block info">
				<div class="block id"><%=b.getMemberId()%></div>
				<div class="block like">
					<input type="image"
						src="<%=request.getContextPath()%>/resources/like.jpg" id="bdLike">
					<div id="displaybdLike" class="block"><%=b.getBoardLike()%></div>
				</div>
			</div>
				
			
			<c:set var="bdno" value="<%=b.getBoardNo()%>"></c:set>
			<div class="content"><%=b.getBoardComment()%>
			
			</div>
			<%
			 if(b.getCourseNo() !=0){
				 
			%>
			<div>
			 <a href="<%=request.getContextPath()%>/course_detail?courseNo=<%=b.getCourseNo() %>">공유 된 코스 바로 가기</a> 
			</div><br>
			<% 
			 }
			%>
			<%
			loginObject =session.getAttribute("login");
			if(loginObject !=null && loginObject instanceof Member ){
				loginMember=(Member)loginObject;
				
			if((b.getMemberId().equals(loginMember.getMemberId()) || loginMember.getMemberId().equals("admin")) ){

			%>
				
			<a href="<%=request.getContextPath()%>/board_update?boardNo=<%=b.getBoardNo()%>"><button id="updateboard">수정</button></a>&nbsp;&nbsp;
			<a href="<%=request.getContextPath()%>/board_delete?boardNo=<%=b.getBoardNo()%>"><button >삭제</button></a>&nbsp;&nbsp;
			<% 	
				}
			}
			%>
			<a href="<%=request.getContextPath()%>/board_main?page=1"><button>목록</button></a>
		</div>
		<div class="bot">
			<div class="replywrite" style="background: #e5e5e5;">
				<c:url value="/write_reply" var="write_reply"></c:url>
				<sform:form id="writereply" method="post" action="${write_reply}"
					class="form-horizontal" modelAttribute="reply">
					<div style="margin: 10px;">
						<h4>댓글 작성</h4>
						<div class="inputbox block">
							<%
								if (session.getAttribute("login") != null) {
							%>
							<sform:textarea path="replyComment" id="replyComment"
								name="replyComment" type="text" class="form-control" />
							<%
								} else {
							%>
							<sform:input path="replyComment" readonly="true"
								id="replyComment" class="form-control"
								placeholder="로그인이 필요한 서비스입니다." />
							<%
								}
							%>
							<sform:input path="boardNo" id="boardNo" name="boardNo"
								type="hidden" value="<%=b.getBoardNo()%>" />


						</div>

						<button class="btn block">등록</button>
					</div>
				</sform:form>
			</div>
			<hr>
			<c:set var="reno" value="0"></c:set>
			<div class="replyview">
				<%
					if (b.getReply() != null) {
						i =0;
						j =2000;
						List<Reply> list = b.getReply();
						for (Reply r : list) {
						
				%>
				<div class="rewriter block">
					<img src="<%=request.getContextPath()%>/resources/ico_persnal.gif">
					<%=r.getMemberId()%><div class="redate block">
						(<%=fm.format(r.getReplyRegDate())%>)
					</div>
				</div>

				<div class="reply"><%=r.getReplyComment()%></div>
				<%
							loginObject =session.getAttribute("login");
							
									if(loginObject !=null && loginObject instanceof Member ){
										loginMember=(Member)loginObject;

									if((r.getMemberId().equals(loginMember.getMemberId()) || loginMember.getMemberId().equals("admin")) ){
									%>
				
				
					<c:url value="/reply_update" var="reply_update"></c:url>
				<sform:form id="replyupdateform" method="post" action="${reply_update}"
					 modelAttribute="reply">
					 
					<sform:input path="replyNo" id="replyNo" type="hidden" value="<%=r.getReplyNo()%>" />	 
					
					<sform:input path="boardNo" id="boardNo" type="hidden" value="<%=r.getBoardNo()%>" />	 
				<br>
				<a id="<%=i++%>" href=""><button>수정</button></a>&nbsp;&nbsp; 
				
				
				</sform:form>
				<a href="<%=request.getContextPath()%>/reply_delete?replyNo=<%=r.getReplyNo()%>"><button >삭제</button></a>
				
				<% 	

										}
									}
								
							%>

				<hr>
				<%
						}
					}
				%>
			</div>

		</div>
	</div>

</body>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=8db10793985b77516d67e5101b49f26e&libraries=services"></script>
<script>
$(function(){
	
	var replyUpdateIds = <%=i%>;
	var replyCheck = false;
	console.log(replyUpdateIds);
	
	for(var i=0; i<replyUpdateIds; i++){
		console.log(i);
			$("#"+i).on("click",function(){
				
				event.preventDefault();
				
				
				if(!replyCheck){
				
				$(this).after(' <textarea path="replyComment" id="replyComment" name="replyComment" type="text" class="form-control" />'
						+'<button id="dfdf">확인</button>' );
				
				$(this).html("<button>수정 취소</button>");
				replyCheck =true;
				}else{
					$(this).html("<button>수정</button>");
					$(this).next().detach();
					$(this).next().detach();
					
					replyCheck =false;
				}
				
				
				
				
			});
	}
		
		
	$("#bdLike").on("click",function(){
		var bdno = ${bdno};
		var $bdtarget = $("#displaybdLike");
		var url = "<%=request.getContextPath()%>/board_like";
		$.ajax({
			url : url,
			data : {
				boardNo : bdno
			},
			success : function(response) {
				console.log(response);
				if (response["result"] == "success") {
					$bdtarget.html(response["bdlike"]);
					alert("추천이 성공적으로 되었습니다.");
					
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
</html>