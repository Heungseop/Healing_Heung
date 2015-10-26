<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" type="text/css"
	href="<c:url value="/webjars/bootstrap/3.3.4/dist/css/bootstrap.min.css"/>">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/styles.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/header.css">

<header id="mainheader">



	<p>
	 <a href="<%=request.getContextPath()%>/home"><img id="logo" src="<%=request.getContextPath()%>/resources/logo.jpg"></a>
	 
<div id='cssmenu'>
<ul>
   <li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li>
   <li class='active has-sub'><a href='<%=request.getContextPath()%>/place_main'><span>관광지</span></a>
      <ul>
         <li class='has-sub'><a href='#'><span>지역별</span></a>
            <ul>
               <li><a href='<%=request.getContextPath()%>/place_groupping?groupDetail=서울'><span>서울</span></a></li>
               <li><a href='<%=request.getContextPath()%>/place_groupping?groupDetail=경기'><span>경기도</span></a></li>
               <li><a href='<%=request.getContextPath()%>/place_groupping?groupDetail=강원'><span>강원도</span></a></li>
               <li><a href='<%=request.getContextPath()%>/place_groupping?groupDetail=경상'><span>경상도</span></a></li>
               <li><a href='<%=request.getContextPath()%>/place_groupping?groupDetail=전라'><span>전라도</span></a></li>
               <li><a href='<%=request.getContextPath()%>/place_groupping?groupDetail=충청'><span>충청도</span></a></li>
               <li class='last'><a href='<%=request.getContextPath()%>/place_groupping?groupDetail=제주'><span>제주</span></a></li>
            </ul>
         </li>
         <li class='has-sub'><a href='#'><span>테마별</span></a>
            <ul>
               <li><a href='<%=request.getContextPath()%>/place_groupping?groupDetail=가족여행'><span>가족여행</span></a></li>
               <li><a href='<%=request.getContextPath()%>/place_groupping?groupDetail=우정여행'><span>우정여행</span></a></li>
               <li><a href='<%=request.getContextPath()%>/place_groupping?groupDetail=커플여행'><span>커플여행</span></a></li>
               <li class='last'><a href='<%=request.getContextPath()%>/place_groupping?groupDetail=단체여행'><span>단체여행</span></a></li>
            </ul>
         </li>
         <li class='has-sub'><a href='#'><span>기간별</span></a>
            <ul>
               <li><a href='<%=request.getContextPath()%>/place_groupping?groupDetail=당일'><span>당일</span></a></li>
               <li><a href='<%=request.getContextPath()%>/place_groupping?groupDetail=1박2일'><span>1박2일</span></a></li>
               <li class='last'><a href='<%=request.getContextPath()%>/place_groupping?groupDetail=2박3일'><span>2박3일</span></a></li>
            </ul>
         </li>
         <li class='divider'></li>
         <li><a href='<%=request.getContextPath()%>/place_groupping?groupDetail=맛집'><span>유명한 맛집</span></a></li>
         <li><a id="place_create" href='#'><span>관광지 추가</span></a></li>
      </ul>
   </li>
   <li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li>
   <li class='active has-sub'><a href='<%=request.getContextPath()%>/course_main'><span>코스</span></a>
   		<ul>
   		<li><a href='<%=request.getContextPath()%>/rank_daily'><span>코스 랭킹</span></a></li>
   		<li><a id="course_create" href='#'><span>코스 만들기</span></a></li>
		</ul>
	</li>
	<li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li>
   <li class='active'><a href='<%=request.getContextPath()%>/board_main?page=1'><span>코스 공유 게시판</span></a>
  
   </li>
</ul>
</div>
<br>
</header>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){

		$("#place_create").on("click",function(){
			
			
			var url = "<%=request.getContextPath()%>/place_create_ajax";
			var successurl ="<%=request.getContextPath()%>/place_create";
			$.ajax({
				type : "get",
				url : url,
				success : function(response) {
					
					console.log(response);
					
					if (response["result"] == "success") {
						$(location).attr('href',successurl );
				
					} else {
						
						alert("로그인이 필요한 서비스입니다.");
					}
				},
				error : function() {
					console.log("ajax fail..");
				}
				
			});
			
		});
		$("#course_create").on("click",function(){
			
			
			var url = "<%=request.getContextPath()%>/course_create_ajax";
			var successurl ="<%=request.getContextPath()%>/course_create";
			$.ajax({
				type : "get",
				url : url,
				success : function(response) {
					
					console.log(response);
					
					if (response["result"] == "success") {
						$(location).attr('href',successurl );
				
					} else {
						
						alert("로그인이 필요한 서비스입니다.");
					}
				},
				error : function() {
					console.log("ajax fail..");
				}
				
			});
			
		});
		
		
		

	});
</script>
