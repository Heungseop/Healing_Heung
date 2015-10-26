<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sform"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="dto.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css"
	href="<c:url value="/webjars/bootstrap/3.3.4/dist/css/bootstrap.min.css"/>">

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/place_create.css">

<title>관광지 수정</title>
</head>
<body>

	<%
		Place place =(Place) request.getAttribute("changeplace");
			
	%>
	<div id="place_create_main">
		<h2>관광지 수정</h2>
		<hr>
		<!-- /////////////////////////////////////////////////////////////////////////////////////////////// -->
		<h3>관광지 수정 시 주의사항 :</h3><h4> 관광지 수정 시 모든 테마 및 기간별 선택이 초기화 되며, 모든 이미지 삭제  </h4>
		<!-- /////////////////////////////////////////////////////////////////////////////////////////////// -->
		<c:url value="/place_change" var="place_change"></c:url>
		<sform:form id="createform" method="post" action="${place_change}" enctype="multipart/form-data"
			class="form-horizontal" modelAttribute="changeplace">
			<fieldset>

				<div id="formtogeter">
					


					<br> <br>
					<div class="form-group">
						<sform:label path="placeName" class="col-lg-2 control-label">관광지 이름 : </sform:label>
				
						<div class="col-lg-10">
    						<div class="input-group">
							<sform:input path="placeName" id="placeName" name="placeName"
								type="text" class="form-control" readonly="true" />	
								
							</div>	
						</div>	
					</div>
					
					<br>
					<div class="form-group">
						<sform:label path="placeAddress" class="col-lg-2 control-label">주소 :</sform:label>
						<div class="col-lg-10">
							<sform:input path="placeAddress" id="placeAddress"
								readonly="true" name="placeAddress" type="text"
								class="form-control" />

						</div>
					</div>
					
					<br>
					
					<div class="form-group" id="placeCategory">
					<sform:label path="" >테마 선택 :</sform:label>
						<div class="col-lg-10">
						<sform:select name="selectplacethema"
									  path="placeCategory"  
			                          items="${Categori_theme_Options}" 
            			              itemLabel="categoriName" 
            			              itemValue="categoriNumber">
						</sform:select>
						</div>
					</div>
					
					<div class="form-group" id="placeCategory">
					<sform:label path="" >기간별 선택 :</sform:label>
						<div class="col-lg-10">
						<sform:select name="selectplacegigan"
						              path="placeCategory"  
			                          items="${Categori_term_Options }" 
            			              itemLabel="categoriName" 
            			              itemValue="categoriNumber">
						</sform:select>
						</div>
					</div>
					<br>

					<div class="form-group">
						<sform:label path="placePhone" class="col-lg-2 control-label">전화번호 :</sform:label>
						<div class="col-lg-10">
					<div class="input-group">	

							<sform:input path="placePhone" id="placePhone" type="text"
								name="placePhone" class="form-control" />

							<div id="placePhoneButton" class="input-group-addon btn " >미공개</div>
					</div>	
					</div>
					</div>
					<br>
					<div class="form-group">
						<sform:label path="placeComment" class="col-lg-2 control-label">설명 :</sform:label>
						<div class="col-lg-10">
							<sform:textarea path="placeComment" name="placeComment" id="placeComment" type="text"
								class="form-control" />
						</div>
					</div>
					<br>
					
					<hr>
					<sform:label path="placePositionX"></sform:label>
							<sform:input path="placePositionX" id="placePositionX" type="hidden" name="placePositionX" />
					<sform:label path="placePositionY"></sform:label>
							<sform:input path="placePositionY" id="placePositionY" type="hidden" name="placePositionY" />
					
					<div class="form-group" id="imglabel">
						<h5>기존 이미지 URL 목록 : </h5>
						
						<sform:label path="imageUrlUrl" class="col-lg-2 control-label">이미지 URL:</sform:label>
						<div class="col-lg-10" id="imglabel">
							
								<sform:input  path="imageUrlUrl" id="imageUrlUrl" name="imageUrlUrl"  type="text"
								class="form-control" />
							
							<button id="imgUrlCreateButton">이미지 URL 더 삽입</button>	
							
										
						</div>
					</div>
					
			
					
					<br>
					<div class="form-group">
						<h5>기존 이미지 파일 목록 : </h5>
						<%
						if(place !=null){
							for(int i=0; i<place.getImageFileUrl().size(); i++){		
							 	if(place.getImageFileUrl().get(i) !=null ){
						%>
							<h4><%=place.getImageFileUrl().get(i)%></h4>
						<% 		
								}
							}
						}
						%>
						<sform:label path="imageFile" class="col-lg-2 control-label">이미지 파일 업로드:</sform:label>
						<div class="col-lg-10" >
							<sform:input  path="imageFile" id="imageFile" name="imageFile" type="file" 
								class="form-control" />
							
							<button id="imgFileCreateButton">이미지 파일 더 삽입</button>												
						</div>
					</div>
					<br>

					<sform:button id="submit">수정</sform:button>
					
					
					<a href="<%=request.getContextPath()%>/place_create"><button
							id="cancel">취소</button></a>
				</div>
			</fieldset>
		</sform:form>




	</div>

