<%@page import="com.google.gson.JsonObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dto.*"%>
<%@page import="java.util.*"%>
<%@page import="com.google.gson.Gson"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>코스</title>
</head>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/course_main.css">
<body>
	<div id="whole">
		<%
			List<Course> allCourseList = null;
			if (request.getAttribute("allCourseList") != null) {
				allCourseList = (List<Course>) request.getAttribute("allCourseList");
				for (int i = 0; i < allCourseList.size(); i++) {

					Course c = allCourseList.get(i);
		%><a
			href="<%=request.getContextPath()%>/course_detail?courseNo=<%=c.getCourseNo()%>">
			<div id="<%=i%>block" class="courseBox block gray">
				<span class="name" id="<%=i%>span"><h4><%=c.getCourseName()%></h4></span>
				<div class="map_wrap" style="text-align: center;">
					<div id="<%=i%>map" class="block map"></div>

				</div>

				<div class="block bot" id="box">
					작성자 아이디 :
					<%=c.getMemberId()%><br> 코스 번호 :
					<%=c.getCourseNo()%><br> 추천 수 :
					<%=c.getCourseLike()%><br> 코스 순서 :
					<%
					List<Place> plist = c.getPlaceList();
							for (int j = 0; j < plist.size(); j++) {
								Place p = plist.get(j);
								if (j > 0) {
				%>
					->
					<%
					} else if (plist.size() < 4) {
				%>
					<br>
					<%
						}
					%>
					<strong><%=p.getPlaceName()%></strong>
					<%
						}
					%>
					<br>

				</div>
			</div>
		</a>
		<%
			}

			} else {
		%>
		<h3>등록된 코스가 없습니다.</h3>
		<%
			}
			Gson gson = new Gson();
			String test = gson.toJson(allCourseList);
		%>

	</div>
</body>

<script
	src="//apis.daum.net/maps/maps3.js?apikey=8db10793985b77516d67e5101b49f26e&libraries=services"></script>

<script src="http://code.jquery.com/jquery-latest.js"></script>

<script
	src="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.5.1/fotorama.js"></script>

<script type="text/javascript">
	$(function() {
		$("#ranking").fotorama();
	});
	var list =<%=test%>;
	var clickLine;
	console.log("allCourseList : ", list);
	$.each(list, function(index, course) {

		var bounds = new daum.maps.LatLngBounds();
		var mapContainer = document.getElementById(index + 'map'), // 지도를 표시할 div  
		mapOption = {
			center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3,
			draggable : false
		// 지도의 확대 레벨
		};

		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		var points = 0;
		$.each(course.placeList, function(pindex, place) {
			var point;
		/* 	 if (place.placePositionX == 0) {
				var places = new daum.maps.services.Places();

				places.keywordSearch(place.placeName, function(status, result) {
					if (status === daum.maps.services.Status.OK) {
						console.log(result);
						point = new daum.maps.LatLng(result.places[0].latitude,
								result.places[0].longitude);
						
					}
				});

			} else {  */
				point = new daum.maps.LatLng(place.placePositionX,
						place.placePositionY);
	//		}
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