<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dto.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/boardmain.css">
</head>
<body>

	<%
	@SuppressWarnings("unchecked")
		List<Board> list = (List<Board>) request.getAttribute("pageboard");
		int lastpage = (Integer) request.getAttribute("lastpage");
		int thisPage = Integer.parseInt(request.getParameter("page"));
		if (thisPage % 10 == 0){
			thisPage -= 1;}
		int pageGroup = (thisPage / 10) * 10 + 1;

		SimpleDateFormat fm = new SimpleDateFormat("yyyy. MM. dd.  HH:mm");
	%>

	<div class="board_main">
	<legend> 공유 게시판 </legend>
	<div id="main_table">
	<table class="table table-striped">
		<tr>
			<th>번호</th>
			<th >제목</th>
			<th>작성일</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>추천수</th>
		</tr>
		<%
			for (Board b : list) {
				List<Reply> reply = b.getReply();
				
		%>
		<tr>
			<th><%=b.getBoardNo()%></th>
			<th id="bdtitle"><a style="color : black;"
				href="<%=request.getContextPath()%>/board_view?boardNo=<%=b.getBoardNo()%>">
					<%=b.getBoardTitle()%>
					<%if(reply.size()>0){ %>
					(<%=reply.size() %>)	<%} %></a></th>
			
			
			<th><%=fm.format(b.getBoardRegDate())%></th>
			<th><%=b.getMemberId()%></th>
			<th><%=b.getBoardRead()%></th>
			<th><%=b.getBoardLike()%></th>
			<%
				}
			%>
		
	</table>
	</div>
	<%if(session.getAttribute("login")!=null) {%>
	<div style="width=100%;text-align: right;">
	<a href="<%=request.getContextPath()%>/board_write">글쓰기</a>
	</div>
	<%} %>
	<div id="page">
		<a href="<%=request.getContextPath()%>/board_main?page=1">[처음] 
		</a>  
		<%if(thisPage>10) {%>
		<a href="<%=request.getContextPath()%>/board_main?page=<%=pageGroup-1 %>"> &lt;</a>
		<%} %>
		<%
			for (int i = pageGroup; i <= pageGroup + 9; i++) {
		%>
		<a href="<%=request.getContextPath()%>/board_main?page=<%=i%>"
		<%if(i==Integer.parseInt(request.getParameter("page"))){
			%>	style="color: gray;"
			<%
			}%>
		
		><%=i%></a>
		<%
			if (i == lastpage) {
					break;
				}
			}
		%>
		<%if(thisPage/10 != lastpage/10) {%>
		<a href="<%=request.getContextPath()%>/board_main?page=<%=pageGroup+10 %>">&gt; 
		</a><%} %>  <a href="<%=request.getContextPath()%>/board_main?page=<%=lastpage %>">[끝]</a>

	</div>

	<br>
	</div>


</body>
</html>