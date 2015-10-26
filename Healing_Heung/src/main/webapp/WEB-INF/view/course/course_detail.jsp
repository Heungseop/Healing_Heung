<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dto.*"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.google.gson.Gson"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>코스 내용</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/course_detail.css">

</head>
<body>
	<%!
	Object loginObject;
	Member loginMember;
	%>
	<%Course c = null;
	  int k =0;
		if (request.getAttribute("course") != null) {
			c = (Course) request.getAttribute("course");
			k=0;
		 	List<Place> plist = c.getPlaceList();
		}
	%>
	<c:set value="<%=c.getCourseNo()%>" var="courseNo"></c:set>
	<div id="course_detail">
	<div id="likediv">
	  추천하기
	<div style="display: block; text-align: right;">
		<input type="image"
			src="<%=request.getContextPath()%>/resources/like.jpg" id="like">
		
		<div id="displayLike"><%=c.getCourseLike()%></div>
      
	</div>
	</div>
	
	
		<h2><%=c.getCourseName()%></h2>
		<hr>
		<div>
		<h3>총 비용 : <%=c.getCourseCost() %> 원</h3><br>
		<h3>총 거리 : <%=c.getCourseDistance() %> Km</h3><br>
		<h3>코스 순서 :</h3>
				<%
				List<Place> plist = c.getPlaceList();
				for(int j =0;j<plist.size();j++){
					Place p =plist.get(j);
				%>	
					<h4 id="h4text">
				<%	
					
					if(j>0){ %> 
					-> 
					<%} else if (plist.size()<4){%>	
					<br><%} %>
					<strong><%=p.getPlaceName() %></strong></h4>
				<%
				}
				%>
		<br>		
		<h2>코스 내용</h2>
		<%
		if(c.getPlaceList() !=null){
 	
				if(c.getCourseComment() !=null){
			%>		 
			 	 <h3><%=c.getCourseComment() %></h3><hr>
			<% 			
				}else{
			%> 	
				  <h3>내용이 없습니다.</h3><hr>	
			<% 
				}
			
		 	
		 	for(int j =0;j<plist.size();j++){
				
				Place p =plist.get(j);
				
				List<String> ImageUrl = p.getImageUrlUrl();
				List<String> ImageFileUrl = p.getImageFileUrl();
	
				String firstImg ="null";
				String firstfileImg ="null";
	
				boolean ImageUrlCheck =false;
		
						firstImg ="null";
						firstfileImg ="null";
		
						for(int i=0; i<ImageUrl.size(); i++){
							if(ImageUrl.get(i) != null){
								firstImg = ImageUrl.get(i);	
								break;
							}
						}
						
						for(int i=0; i<ImageFileUrl.size(); i++){
							if(ImageFileUrl.get(i) !=null){
								firstfileImg = ImageFileUrl.get(i);				
								break;
							}
						}
			   %>
			<div id="place_detail_info">
				<input id="place_name_<%=k%>" type="hidden" value="<%=p.getPlaceName()%>" ></input>
							
				<h3>장소 이름 : <%=p.getPlaceName() %></h3><br>
			    <h3>장소 내용 : </h3><h4><%=p.getPlaceComment() %></h4><br>
			
			
			
			</div>  
			
			
			 
			  <div id="place_detail_img_<%=k%>" data-nav='thumbs'>
		
			<!-- <h3>관광지 사진</h3> -->
			
			<%
				if (ImageUrl.size() != 0) {
					for (String url : ImageUrl) {
						if(url !=null){
	
			%>	
			
					
			<img class="place_detail_imgs" src="<%=url%>" alt="이미지 URL 경로가 잘못 되었습니다." /><br>
			<%
					}	
				}
			}
			
				if (ImageFileUrl.size() != 0) {
					for (String url : ImageFileUrl) {
						if(url !=null){
			%>
			
			<img class="place_detail_imgs" src="<%=request.getContextPath()%>/upload/<%=url%>" alt="이미지 파일이 잘못 되었습니다."/><br>
			
			
			<%
			
					}	
				}
			}
			%>
			</div>	
			<% 
				if(ImageUrl.size() + ImageFileUrl.size() == 0 ) {
			%>
        
			<br>
			<h3>등록된 사진이 없습니다.</h3>
			<br>   
    		<h3>'<%=p.getPlaceName() %>' 로 검색한  이미지 </h3>
    		<div id="fr_<%=k%>" style="display: inline-block;"> </div>  
    	
			
			<br>
			<%
				}
			%>
			<hr>		 	
			 			
						
			<%
			  k++;
			}
		
		}else{
	  %>
	  	관광지가 없습니다.	
	  <% 
		}
	  %>
	    <h3>관광 경로 </h3>
	  <% 
	  %>
	
	  <div id= "block" class="courseBox block gray">
			<span class="name" id="span"></span>
			<div class="map_wrap"style="text-align: center;">
				<div id="map" class = "block map"></div>

			</div>

		
				
				<br>
				
			</div>
		</div>
		<%
		
		 Gson gson = new Gson();
			String test = gson.toJson(plist);
		%>
		<%
			loginObject =session.getAttribute("login");
			if(loginObject !=null && loginObject instanceof Member ){
				loginMember=(Member)loginObject;
			
			
			if((c.getMemberId().equals(loginMember.getMemberId()) || loginMember.getMemberId().equals("admin")) ){
			%>
			<a href="<%=request.getContextPath()%>/course_change?courseNo=<%=c.getCourseNo()%>"><button id="placeFalse">코스 수정</button></a>	
			<br><br>
		<% 	
				}
			}
		%>
	  
		
		
		</div>
		
	
