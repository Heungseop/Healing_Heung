<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dto.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관광지 내용</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/place_detail.css">
</head>
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
    rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=8db10793985b77516d67e5101b49f26e&libraries=services"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>


<body>

	<%!
		Object loginObject;
		Member loginMember;
		
		
	%>
	<%
		if (request.getAttribute("place") != null) {
			Object obj = request.getAttribute("place");
			Place p = (Place) obj;
			List<String> ImageUrllist = p.getImageUrlUrl();
			List<String> ImageFilelist = p.getImageFileUrl();
			String addr = p.getPlaceAddress();

	%>

	<c:set value="<%=p.getPlaceNo()%>" var="placeNo"></c:set>
	<c:set value="<%=p.getPlaceName()%>" var="placeAddr"></c:set>
	<c:set value="<%=p.getPlacePositionX()%>" var="placePositionX"></c:set>
	<c:set value="<%=p.getPlacePositionY()%>" var="placePositionY"></c:set>
	<div id="place_detail">
	<div id="likediv">
	추천하기
	<div style="display: block; text-align: right;">
		<input type="image"
			src="<%=request.getContextPath()%>/resources/like.jpg" id="like">
		
		<div id="displayLike"><%=p.getLike()%></div>

	</div>
	</div>

		<br>
		<div>
			<h2><%=p.getPlaceName()%></h2>
				<hr>
		</div>

		<div>
			<h4 id="addr">
				<!-- 위치 : -->
				<%=p.getPlaceAddress()%></h4>
		</div>
		<div>
			<h4>
				<!-- 전화번호 : -->
				<%
				if (p.getPlacePhone() == null) {
			%>
				전화번호 : 미공개
				<%
				} else {
			%>
				<%=p.getPlacePhone()%>
				<%
					}
				%>
			</h4>
		</div>
		<div>
			
			<!-- <h2>상세 내용 :</h2> -->
			<h4><br><%=p.getPlaceComment()%></h4>
		</div>

		<br>
			<hr>
		
		<div id="place_detail_img" data-nav='thumbs'>
		
			<!-- <h3>관광지 사진</h3> -->
			
			<%
				if (ImageUrllist.size() != 0) {
					for (String url : ImageUrllist) {
						if(url !=null){
	
			%>	
			
					
			<img class="place_detail_imgs" src="<%=url%>" alt="이미지 URL 경로가 잘못 되었습니다." /><br>
			<%
					}	
				}
			}
			
				if (ImageFilelist.size() != 0) {
					for (String url : ImageFilelist) {
						if(url !=null){
			%>
			
			<img class="place_detail_imgs" src="<%=request.getContextPath()%>/upload/<%=url%>" alt="이미지 파일이 잘못 되었습니다."/><br>
			<%
			
					}	
				}
			}
				
				
				if(ImageUrllist.size() + ImageFilelist.size() == 0 ) {
			%>
        
			<br>
			<h2>등록된 사진이 없습니다.</h2>
			<br>   <hr>    
    		
			<%
				}
			%>
		 	</div>
		 
		 	<hr>	
			<h3>검색 이미지 </h3>
    		<div id="fr" style="display: inline-block;"> </div>  
    
			<br>
			<hr>
			<h3>지도</h3>
			
			<div id="map"></div>
			<br>
			
		
			<%
			loginObject =session.getAttribute("login");
			if(loginObject !=null && loginObject instanceof Member ){
				loginMember=(Member)loginObject;
			
			
			if(!p.isPlaceCert() && (p.getMemberId().equals(loginMember.getMemberId()) || loginMember.getMemberId().equals("admin")) ){
			%>
			<a href="<%=request.getContextPath()%>/place_change?placeNo=<%=p.getPlaceNo()%>"><button id="placeFalse">관광지 수정</button></a>	
			<br><br>
			<% 	
				}
				
				
			if(!p.isPlaceCert()){
				
				if(loginMember.getMemberId().equals("admin") ){ 
			%>		
				<a href="<%=request.getContextPath()%>/place_certUpdate?placeNo=<%=p.getPlaceNo()%>"><button id="certChangeTrueButton">승인</button></a>	
				<br><br>

			<% 		
				}
				
				}
			
			%>
			<% 
			if(p.isPlaceCert() && (p.getMemberId().equals(loginMember.getMemberId()) || loginMember.getMemberId().equals("admin")) ){
			%>
			<a href="<%=request.getContextPath()%>/place_certFalse?placeNo=<%=p.getPlaceNo()%>"><button id="placeFalse">등록 취소</button></a>	
			<br><br>
			<% 	
				}
			}
			%>
			
	</div>

	<%
		} else {
	%>
	해당되는 관광지가 없습니다.
	<%
		}
	%>
