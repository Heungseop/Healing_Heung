<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="dto.*"%>
<%@page import="java.util.*"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sform"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/course_create.css">
<title>코스 수정</title>
</head>
<body>
	<div id="course_create_main">
		<h2>코스 수정</h2>
		<hr>
		<!-- /////////////////////////////////////////////////////////////////////////////////////////////// -->
		<div class="map_wrap">
			<div id="map" style="width: 100%; height: 100%; overflow: hidden;"></div>

		</div>
		<c:url value="/course_change" var="course_change"></c:url>
		<sform:form id="createCourseForm" method="post" action="${course_change}"
			enctype="multipart/form-data" class="form-horizontal"
			modelAttribute="course_change">
			<br>
			<div id="formtogeter">

	
		

				<div class="form-group">
					<sform:label path="courseName" class="col-lg-2 control-label">코스 이름 : </sform:label>
					<div class="col-lg-15">
						<div class="input-group">
							<sform:input path="courseName" id="courseName" name="courseName"
								type="text" class="form-control" />

							<div id="courseNameCheckButton" class="input-group-addon btn ">코스
								이름 체크</div>
						</div>
					</div>
				</div>
				<input id="placePositionX" 
					type="hidden" class="form-control"  />

				<input  id="placePositionY" 
					type="hidden" class="form-control"  />

			
				
				<input path="placeNoList" id="placeNoList" name="placeNoList" type="hidden"
					class="form-control"  value="0"/>

				<sform:input path="memberId" id="memberId" name="memberId" type="hidden"
					class="form-control"  value="0"/>
				

				<div class="form-group">
					<sform:label path="" class="col-lg-2 control-label">관광지 검색 : </sform:label>

					<div class="col-lg-15">
						<div class="input-group">
							<sform:input path="" id="placeName" name="placeName" type="text"
								class="form-control" readonly="true" />

							<div id="PlaceSearchButton" class="input-group-addon btn ">검색</div>
							<div id="PlaceAlretButton" class="input-group-addon btn ">관광지
								선택</div>
								
						</div>
					</div>
					<div>
					<h5>기존 장소 리스트 :</h5>
					<%
					Course c = (Course)request.getAttribute("course_change");
					if(c !=null){
						List<Place> plist = c.getPlaceList();
						for(int i=0; i<plist.size(); i++){
					%>	
							<h5><%=plist.get(i).getPlaceName()%> </h5>
					<% 
						}
					}
					
					
					%>
					
					</div>
				</div>
				<div class="form-group">
					<sform:label path="courseDistance" class="col-lg-2 control-label">코스 총 거리 : </sform:label>

					<div class="col-lg-15">
						<div class="input-group">
							<sform:input path="courseDistance" id="courseDistance" name="courseDistance" type="text"
								class="form-control" readonly="true" />
							단위 : Km
							
						</div>
					</div>
					
				</div>
				<div class="form-group">
					<sform:label path="courseCost" class="col-lg-2 control-label">코스 비용 : </sform:label>

					<div class="col-lg-15">
						<div class="input-group">
							<sform:input path="courseCost" id="courseCost" name="courseCost" type="text"
								class="form-control"  />
							단위 : 원
							
						</div>
					</div>
					
				</div>
			
				<div class="form-group">
						<sform:label path="courseComment" class="col-lg-2 control-label">상세 설명 :</sform:label>
				<div id="courseCommentdiv">		
						<div class="col-lg-10">
							<sform:textarea path="courseComment" name="courseComment" id="courseComment" type="text"
								class="form-control" />
						</div>
					</div>
				</div>
				<sform:input path="courseNo" id="courseNo" name="courseNo" type="hidden" />
				
						<hr>
						<br>
						<sform:button id="submit">수정</sform:button>
						
						&nbsp;&nbsp;&nbsp;&nbsp;<button id="cancel">취소</button>
			</div>
			
		</sform:form>

	</div>
