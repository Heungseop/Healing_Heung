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
	href="<%=request.getContextPath()%>/css/place_create.css">

<title>관광지 만들기</title>
</head>
<body>
	<div id="place_create_main">
		<h2>관광지 추가</h2>
		<hr>
		<!-- /////////////////////////////////////////////////////////////////////////////////////////////// -->
		<div class="map_wrap">
			<div id="map" style="width: 100%; height: 100%; overflow: hidden;"></div>

			<div id="menu_wrap" class="bg_white">
				<hr>
				<ul id="placesList"></ul>
				<div id="pagination"></div>
			</div>
		</div>
		<!-- /////////////////////////////////////////////////////////////////////////////////////////////// -->
		<c:url value="/place_create" var="place_create"></c:url>
		<sform:form id="createform" method="post" action="${place_create}" enctype="multipart/form-data"
			class="form-horizontal" modelAttribute="place">
			<fieldset>

				<div id="formtogeter">
					<legend></legend>


					<br> <br>
					<div class="form-group">
						<sform:label path="placeName" class="col-lg-2 control-label">관광지 이름 : </sform:label>
				
					<div class="col-lg-10">
    				<div class="input-group">
							<sform:input path="placeName" id="placeName" name="placeName"
								type="text" class="form-control" />	
								
						<div id="placeAddressButton"  class="input-group-addon btn ">관광지 검색</div>
						<div id="placeAddressCheckButton" class="input-group-addon btn " >관광지 체크</div>
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
					
					<hr>
					
					
					<br>
					<sform:label path="placePositionX"></sform:label>
							<sform:input path="placePositionX" id="placePositionX" type="hidden" name="placePositionX" />
					<sform:label path="placePositionY"></sform:label>
							<sform:input path="placePositionY" id="placePositionY" type="hidden" name="placePositionY" />
					
					<div class="form-group" id="imglabel">
						<sform:label path="imageUrlUrl" class="col-lg-2 control-label">이미지 URL:</sform:label>
						<div class="col-lg-10" id="imglabel">
							<sform:input  path="imageUrlUrl" id="imageUrlUrl" name="imageUrlUrl"  type="text"
								class="form-control" />
	
							<button id="imgUrlCreateButton">이미지 URL 더 삽입</button>
														
						</div>
					</div>
					<br>
					<div class="form-group">
						<sform:label path="imageFile" class="col-lg-2 control-label">이미지 파일 업로드:</sform:label>
						<div class="col-lg-10" >
							<sform:input  path="imageFile" id="imageFile" name="imageFile" type="file" 
								class="form-control" />
							
							<button id="imgFileCreateButton">이미지 파일 더 삽입</button>												
						</div>
					</div>
					<br>

					<sform:button id="submit">등록</sform:button>
					
					
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
	
	var placeCheck =false;
	
	
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
		
		
		$("#submit").on("click",function(){
		if(!placeCheck){
			event.preventDefault();
			alert("관광지 중복 체크를 해주세요.");
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
		
		if(!placeReadonlyCheck){
		$("input[name='placePhone']").attr("readonly","true");
		$placePhoneField.attr("placeholder","미공개");
		$placePhoneField.val("미공개");
		placeReadonlyCheck = true;
		
		}else{	
			$("input[name='placePhone']").removeAttr("readonly");
			$("input[name='placePhone']").removeAttr("placeholder");
			$placePhoneField.val("");
			placeReadonlyCheck =false;
			
		}
	});
	
	
});
	var geocoder = new daum.maps.services.Geocoder();

	//마커를 담을 배열입니다
	var markers = [];

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};

	// 지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption);

	// 장소 검색 객체를 생성합니다
	var ps = new daum.maps.services.Places();

	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	var infowindow = new daum.maps.InfoWindow({
		zIndex : 1
	});

	// 키워드로 장소를 검색합니다	searchPlaces();

	// 키워드 검색을 요청하는 함수입니다
	function searchPlaces() {
		
		placeCheck =false;
		var keyword = document.getElementById('placeName').value;

		if (!keyword.replace(/^\s+|\s+$/g, '')) {
			alert('키워드를 입력해주세요!');
			return false;
		}

		// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
		ps.keywordSearch(keyword, placesSearchCB);
	}

	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(status, data, pagination) {
		if (status === daum.maps.services.Status.OK) {

			// 정상적으로 검색이 완료됐으면
			// 검색 목록과 마커를 표출합니다
			displayPlaces(data.places);

			// 페이지 번호를 표출합니다
			displayPagination(pagination);

		} else if (status === daum.maps.services.Status.ZERO_RESULT) {

			alert('검색 결과가 존재하지 않습니다.');
			return;

		} else if (status === daum.maps.services.Status.ERROR) {

			alert('검색 결과 중 오류가 발생했습니다.');
			return;

		}
	}

	// 검색 결과 목록과 마커를 표출하는 함수입니다
	function displayPlaces(places) {

		var listEl = document.getElementById('placesList'), menuEl = document
				.getElementById('menu_wrap'), fragment = document
				.createDocumentFragment(), bounds = new daum.maps.LatLngBounds(), listStr = '';

		// 검색 결과 목록에 추가된 항목들을 제거합니다
		removeAllChildNods(listEl);

		// 지도에 표시되고 있는 마커를 제거합니다
		removeMarker();

		for (var i = 0; i < places.length; i++) {

			// 마커를 생성하고 지도에 표시합니다
			var placePosition = new daum.maps.LatLng(places[i].latitude,
					places[i].longitude), marker = addMarker(placePosition, i), itemEl = getListItem(
					i, places[i], marker); // 검색 결과 항목 Element를 생성합니다

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			// LatLngBounds 객체에 좌표를 추가합니다
			bounds.extend(placePosition);
			var choice=null;
			// 마커와 검색결과 항목에 mouseover 했을때
			// 해당 장소에 인포윈도우에 장소명을 표시합니다
			
			// mouseout 했을 때는 인포윈도우를 닫습니다
			(function(marker, title) {

				daum.maps.event.addListener(marker, 'click', function() {
					console.log("클릭 이벤트 : " + marker.getPosition());

					geocoder.coord2addr(marker.getPosition(), function(status, result) {
						if (status === daum.maps.services.Status.OK) {
							console.log('그런 너를 마주칠까 ' + result[0].fullName + '을 못가');
							console.log(result);
							$('#placeAddress').val(result[0].fullName);
							$('#placePositionX').val(result[0].y);
							$('#placePositionY').val(result[0].x);
						
							if($("#placeAddress").val()==""){

							}
							choice = marker;
							displayInfowindow(marker, title);
						}
					});
				});
				daum.maps.event.addListener(marker, 'mouseover', function() {
					displayInfowindow(marker, title);
					if($("#placeAddress").val()!=""){
						//displayInfowindow(choice, title);
					}
				});

				daum.maps.event.addListener(marker, 'mouseout', function() {
					infowindow.close();
					if(choice!=""){
					//	displayInfowindow(choice, title);
					}
				});

				itemEl.onmouseover = function() {			
					displayInfowindow(marker, title);
					map.panTo(marker.getPosition());
					if(choice!=""){
					//	displayInfowindow(choice, title);
					}
				};

				itemEl.onmouseout = function() {		
					infowindow.close();				
					if(choice!=""){
					//	displayInfowindow(choice, title);
					}
				};
				itemEl.onclick = function(){
						console.log("클릭 이벤트 : " + marker.getPosition());

						geocoder.coord2addr(marker.getPosition(), function(status, result) {
							if (status === daum.maps.services.Status.OK) {
								console.log('그런 너를 마주칠까 ' + result[0].fullName + '을 못가');
								console.log(result);
								$('#placeAddress').val(result[0].fullName);
								$('#placePositionX').val(result[0].y);
								$('#placePositionY').val(result[0].x);
							
								displayInfowindow(marker, title);
							}
						});
				};
			})(marker, places[i].title);

			fragment.appendChild(itemEl);
		}

		// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
		listEl.appendChild(fragment);
		menuEl.scrollTop = 0;

		// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		map.setBounds(bounds);
	}

	// 검색결과 항목을 Element로 반환하는 함수입니다
	function getListItem(index, places) {

		var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
				+ (index + 1)
				+ '"></span>'
				+ '<div class="info">'
				+ '   <h5>'
				+ places.title + '</h5>';

		if (places.newAddress) {
			itemStr += '    <span>' + places.newAddress + '</span>'
					+ '   <span class="jibun gray">' + places.address
					+ '</span>';
		} else {
			itemStr += '    <span>' + places.address + '</span>';
		}

		itemStr += '  <span class="tel">' + places.phone + '</span>' + '</div>';

		el.innerHTML = itemStr;
		el.className = 'item';

		return el;
	}

	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, idx, title) {
		var imageSrc = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		imageSize = new daum.maps.Size(36, 37), // 마커 이미지의 크기
		imgOptions = {
			spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
			spriteOrigin : new daum.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
			offset : new daum.maps.Point(13, 37)
		// 마커 좌표에 일치시킬 이미지 내에서의 좌표
		}, markerImage = new daum.maps.MarkerImage(imageSrc, imageSize,
				imgOptions), marker = new daum.maps.Marker({
			position : position, // 마커의 위치
			image : markerImage
		});

		marker.setMap(map); // 지도 위에 마커를 표출합니다
		markers.push(marker); // 배열에 생성된 마커를 추가합니다

		return marker;
	}

	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
		for (var i = 0; i < markers.length; i++) {
			markers[i].setMap(null);
		}
		markers = [];
	}

	// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
	function displayPagination(pagination) {
		var paginationEl = document.getElementById('pagination'), fragment = document
				.createDocumentFragment(), i;

		// 기존에 추가된 페이지번호를 삭제합니다
		while (paginationEl.hasChildNodes()) {
			paginationEl.removeChild(paginationEl.lastChild);
		}

		for (i = 1; i <= pagination.last; i++) {
			var el = document.createElement('a');
			el.href = "#";
			el.innerHTML = i;

			if (i === pagination.current) {
				el.className = 'on';
			} else {
				el.onclick = (function(i) {
					return function() {
						pagination.gotoPage(i);
					}
				})(i);
			}

			fragment.appendChild(el);
		}
		paginationEl.appendChild(fragment);
	}

	// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	// 인포윈도우에 장소명을 표시합니다
	function displayInfowindow(marker, title) {
		var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
		infowindow.setContent(content);
		infowindow.open(map, marker);
	}

	// 검색결과 목록의 자식 Element를 제거하는 함수입니다
	function removeAllChildNods(el) {
		while (el.hasChildNodes()) {
			el.removeChild(el.lastChild);
		}
	}
</script>
</html>