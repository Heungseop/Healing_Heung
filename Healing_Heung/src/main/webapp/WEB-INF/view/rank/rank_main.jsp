<%@page import="dto.Rank"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dto.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.5.1/fotorama.css"
	type="text/css" />
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.5.1/fotorama.js"></script>

<style>
/*  div {
	border: solid 1px;
} */
 
.rankmaincontent {
	height: 200px;
}

.rtitle {
	text-align: center;
}
</style>

<body>
	<%-- 	<%
	if (request.getAttribute("list") != null) {
	List<Rank> list = (List) request.getAttribute("list");
	
	int LikeCourseNo = 0;
	String LikeCourseName = null;
	int LikeCount = 0;
	
	%>
	*랭킹 순위*
	
	-오늘의 랭킹
	<%
		for (Rank r : list) {
		for(int i=1; i<4; i++) {
	%>
	<ul>
	<li><%=r.getRankCourseNo() %><%=r.getRankCourseName() %></li>
	</ul>
	<%
		}
		}
	}
	%>
	 --%>

	<%
		Map<String, Object> rank = (Map) request.getAttribute("list");
	%>
	<div id="ranking" style="height: 150px;">

		<div>
			<div class="rtitle">일간</div>
			<div class="rankmaincontent">
				<ol id="dayul">
				</ol>
			</div>
		</div>
		<div>
			<div class="rtitle">주간</div>
			<div class="rankmaincontent">
				<ol id="weekul">
				</ol>
			</div>
		</div>
		<div>
			<div class="rtitle">월간</div>
			<div class="rankmaincontent">
				<ol id="monthul">
				</ol>
			</div>
		</div>
		
	</div>
			<div style="text-align: right;">
				<div style="display: inline-block;">
					<a href="<%=request.getContextPath()%>/rank_daily">more</a>
				</div>
			</div>

</body>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>

<script type="text/javascript">
$(function(){
	
 	$.ajax({
		url : "<%=request.getContextPath()%>/courseAjax",
			type : "get",
			dataType : "json",
			success : function(result) {
				console.log("result : ", result);
				$.each(result, function(key, list) {
					console.log("///////////////////key : ", key);
					$.each(list, function(index, value) {
						if (index < 5) {
							console.log("value : ", value);
							console.log("#" + key + "ul");
							$("#" + key + "ul").append(
									"<li>" + value.courseName);
						}
					});
				});

				$("#ranking").fotorama(); 
			}

		}); 
	});
	$(function() {
	});
</script>

</html>