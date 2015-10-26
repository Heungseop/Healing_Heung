<%@page import="org.springframework.web.multipart.MultipartFile"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dto.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 관광지 정보</title>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/place_main.css">
</head>
<body>
	<%!
		Object loginObject;
		Member loginMember;
	%>
	
	
	<div id="place_main">

	<%
	loginObject =session.getAttribute("login");
	if(loginObject !=null && loginObject instanceof Member ){
		loginMember=(Member)loginObject;
	
	if(loginMember.getMemberId().equals("admin") ){ 
	%>
		<h2>승인이 필요한 관광지 정보 </h2>		
	<%
	
	}else{
	%>
		<h2>미 등록 된 관광지 정보 </h2>		
	<% 
		}
	}
	%>
	<hr>
	<br>
	<% 
		if (request.getAttribute("certFalsePlace") != null) {
			
			List<Place> placeList = (List<Place>) request.getAttribute("certFalsePlace");
			String firstImg ="null";
			String firstfileImg ="null";
			List<String> ImageUrl = null;
			List<String> ImageFileUrl = null;
			boolean ImageUrlCheck =false;
			for (Place p : placeList) {
				if(!p.isPlaceCert()){
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
		<a href="<%=request.getContextPath()%>/place_detail?placeNo=<%=placeNo%>">
			
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
		</div>
		<br>
	</div>
	<%
				}
			}
	
		}else{
	%>
		<h3>승인이 필요한 관광지가 없습니다. </h3>	
	<% 		
		}
	%>
		
		<br>
	</div>
		<br>


</body>
</html>