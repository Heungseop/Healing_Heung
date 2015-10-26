<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sform"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css"
	href="<c:url value="/webjars/bootstrap/3.3.4/dist/css/bootstrap.min.css"/>">

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/course_place_search.css">
<title>코스 찾기</title>
</head>
<body>
	<div id="course_place_search">
		<h2>장소 검색</h2>
		<hr>
		<!-- /////////////////////////////////////////////////////////////////////////////////////////////// -->
			<div id="formtogeter">
	
			<div class="form-group">
				<label  class="col-lg-2 control-label">관광지 이름 : </label>
				
					<div class="col-lg-15" >
    					<div class="input-group">
							<input  id="courseName" name="courseName"
								type="text" class="form-control"  />	
								
						<div id="courseNameCheckButton" class="input-group-addon btn " >검색</div>
					</div>	
				</div>	
			</div>
			<hr>
			<div class="form-group">
				<label  class="col-lg-2 control-label">검색 결과 : </label>
				
				<div class="col-lg-15" >
    				<div class="input-group">
								<div id="searchresult">
								
							
								</div>
								
						
					</div>	
				</div>	
			
			</div>


		</div>
	

	</div>
	
</body>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script >
$(function() {
	
	var i=0;
	
	$("#courseNameCheckButton").on("click",function(){
		
		event.preventDefault();
		
		var placeName = $("#courseName").val();
		if(placeName ==""){
			alert("입력한 관광지 정보가 존재하지 않습니다.");
			return false;
		}
		
		var $target = $("#searchresult");
		var url = "<%=request.getContextPath()%>/course_place_search_ajax";
		$.ajax({
			type : "get",
			url : url,
			data : {
				placeName : placeName
			},
			success : function(response) {
				console.log(response);
				
				if (response["result"] == "success") {
					console.log(response["placeList"]);
					
					var placeList =response["placeList"];
					
					var placeNo;
					var placeName;
					i=0;
					
					$.each(placeList,function(index,value){
							
						$.each(value,function(index,value){
							
							
							if(index =="memberId"){
								$target.before('작성자 아이디 : ' +value + '<br><hr>');
	
								
							}
							if(index =="placeName"){
								$target.before('관광지 이름 : '+value + '<br>');
								
								placeName = value;
									
							}
							if(index =="placeNo"){	
								placeNo =value;
							}
							
							
							if(index=="placeAddress"){
								
								
								$target.before('관광지 주소 : ' + '<a id="'+placeNo+'" href="#">' + value + '</a>' + '<br>');
								$target.before('<input id="'+placeNo+'" type="hidden" value="'+placeNo+'"' +'</input>');
								
								
								$("#"+placeNo).on("click",function(){

									event.preventDefault();
									
									
									
									var url = "<%=request.getContextPath()%>/course_place_search_ajax2";
									
									 $.ajax({
										type : "get",
										url : url,
										data : {
											placeNo : $(this).next().next().val()
										},
										success : function(response) {
											
											console.log(response);
											
											if (response["result"] == "success") {
											
												var placePositionX;
												var placePositionY;
												
												$.each(response["selectedplace"],function(index,value){
												
													if(index =="placeName"){
														placeName=value;
													}
													if(index =="placePositionX"){
														placePositionX=value;
														
													}if(index =="placePositionY"){
														placePositionY=value;
													}if(index=="placeNo"){
														placeNo=value;
													}	
													
												});
												console.log("넘버",$(this).next().next().val());	
												$(opener.document).find("#placeName").val(placeName);
												$(opener.document).find("#placePositionX").val(placePositionX);
												$(opener.document).find("#placePositionY").val(placePositionY);
												$(opener.document).find("#placeNoList").val(placeNo);
												
												window.close();	
											}else{
												console.log(response["fail"]);
												alert(response["fail"]);
											}
									
										},
										error : function() {
											console.log("ajax fail..");
										}
										
									});  //2번쨰 ajax
		
									
								});
				
							}
							
						});
					});
					
				} else {
					console.log(response["fail"]);
					alert(response["fail"]);
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