</body>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.validate.js"></script>
<script >
$(function() {
	
	var child;
	var i = 0;
 	var placeName ="null";
 	var courseNameCheck =false;
 	
 	$.validator.addMethod("numbercheck", function(value, element) {
		return this.optional(element)
				|| /^[0-9]*$/.test(value);

	});
 	
 	//발리데이트 플러그인
	$("#createCourseForm").validate({
		rules : {
			courseCost : {
				required : true,
				maxlength : 9,
				notEqual : '0',
				numbercheck : true
			},
			courseComment : {
				required : true,
			}
			
		},
		messages : {
			courseCost : {
				required : "코스 비용을 입력해주세요.",
				maxlength : "코스 비용은 10억을 넘길 수 없습니다.",
				notEqual : "코스 비용을 입력해주세요.",
				numbercheck : "코스는 숫자만 입력가능합니다."
			},
			courseComment : {
				required : "코스 내용을 입력해주세요.",
			}
			
		
		}

	});
 	
	
	$("#PlaceSearchButton").on("click",function(){
	
		child = window.open('<%=request.getContextPath()%>/course_place_search', 
				'', 
				'left=200, top=200, width=400, height=480, scrollbars=no, status=no, resizable=no, fullscreen=no, channelmode=no'
				);	

	});

	$("#cancel").on("click",function(event){
		event.preventDefault();
		var url = "<%=request.getContextPath()%>/home";    
		$(location).attr('href',url);
	});
	
	$("#submit").on("click",function(event){
		
		
		
		
		if(!placeTwoTrueCheck){
			event.preventDefault();
			alert("두개 이상의 관광지를 등록해주세요.");
			return false;
		}
		
		  if(!courseNameCheck){
			event.preventDefault();
			alert("코스 이름 체크를 해주세요.");
			return false;
		}  
		
		
	});
	$("#courseNameCheckButton").on("click",function(){
		event.preventDefault();
		var $courseName = $("#courseName").val();
		if($courseName ==""){
			alert("코스 이름을 입력해주세요.");
			return false;
		}else{
			
			var url = "<%=request.getContextPath()%>/course_update_name_check_ajax";
			
			 $.ajax({
					type : "get",
					url : url,
					data : {
						courseName : $courseName,
						courseNo : $("#courseNo").val()
					},
					success : function(response) {
						
						console.log(response);
						
						if (response["result"] == "success") {
						
							alert(response["success"]);
							courseNameCheck =true;
							
						}else{
							console.log(response["fail"]);
							alert(response["fail"]);
						}
				
					},
					error : function() {
						console.log("ajax fail..");
					}
					
				});  //2번쨰 ajax
	
			
		}
		
	});
	
	$("#courseName").on("focus",function(){
		courseNameCheck =false;
	});
	
	
	$("#PlaceAlretButton").on("click", addpoint);
	
	
	

});
	