</body>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<script src="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.5.1/fotorama.js"></script>

<script>
$(function(){

	$("#like").on("click",function(){
		var placeNo = ${placeNo};
		var $target = $("#displayLike");
		var url = "<%=request.getContextPath()%>/place_like";
		$.ajax({
			url : url,
			data : {
				placeNo : placeNo
			},
			success : function(response) {
				console.log(response);
				if (response["result"] == "success") {
					$target.html(response["like"]);
					alert("추천이 성공적으로 되었습니다.")
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

	var pointx = 33.450701;
	var pointy = 126.570667;
	var places = new daum.maps.services.Places();

	var callback = function(status, result) {
		if (status === daum.maps.services.Status.OK) {
			console.log(result);

			pointx = result.places[0].latitude;
			pointy = result.places[0].longitude;
		}else{
			pointx='${placePositionX}';
			pointy='${placePositionY}';
		}
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {


				center : new daum.maps.LatLng(pointx, pointy), // 지도의 중심좌표
				level : 5, // 지도의 확대 레벨
				mapTypeId : daum.maps.MapTypeId.ROADMAP
			// 지도종류
			};

			// 지도를 생성한다 
			var map = new daum.maps.Map(mapContainer, mapOption);
			// 지도에 마커를 생성하고 표시한다
			var marker = new daum.maps.Marker(
					{
						position : new daum.maps.LatLng(pointx, pointy), // 마커의 좌표
						draggable : false, // 마커를 드래그 가능하도록 설정한다
						map : map
					// 마커를 표시할 지도 객체

					});

			////////////////////////////////////
			// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
			var iwContent = '<div style="padding:5px;">${placeAddr}</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

			// 인포윈도우를 생성합니다
			var infowindow = new daum.maps.InfoWindow({
				content : iwContent,
				removable : iwRemoveable
			});

			infowindow.open(map, marker);
			// 마커에 클릭이벤트를 등록합니다
			daum.maps.event.addListener(marker, 'click', function() {
				// 마커 위에 인포윈도우를 표시합니다
				infowindow.open(map, marker);
			});
			//////////////////////////////////////////////

			// 지도 타입 변경 컨트롤을 생성한다
			var mapTypeControl = new daum.maps.MapTypeControl();

			// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
			map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

			// 지도에 확대 축소 컨트롤을 생성한다
			var zoomControl = new daum.maps.ZoomControl();

			// 지도의 우측에 확대 축소 컨트롤을 추가한다
			map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

			// 지도 중심 좌표 변화 이벤트를 등록한다
			daum.maps.event.addListener(map, 'center_changed', function() {
				console.log('지도의 중심 좌표는 ' + map.getCenter().toString()
						+ ' 입니다.');
			});
		        $.ajax({
		            url : "http://apis.daum.net/search/image",
		            dataType : "jsonp",
		            type : "post",
		            jsonp : "callback",
		            data : {
		                apikey : "8db10793985b77516d67e5101b49f26e", //다음 API KEY 입력
		                q : "${placeAddr}",             // search keyword
		                result : "20",                 // result set length
		                pageno : $("#pageno").val(),   // pageNo
		                output : "json"                // JSONP type format json
		            },
		            success : function(r){
		                var list = r.channel.item;
		                var fr = "";
		                var place_detail_img =$("#place_detail_imgs");
		                console.log(place_detail_img);
		                
		                for(var i in list) {
		                    fr += "<a href=\""+ list[i].image +"\">"+
		                          "<img src=\""+ list[i].thumbnail +"\"></a>";
		                }
		                fr = "<div data-nav='thumbs'>" + fr + "</div>";
		                $("#fr").html(fr);
		                
		                $("#fr div").fotorama({width:720,height:480});

		                $("#pageno").val(parseInt($("#pageno").val())+1);
		                
	
		
			            $("#place_detail_img").fotorama({width:720,height:480});
			                
			               
		 
		            }
		        });
		        
	};
	
	places.keywordSearch('${placeAddr}', callback);
</script>
</html>