</body>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.5.1/fotorama.js"></script>
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=8db10793985b77516d67e5101b49f26e&libraries=services"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
<script>
$(function(){
	var placesize = "<%=k%>"
	var places = new daum.maps.services.Places();
	var callback = function(placeName,j) {
		console.log(j);
		
        $.ajax({
        	
        	
            url : "http://apis.daum.net/search/image",
            dataType : "jsonp",
            type : "post",
            jsonp : "callback",
            data : {
                apikey : "8db10793985b77516d67e5101b49f26e", //다음 API KEY 입력
                q : placeName,             // search keyword
                result : "20",                 // result set length
                pageno : $("#pageno").val(),   // pageNo
                output : "json"                // JSONP type format json
            },
            success : function(r){
            	console.log(j);
            	console.log(placeName);
                var list = r.channel.item;
                var fr = "";
                
                for(var i in list) {
                    fr += "<a href=\""+ list[i].image +"\">"+
                          "<img src=\""+ list[i].thumbnail +"\"></a>";
                }
                fr = "<div data-nav='thumbs'>" + fr + "</div>";
                $("#fr_"+j).html(fr);
                console.log("#fr_"+j);
                
                $("#fr_"+j+" div").fotorama({width:720,height:480});

                $("#pageno").val(parseInt($("#pageno").val())+1);
                

 
            }
        });
        
	};
	
	
	for(var i=0; i<placesize; i++){
		$("#place_detail_img_"+i).fotorama({width:720,height:480});
		$("#place_detail_img_"+i).css("display" ,"inline-block");
		places.keywordSearch($("#place_name_"+i).val(),callback($("#place_name_"+i).val(),i));
		
		
	}
	
	
	var list =<%=test%>	;
	var clickLine;
	console.log("allCourseList : ", list);
	

		var bounds = new daum.maps.LatLngBounds();
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		mapOption = {
			center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3,
			draggable :false
		// 지도의 확대 레벨
		};

		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		var points = 0;
		$.each(list, function(pindex, place) {
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
/* 		console.log("index : ", index);
		console.log("points : ", points);
		$("#" + index + "span")
				.after('<div>' + course.courseRegDate + '</div>');
 */
		clickLine = new daum.maps.Polyline({
			map : map, // 선을 표시할 지도입니다 
			path : points, // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
			strokeWeight : 3, // 선의 두께입니다 
			strokeColor : '#db4040', // 선의 색깔입니다
			strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
			strokeStyle : 'solid' // 선의 스타일입니다
		});
 	$("#block").on("mouseover", function(){
	 $("#map").css("opacity : .1");
 	});
 	
 	
 	$("#like").on("click",function(){
		var courseNo = ${courseNo};
		var $target = $("#displayLike");
		var url = "<%=request.getContextPath()%>/course_like";
		$.ajax({
			url : url,
			data : {
				courseNo : courseNo
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
</script>
</html>