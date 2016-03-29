<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dto.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관광지 전체</title>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/place_main.css">
</head>
<style>
/* div{
border : solid 1px;
} */
</style>
<body>

	<div id="place_main">
		<h2>관광지 소개</h2>
		<hr>
		<%-- <a href="<%=request.getContextPath()%>/createGrouping">createGrouping</a> --%>
		<br>

		<%
			if (request.getAttribute("allPlace") != null) {
				List<Place> placeList = (List<Place>) request.getAttribute("allPlace");

				String firstImg = "null";
				String firstfileImg = "null";
				List<String> ImageUrl = null;
				List<String> ImageFileUrl = null;

				boolean ImageUrlCheck = false;
				for (Place p : placeList) {
					if (p.isPlaceCert()) {
						firstImg = "null";
						firstfileImg = "null";

						ImageUrl = p.getImageUrlUrl();
						ImageFileUrl = p.getImageFileUrl();

						for (int i = 0; i < ImageUrl.size(); i++) {
							if (ImageUrl.get(i) != null) {
								firstImg = ImageUrl.get(i);
								break;
							}
						}

						for (int i = 0; i < ImageFileUrl.size(); i++) {
							if (ImageFileUrl.get(i) != null) {
								firstfileImg = ImageFileUrl.get(i);
								break;
							}
						}

						int placeNo = p.getPlaceNo();
		%>

		<div class="placeclass" >
			<a
				href="<%=request.getContextPath()%>/place_detail?placeNo=<%=placeNo%>">

				<%
					if (firstImg != "null") {
				%> <img class="placeclass" style ="margin: 0px" src="<%=firstImg%>"
				alt="이미지가 잘못되었거나 URL경로가 다릅니다." /> <%
 	} else if (firstfileImg != "null") {
 %> <img class="placeclass" style ="margin: 0px"
				src="<%=request.getContextPath()%>/upload/<%=firstfileImg%>"
				alt="이미지 파일이 잘못 되었습니다." /> <%
 	} else {
 %> <img class="placeclass" style ="margin: 0px"src="#" alt="이미지를 등록 하지 않았습니다." /> <%
 	}
 %>
			</a><br>
			<div class="placeinfo">
				<%=p.getPlaceName()%><br>
			</div>
		</div>

		<%
			}
				}
			} else {
		%>
		<h3>등록된 관광지가 없습니다.</h3>
		<%
			}
		%><span id="target"></span> <br>
	</div>
	<br>

</body>

<script type="text/javascript">
$(function(){
	var cnt = 2;
	var lastscroll = 0;
	$(window).scroll(function(){
		var winh = window.innerHeight;
		var doch = $(document).height()
		var url = "<%=request.getContextPath()%>/selectPlaceNine";
					console.log("innerheight : ", winh);
					console
							.log("$(document).height() : ", $(document)
									.height());
					console.log("$(window).scrollTop() : ", $(window)
							.scrollTop());
					console.log("(doch-winh) : ", (doch - winh));
					/* 
					console.log("$(window).height() : ",$(window).height());
					console.log("$(document).scrollTop() : ",$(document).scrollTop());
					 */
					if ($(window).scrollTop() >= (doch - winh) && $(window).scrollTop() != 0 && lastscroll != $(window).scrollTop()) {
						console.log("inner if//////////(doch-winh): ",
								(doch - winh));
						console.log("lastscroll : ", lastscroll);
						lastscroll = $(window).scrollTop();

						$.ajax({
							type : "post",
							url : url,
							data : {
								rnum : cnt
							},
							dataType : "json",
							success : function(list) {
								console.log("scrolltop in ajax function : ", $(window).scrollTop() )
								console.log("list : ", list);
								console.log("cnt : ", cnt);
								$.each(list, function(index, place) {

									var img = null;
									
									$.each(place.imageFileUrl, function(i, url) {
										if (url != null) {
											img = '<%=request.getContextPath()%>/upload/'+url;

										}
									});
									$.each(place.imageUrlUrl, function(i, url) {
										if (url != null) {
											img = url;
										}
									});
									var str = '<div class="placeclass" >';
									str += '<a href="<%=request.getContextPath()%>/place_detail?placeNo='+place.placeNo+'">';
									str += '<img class="placeclass" style ="margin: 0px" src="';
									if(img!=null){
										str+= img;
									}else {
										str += '#';
									}
									str += '"  alt="이미지 파일이 잘못 되었습니다." /></a>';
									str += '<div class="placeinfo" style="height = 500px;">';
									str += place.placeName + '</div><br><br></div>';
									$("#target").append(str);
									
								});

								console.log("test success function ");
								cnt++;
							}
						});
					}
				});
	});
</script>
</html>