</script >
<script  src="//apis.daum.net/maps/maps3.js?apikey=8db10793985b77516d67e5101b49f26e&libraries=services"></script>
<script>


	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	mapOption = {
		center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};

	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	var drawingFlag = false; // 선이 그려지고 있는 상태를 가지고 있을 변수입니다
	var clickLine // 마우스로 클릭한 좌표로 그려질 선 객체입니다
	var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
	var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.
	var points;
	var placeNames ;
	var bounds = new daum.maps.LatLngBounds();  
	var first = true;
	var placeTwoTrueCheck =false;
	var mapinit = function(){

		console.log("mapinit");
		// 상태를 true로, 선이 그리고있는 상태로 변경합니다

		// 지도 위에 선이 표시되고 있다면 지도에서 제거합니다
		deleteClickLine();

		// 지도 위에 커스텀오버레이가 표시되고 있다면 지도에서 제거합니다
		deleteDistnce();

		// 지도 위에 선을 그리기 위해 클릭한 지점과 해당 지점의 거리정보가 표시되고 있다면 지도에서 제거합니다
		deleteCircleDot();

		console.log("mapinit before clickLine create");
		// 클릭한 위치를 기준으로 선을 생성하고 지도위에 표시합니다
		first = true;
		
		console.log("mapinit finish");
	};
	
	
	var addpoint = function(){
		
		
		console.log("addpoint");
		console.log("placeNo = ",$("#placeNoList").val());
		console.log("placeName = ",$("#placeName").val());
		
		
		
		if(placeName ==$("#placeName").val()){
			alert("동일한 관광지를 선택 하셨습니다.");
			return false;
		}
		if($("#placeNoList").val() == 0){
			alert("관광지 검색을 먼저 해주세요.");
			return false;
		}
		
		$("#placePositionY").after('<input  path="placeNoList" id="placeNoList" type="hidden" name="placeNoList"  class="form-control" />');
		
		
		
		
		
		placeName = $("#placeName").val();
		
		
		if($("#placeNoList").val()!='0'){
		var position = new daum.maps.LatLng($("#placePositionX").val(), $("#placePositionY").val());
		console.log("position = ", position);
		
		if(first){
			console.log("if(first)");
		clickLine = new daum.maps.Polyline({
			map : map, // 선을 표시할 지도입니다 
			path : [ position ], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
			strokeWeight : 3, // 선의 두께입니다 
			strokeColor : '#db4040', // 선의 색깔입니다
			strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
			strokeStyle : 'solid' // 선의 스타일입니다
		});
		points=[position];
		placeNames = [placeName];
		
	//	 map.panTo(position);
		console.log("end if");
		first = false;
	}else{
		placeTwoTrueCheck =true;
		console.log("fisrt = false");
		points.push(position);
		placeNames.push($("#placeName").val());
		        
		// 그려지고 있는 선의 좌표 배열을 얻어옵니다
		var path = clickLine.getPath();

		// 좌표 배열에 클릭한 위치를 추가합니다
		path.push(position);

		// 다시 선에 좌표 배열을 설정하여 클릭 위치까지 선을 그리도록 설정합니다
		clickLine.setPath(path);

		var distance = Math.round(clickLine.getLength());
		displayCircleDot(position, distance);
		
		testfinishfunc();
	//	 map.panTo(position);
		}
		var path = clickLine.getPath();

		  // 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
//	for (var i = 0; i < path.length; i ++) {
        var marker;
        marker = new daum.maps.Marker({ 
        	position : position,
        	title: placeName
        });
        marker.setMap(map);
        
        var iwContent = '<div class="customoverlay">' +
        '  <span class="title">'+placeName+'</span>' +'</div>';

        var customOverlay = new daum.maps.CustomOverlay({
            position : position, 
            content : iwContent 
        });

        
        customOverlay.setMap(map);
	//}
        bounds.extend(position);
            map.setBounds(bounds);
		console.log("end addpoint");
	}
	
	}
	//지도에 마우스 오른쪽 클릭 이벤트를 등록합니다
	//선을 그리고있는 상태에서 마우스 오른쪽 클릭 이벤트가 발생하면 선 그리기를 종료합니다
