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
<body>
	
	<div id="place_main">
	<h2>관광지 소개</h2>
	<hr>
	<%-- <a href="<%=request.getContextPath()%>/createGrouping">createGrouping</a> --%>
	<br>
	
	<%
		if (request.getAttribute("allPlace") != null) {
			List<Place> placeList = (List<Place>) request.getAttribute("allPlace");
			
			String firstImg ="null";
			String firstfileImg ="null";
			List<String> ImageUrl = null;
			List<String> ImageFileUrl = null;
			
			boolean ImageUrlCheck =false;
			for (Place p : placeList) {
				if(p.isPlaceCert()){
					firstImg ="null";
					firstfileImg ="null";
					
					ImageUrl = p.getImageUrlUrl();
					ImageFileUrl = p.getImageFileUrl();
					
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
				
				int placeNo = p.getPlaceNo();
	%>

	<div class="placeclass">
		<a href="<%=request.getContextPath()%>/place_detail?placeNo=<%=placeNo %>">
		
			<%if(firstImg !="null")
			{ 
			%>
			<img class="placeclass" src="<%=firstImg%>"  alt="이미지가 잘못되었거나 URL경로가 다릅니다." />
			
			<% 
			
			}else if(firstfileImg !="null"){
			%>
			<img class="placeclass" src="<%=request.getContextPath()%>/upload/<%=firstfileImg%>"  alt="이미지 파일이 잘못 되었습니다." />
			<%
			}else {
			%>
			<img class="placeclass" src="#"  alt="이미지를 등록 하지 않았습니다." />
			<%	
			}
			%>
		</a><br>
		 <div class="placeinfo">
		
		작성자 아이디 : <%=p.getMemberId()%>
		<br>   
		관광지 이름 : <%=p.getPlaceName()%>
		<br>   추천 수 :
		<%=p.getLike()%>
		</div>
		<br>
	</div>
	<%
				}
			}
		}else {
			%>
			<h3>해당 관광지가 없습니다. </h3>		
		<% 
			}
		%>
			<br>
		</div>
			<br>

</body>

<script type="text/javascript">
</script>
</html>