</body>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=8db10793985b77516d67e5101b49f26e&libraries=services"></script>
<script src="<%=request.getContextPath()%>/js/jquery.validate.js"></script>
<script>

$(function() {
	
	
	
	
			$("#placeAddressCheckButton").on("click",function(event){
		
			event.preventDefault();
	
			var name = $("#placeName").val();
			var url = "<%=request.getContextPath()%>/place_NameCheck";
			$.ajax({
				type : "get",
				url : url,
				data : {
					name : name
				},
				success : function(response) {
				
					console.log(response);
				
					if (response["result"] == "success") {
						placeCheck =true;
						alert("해당 관광지는 등록이 가능합니다.");

					} else {
					
						alert(response["msg"]);
					}
				},
				error : function() {
				console.log("ajax fail..");
				}
			
			});
		
		
		});
	
	
	
		
		$("#createform").validate({
			rules : {
				placeName : {
					required : true,
				},
				placePhone : {
					required : true,
				},
				placeComment : {
					required : true,
				},
				placeAddress : {
					required : true,
				}
				
			},
			messages : {
				placeName : {
					required : "관광지 이름을 입력해주세요.",
				},
				placePhone : {
					required : "전화번호를 입력해주세요.",
				},
				placeComment : {
					required : "상세 내용을 입력해주세요.",
				},
				placeAddress : {
					required : "주소 검색 버튼을 눌러주세요."
				}
			
			}

		});
		
		

		$("#cancel").on("click",function(event){
			event.preventDefault();
			var url = "<%=request.getContextPath()%>/home";    
			$(location).attr('href',url);
		});

	var idCheck =false;
	var placeReadonlyCheck = false;

	$("#placeAddressButton").on("click",function(event){
		
		event.preventDefault();
		
		searchPlaces();
		
	});
	$("#imgUrlCreateButton").on("click",function(event){
		
		event.preventDefault();
		
		$("#imgUrlCreateButton").before('<input  path="imageUrlUrl" id="imageUrlUrl" type="text" name="imageUrlUrl"  class="form-control" />');
	});

	$("#imgFileCreateButton").on("click",function(event){
		
		event.preventDefault();
		
		$("#imgFileCreateButton").before('<input path="imageFile" id="imageFile" name="imageFile" type="file" class="form-control" />');
	});
	
	$("#placePhoneButton").on("click",function(event){
		
		var $placePhoneField=$("#placePhone");
		event.preventDefault();
		$placePhoneField.val("");
		if(!placeReadonlyCheck){
		$("input[name='placePhone']").attr("readonly","true");
		$placePhoneField.val("");
		$placePhoneField.attr("placeholder","미공개");
		
		placeReadonlyCheck = true;
		
		}else{	
			$("input[name='placePhone']").removeAttr("readonly");
			$("input[name='placePhone']").removeAttr("placeholder");
			$placePhoneField.html("미공개");
			
			placeReadonlyCheck =false;
			
		}
	});
	
	
});
	
</script>
</html>