var testfinishfunc = function(){
	
			// 마우스 클릭으로 그린 선의 좌표 배열을 얻어옵니다
			var path = clickLine.getPath();

			// 선을 구성하는 좌표의 개수가 2개 이상이면
			if (path.length > 1) {

		
				var distance = Math.round(clickLine.getLength()); // 선의 총 거리를 계산합니다
				content = getTimeHTML(distance); // 커스텀오버레이에 추가될 내용입니다

				// 그려진 선의 거리정보를 지도에 표시합니다
				showDistance(content, path[path.length - 1]);

			} else {

				// 선을 구성하는 좌표의 개수가 1개 이하이면 
				// 지도에 표시되고 있는 선과 정보들을 지도에서 제거합니다.
				deleteClickLine();
				deleteCircleDot();
				deleteDistnce();
			}

	};

	//클릭으로 그려진 선을 지도에서 제거하는 함수입니다
	function deleteClickLine() {
		if (clickLine) {
			clickLine.setMap(null);
			clickLine = null;
		}
	}

	//마우스 드래그로 그려지고 있는 선의 총거리 정보를 표시하거
	//마우스 오른쪽 클릭으로 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 생성하고 지도에 표시하는 함수입니다
	function showDistance(content, position) {

		if (distanceOverlay) { // 커스텀오버레이가 생성된 상태이면

			// 커스텀 오버레이의 위치와 표시할 내용을 설정합니다
			distanceOverlay.setPosition(position);
			distanceOverlay.setContent(content);

		} else { // 커스텀 오버레이가 생성되지 않은 상태이면

			// 커스텀 오버레이를 생성하고 지도에 표시합니다
			distanceOverlay = new daum.maps.CustomOverlay({
				map : map, // 커스텀오버레이를 표시할 지도입니다
				content : content, // 커스텀오버레이에 표시할 내용입니다
				position : position, // 커스텀오버레이를 표시할 위치입니다.
				xAnchor : 0,
				yAnchor : 0,
				zIndex : 3
			});
		}
	}

	//그려지고 있는 선의 총거리 정보와 
	//선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 삭제하는 함수입니다
	function deleteDistnce() {
		if (distanceOverlay) {
			distanceOverlay.setMap(null);
			distanceOverlay = null;
		}
	}

	//선이 그려지고 있는 상태일 때 지도를 클릭하면 호출하여 
	//클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 표출하는 함수입니다
	function displayCircleDot(position, distance) {

		// 클릭 지점을 표시할 빨간 동그라미 커스텀오버레이를 생성합니다
		var circleOverlay = new daum.maps.CustomOverlay({
			content : '<span class="dot"></span>',
			position : position,
			zIndex : 1
		});

		// 지도에 표시합니다
		circleOverlay.setMap(map);

		if (distance > 0) {
			// 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
			var distanceOverlay = new daum.maps.CustomOverlay({
				content : '<div class="dotOverlay" style="background: gray; opacity:.8;border-radius: 2px; color:white;">거리 <span class="number">'
						+ distance + '</span>m</div>',
				position : position,
				yAnchor : 1,
				zIndex : 2
			});

			// 지도에 표시합니다
			distanceOverlay.setMap(map);
		}

		// 배열에 추가합니다
		dots.push({
			circle : circleOverlay,
			distance : distanceOverlay
		});
	}

	//클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 지도에서 모두 제거하는 함수입니다
	function deleteCircleDot() {
		var i;

		for (i = 0; i < dots.length; i++) {
			if (dots[i].circle) {
				dots[i].circle.setMap(null);
			}

			if (dots[i].distance) {
				dots[i].distance.setMap(null);
			}
		}

		dots = [];
	}

	//마우스 우클릭 하여 선 그리기가 종료됐을 때 호출하여 
	//그려진 선의 총거리 정보와 거리에 대한 도보, 자전거 시간을 계산하여
	//HTML Content를 만들어 리턴하는 함수입니다
	function getTimeHTML(distance) {

		// 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
		var walkkTime = distance / 67 | 0;
		var walkHour = '', walkMin = '';

		// 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
		if (walkkTime > 60) {
			walkHour = '<span class="number">' + Math.floor(walkkTime / 60)
					+ '</span>시간 '
		}
		walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'

		// 자전거의 평균 시속은 16km/h 이고 이것을 기준으로 자전거의 분속은 267m/min입니다
		var bycicleTime = distance / 227 | 0;
		var bycicleHour = '', bycicleMin = '';
		
		
		var carTime = distance / 1135 | 0;
		var carHour = '', carMin = '';
		if (carTime > 60) {
			carHour = '<span class="number">' + Math.floor(carTime / 60)
					+ '</span>시간 '
		}
		carMin = '<span class="number">' + carTime % 60 + '</span>분'

		// 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
		if (bycicleTime > 60) {
			bycicleHour = '<span class="number">'
					+ Math.floor(bycicleTime / 60) + '</span>시간 '
		}
		bycicleMin = '<span class="number">' + bycicleTime % 60 + '</span>분'

		// 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
		var content = '<div style="background: gray; opacity:.8;border-radius: 5px; color:white;"><ul class="dotOverlay distanceInfo">';
		content += '    <li>';
		content += '        <span class="label">총거리</span><span class="number">'
				
				+ distance/1000 + '</span>km';
				
				
		content += '    </li>';
		content += '    <li>';
		content += '        <span class="label">자동차</span>' + carHour + carMin;
		content += '    </li>';
		content += '    <li>';
		content += '        <span class="label">자전거</span>' + bycicleHour
				+ bycicleMin;
		content += '    </li>';
		content += '</ul></div>'
		$("#courseDistance").val(distance/1000);
		return content;
	}
	
	mapinit();
	
</script>
</html>