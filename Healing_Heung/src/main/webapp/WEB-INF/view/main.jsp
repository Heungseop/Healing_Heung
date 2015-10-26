<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main.css">

<div id="main">
<div id="healing"><marquee>안녕하세요. HEALING에 오신 것을 환영합니다.</marquee></div>

<div id="comment">
<br>저희 <font id="healing">HEALING</font>은 <font id="commentall">다양한 관광지 소개</font>와 
<font id="commentall">관광지를 이용한 코스 만들기</font>와 <font id="commentall">코스를 공유</font>하는 사이트입니다.
</div>
<br>
<div><img src="<%=request.getContextPath()%>/resources/바다.jpg" alt="main"><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;
<a href='<%=request.getContextPath()%>/place_groupping?groupDetail=서울'><img src="<%=request.getContextPath()%>/resources/subimage.jpg" alt="서울" id="imagebutton"></a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href='<%=request.getContextPath()%>/place_groupping?groupDetail=경기'><img src="<%=request.getContextPath()%>/resources/subimage6.jpg" alt="경기" id="imagebutton1"></a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href='<%=request.getContextPath()%>/place_groupping?groupDetail=강원'><img src="<%=request.getContextPath()%>/resources/subimage1.jpg" alt="강원" id="imagebutton2"></a>
&nbsp;&nbsp;&nbsp;&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;
<a href='<%=request.getContextPath()%>/place_groupping?groupDetail=경상'><img src="<%=request.getContextPath()%>/resources/subimage2.jpg" alt="경상" id="imagebutton3"></a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href='<%=request.getContextPath()%>/place_groupping?groupDetail=전라'><img src="<%=request.getContextPath()%>/resources/subimage3.jpg" alt="전라" id="imagebutton4"></a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href='<%=request.getContextPath()%>/place_groupping?groupDetail=충청'><img src="<%=request.getContextPath()%>/resources/subimage4.jpg" alt="충청" id="imagebutton5"></a>
&nbsp;&nbsp;&nbsp;&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;
<a href='<%=request.getContextPath()%>/place_groupping?groupDetail=제주'><img src="<%=request.getContextPath()%>/resources/subimage5.jpg" alt="제주" id="imagebutton6"></a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img src="<%=request.getContextPath()%>/resources/servicememo.jpg" alt="이용가이드">
</div>

</div>



<script>
	$(function(){

		$("#imagebutton").hover(function(){
			$(this).attr("src", $(this).attr("src").replace("<%=request.getContextPath()%>/resources/subimage.jpg", "<%=request.getContextPath()%>/resources/서울1.jpg")); 
		}, function(){ 
		$(this).attr("src", $(this).attr("src").replace("<%=request.getContextPath()%>/resources/서울1.jpg", "<%=request.getContextPath()%>/resources/subimage.jpg")); 
		});
		
		$("#imagebutton1").hover(function(){
			$(this).attr("src", $(this).attr("src").replace("<%=request.getContextPath()%>/resources/subimage6.jpg", "<%=request.getContextPath()%>/resources/경기1.jpg")); 
		}, function(){ 
		$(this).attr("src", $(this).attr("src").replace("<%=request.getContextPath()%>/resources/경기1.jpg", "<%=request.getContextPath()%>/resources/subimage6.jpg")); 
		});
		
		$("#imagebutton2").hover(function(){
			$(this).attr("src", $(this).attr("src").replace("<%=request.getContextPath()%>/resources/subimage1.jpg", "<%=request.getContextPath()%>/resources/강원1.jpg")); 
		}, function(){ 
		$(this).attr("src", $(this).attr("src").replace("<%=request.getContextPath()%>/resources/강원1.jpg", "<%=request.getContextPath()%>/resources/subimage1.jpg")); 
		});
		
		$("#imagebutton3").hover(function(){
			$(this).attr("src", $(this).attr("src").replace("<%=request.getContextPath()%>/resources/subimage2.jpg", "<%=request.getContextPath()%>/resources/경상1.jpg")); 
		}, function(){ 
		$(this).attr("src", $(this).attr("src").replace("<%=request.getContextPath()%>/resources/경상1.jpg", "<%=request.getContextPath()%>/resources/subimage2.jpg")); 
		});
		
		$("#imagebutton4").hover(function(){
			$(this).attr("src", $(this).attr("src").replace("<%=request.getContextPath()%>/resources/subimage3.jpg", "<%=request.getContextPath()%>/resources/전라1.jpg")); 
		}, function(){ 
		$(this).attr("src", $(this).attr("src").replace("<%=request.getContextPath()%>/resources/전라1.jpg", "<%=request.getContextPath()%>/resources/subimage3.jpg")); 
		});
		
		$("#imagebutton5").hover(function(){
			$(this).attr("src", $(this).attr("src").replace("<%=request.getContextPath()%>/resources/subimage4.jpg", "<%=request.getContextPath()%>/resources/충청1.jpg")); 
		}, function(){ 
		$(this).attr("src", $(this).attr("src").replace("<%=request.getContextPath()%>/resources/충청1.jpg", "<%=request.getContextPath()%>/resources/subimage4.jpg")); 
		});
		
		$("#imagebutton6").hover(function(){
			$(this).attr("src", $(this).attr("src").replace("<%=request.getContextPath()%>/resources/subimage5.jpg", "<%=request.getContextPath()%>/resources/제주1.jpg")); 
		}, function(){ 
		$(this).attr("src", $(this).attr("src").replace("<%=request.getContextPath()%>/resources/제주1.jpg", "<%=request.getContextPath()%>/resources/subimage5.jpg")); 
		});

	});
</script>