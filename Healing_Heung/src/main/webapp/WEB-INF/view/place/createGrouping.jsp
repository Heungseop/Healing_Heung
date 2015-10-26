<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dto.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관광지</title>
</head>
<body>

	<ul>
		<%
			response.setHeader("Access-Control-Allow-Origin", "*");
			if (request.getAttribute("allPlace") != null) {
				List<Place> placeList = (List<Place>) request.getAttribute("allPlace");
				for (int i = 0; i < placeList.size(); i++) {
					Place p = placeList.get(i);
		%>
		<li><%=p.getPlaceName()%></li>
		<%
			}
			}
		%>
	</ul>
	<c:set value="다음" var="keyword"></c:set>
	<input type="hidden" id="list">





</body>
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=8db10793985b77516d67e5101b49f26e&libraries=services"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	var places = new daum.maps.services.Places();
	
	var callback = function(status, result) {
		if (status === daum.maps.services.Status.OK) {
			console.log(result.places[0].title);
			var list = result;
			$(function(){

				var url = "<%=request.getContextPath()%>/createGrouping";
				$.ajax({
					url : url,
					data : list,
					success : function(response) {
						console.log(response);
						if (response["result"] == "success") {
							console.log("ajax success");
						} else {
							alert(response["msg"]);
						}
					},
					error : function() {
						console.log("ajax fail..");
					}
				});
		});
		}
	}
	for (var j = 0; j < 5; j++) {
		console.log("j : " + j);
	}
	places.keywordSearch('판교 치킨', callback);
	
	/* 

	$(function(){

	 var keyword = '${keyword}';
	 var url = "https://apis.daum.net/search/image";
	 $.ajax({
	 url : url,
	 data : {
	 apikey : '8db10793985b77516d67e5101b49f26e',
	 q : keyword,
	 output : 'json'
	 },
	 success : function(response) {
	 console.log(response);
	
	
	 },
	 error : function() {
	 console.log("ajax fail..");
	 }
	
	 });
	
	 }); */
	 
	 
</script>
</html>