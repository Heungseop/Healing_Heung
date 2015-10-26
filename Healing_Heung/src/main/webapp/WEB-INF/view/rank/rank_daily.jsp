<%@page import="dto.Rank"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dto.*"%>
<%@page import="java.util.*"%>
<%@page import="com.google.gson.Gson"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/rank_list.css">
<style>
</style>
<body>
	<%
		List<Course> daily = (List<Course>) request.getAttribute("daily");

	Gson gson = new Gson();
	String test = gson.toJson(daily);
	%>
	<div class="whole">
	<div class="rankingTitle block"><h1>코스 랭킹</h1></div>
		<div class="select">
			<ul class="rankul">
				<li class="on"><a
					href="<%=request.getContextPath()%>/rank_daily"> <img alt=""
						src="<%=request.getContextPath()%>/resources/tab_best01.gif"></a>
				<li><a href="<%=request.getContextPath()%>/rank_weekly"><img
						alt=""
						src="<%=request.getContextPath()%>/resources/tab_best02.gif"></a>
				<li><a href="<%=request.getContextPath()%>/rank_monthly"><img
						alt=""
						src="<%=request.getContextPath()%>/resources/tab_best03.gif"></a>
			</ul>

		</div>
		<hr>
		<div class="mid">
			<%
				for (int i = 0; i < daily.size(); i++) {
					Course c = daily.get(i);
			%>
			<div class="course block">
				<div class="coursetop">
					<div class="courserank block"><%=(i + 1)%>위
					</div>
					<div class="courselike block">
						<img id="likeimg" src="<%=request.getContextPath()%>/resources/like.jpg">
						<%=c.getCourseLike() %>
					</div>
				</div>
				<div class="coursemid">
				<a href="<%=request.getContextPath()%>/course_detail?courseNo=<%=c.getCourseNo()%>">
					<div class="map_wrap" style="text-align: center;">
						<div id="<%=i%>map" class="block map"></div>
					</div></a>
				</div>
				<div class="coursebot">
					<div style="text-align:center;">
						<%=c.getCourseName()%>
					</div>
				</div>

			</div>
			<%
				}
			%>
		</div>


	</div>
</body>

<script
	src="//apis.daum.net/maps/maps3.js?apikey=8db10793985b77516d67e5101b49f26e&libraries=services"></script>

<script src="http://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript">

var list =<%=test%>	;
var clickLine;
$.each(list, function(index, course) {

	var bounds = new daum.maps.LatLngBounds();
	var mapContainer = document.getElementById(index + 'map'), // 지도를 표시할 div  
	mapOption = {
		center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level : 3,
		draggable :false
	// 지도의 확대 레벨
	};

	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	var points = 0;
	$.each(course.placeList, function(pindex, place) {
		var point = new daum.maps.LatLng(place.placePositionX,
				place.placePositionY);
		if (points == 0) {
			points = [ point ]
		} else {
			points.push(point);
		}
		bounds.extend(point);
		var marker;
		marker = new daum.maps.Marker({
			position : point,
			clickable : false
		});
		marker.setMap(map);
		var iwContent = '<div class="customoverlay">'
				+ '  <span class="title">' + place.placeName + '</span>'
				+ '</div>';

		var customOverlay = new daum.maps.CustomOverlay({
			position : point,
			content : iwContent
		});

        customOverlay.setMap(map);

	});

	map.setBounds(bounds);
	clickLine = new daum.maps.Polyline({
		map : map, // 선을 표시할 지도입니다 
		path : points, // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
		strokeWeight : 3, // 선의 두께입니다 
		strokeColor : '#db4040', // 선의 색깔입니다
		strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
		strokeStyle : 'solid' // 선의 스타일입니다
	});
});
</script>
</html>