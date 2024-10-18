<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">

<head>
<title>PingPing</title>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="author" content="">
<meta name="keywords" content="">
<meta name="description" content="">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/lostDog.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/vendor.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Chilanka&family=Montserrat:wght@300;400;500&display=swap" rel="stylesheet">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9433c7ea498e7763b8f5a07dd7f53be4&libraries=services"></script>
    <style>
      #map {
        width: 100%;
        height: 350px;
      }
    </style>
    
<script type="text/javascript">

   $(document).ready(function(){
      let searchParams = new URLSearchParams(window.location.search)
         
      console.log(searchParams.has('desertionNo'));   
      let desertionNo = searchParams.get('desertionNo')
         console.log(desertionNo);
      
      function getPet(pet){
         $("#input_hidden").val(pet.desertionNo);
         $("#desertionNo").text(pet.desertionNo);
         $("#processState").val(pet.processState);
         $("#kindCd").text(pet.kindCd);
         $("#sexCd").text(pet.sexCd);
         $("#happenPlace").text(pet.happenPlace);
         $("#age").text(pet.age);
         $("#careAddr").text(pet.careAddr);
         $("#officetel").val(pet.officetel);
         $("#specialMark").val(pet.specialMark);
         $("#careNum").text(pet.careNm);
         $("#popfile").attr("src", pet.popfile);
         
		// 보호소 주소로 좌표 검색
         var address = pet.careAddr; // pet 객체에서 주소 가져오기
         searchAddressToCoords(address);
      }
      
       $("#reply-link").click(function(event) {
              event.preventDefault(); // 기본 링크 동작 방지
              let desertionNo = $("#desertionNo").text();
              let url = '/ushelter?desertionNo=' + desertionNo;
              location.href = url; // 페이지 이동
          });
      
      $("#updatePet").submit(function(event){
         let desertionNo = $("#desertionNo").text();
         let processState = $("#processState").val();
         let officetel = $("#officetel").val();
         let specialMark = $("#specialMark").val();
         
         let modify ={
               desertionNo : desertionNo,
               processState : processState,
               officetel : officetel,
               specialMark : specialMark
         }
         
         let pet = lostDog();
         pet.modify(modify,function(result){
            console.log(result);
         });
         
      });
      
      
      let pet = lostDog();
      pet.get(desertionNo,getPet);
      
      // 지도 생성 및 주소 검색
      var mapContainer = document.getElementById('map');
      var mapOption = {
          center: new kakao.maps.LatLng(33.450701, 126.570667),
          level: 3
      };
      
      var map = new kakao.maps.Map(mapContainer, mapOption);
      var geocoder = new kakao.maps.services.Geocoder();
      
      // 보호소 주소를 careAddr 요소에서 가져옵니다
      var address = document.getElementById('careAddr').innerText;

      // 주소를 좌표로 변환하는 함수
      function searchAddressToCoords(address) {
          geocoder.addressSearch(address, function(result, status) {
              if (status === kakao.maps.services.Status.OK) {
                  var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                  
                  // 마커와 인포윈도우 표시
                  var marker = new kakao.maps.Marker({
                      map: map,
                      position: coords
                  });
                  
                  // 지도의 중심을 결과값으로 받은 위치로 이동
                  map.setCenter(coords);
              } else {
                  alert("주소를 찾을 수 없습니다."); // 주소 검색 실패 시 알림
              }
          });
      }
   });
</script>

</head>

<body>

	<!-- 헤더 로딩 -->
	<jsp:include page="/WEB-INF/views/header.jsp" />
	
	<!-- 중간 -->
	<section style="background: rgb(255, 246, 241);">
	
      <h1 class="text-center fw-bold py-5">입양 대기 동물 관리</h1>


      <div class="table-container">
         <div class="container mb-5 justify-content-md-center" id="list-table">
         	<div class="container pet-form">
            	<form id="updatePet" action="modify" method="post">
               		<input id="input_hidden" type="hidden" name="bid" value="">
	                <div class="row">
	                	<div class="col-12 rounded p-1 mb-3 bg-dark text-light text-center">
							<p class="m-0 p-0">입양대기 동물 번호&emsp;<span class="badge rounded-pill text-bg-warning px-3" id="desertionNo"></span></p>
						</div>

	                	<div class="col-lg-6 mb-3">
	                		<div><img id="popfile" class="pet-img rounded" /></div>	                  		 
	                	</div>
	                	
	                	<div class="col-lg-6 mb-3">
		                  	<div class="col-12 rounded p-1 mb-3 bg-primary text-dark text-center">
								<p class="m-0 p-0">분양상황</p>
								<input class="form-control text-center py-2" id="processState" type="text" name="btitle" value="">
							</div>
							<div class="col-12 rounded p-1 mb-3 bg-primary text-dark text-center">
								<p class="m-0 p-0">동물종류&emsp;<span class="pet-form-span badge rounded-pill text-bg-light py-1 px-3" id="kindCd"></span></p>
							</div>
							<div class="col-12 rounded p-1 mb-3 bg-primary text-dark text-center">
								<p class="m-0 p-0">성별&emsp;<span class="pet-form-span badge rounded-pill text-bg-light py-1 px-3" id="sexCd"></span></p>
							</div>
							<div class="col-12 rounded p-1 mb-3 bg-primary text-dark text-center">
								<p class="m-0 p-0">발견장소&emsp;<span class="pet-form-span badge rounded-pill text-bg-light py-1 px-3" id="happenPlace"></span></p>
							</div>
							<div class="col-12 rounded p-1 mb-3 bg-primary text-dark text-center">
								<p class="m-0 p-0">나이&emsp;<span class="pet-form-span badge rounded-pill text-bg-light py-1 px-3" id="age"></span></p>
							</div>
							<div class="col-12 rounded p-1 mb-3 bg-primary text-dark text-center">
								<p class="m-0 p-0">보호소명&emsp;<span class="pet-form-span badge rounded-pill text-bg-light py-1 px-3" id="careNum"></span></p>
							</div>
							<div class="col-12 rounded p-1 mb-3 bg-primary text-dark text-center">
								<p class="m-0 p-0">보호소 주소&emsp;<span class="pet-form-span badge rounded-pill text-bg-light py-1 px-3" id="careAddr"></span></p>
							</div>
							<div class="col-12 rounded p-1 mb-3">
								<!-- 지도를 표시할 div입니다 -->
								<div id="map"></div>
								
							</div>     
							<div class="col-12 rounded p-1 mb-3 bg-primary text-dark text-center">
								<p class="m-0 p-0">전화번호</p>
								<input class="form-control text-center py-2" id="officetel" type="text" name="officetel" value="">
							</div>
							<div class="col-12 rounded p-1 mb-3 bg-primary text-dark text-center">
								<p class="m-0 p-0">특징</p>
								<input class="form-control text-center py-2" id="specialMark" type="text" name="specialMark" value="">
							</div>
                   


							<div class="col-12">
								<button id="input_modify" class="btn btn-dark p-1 mb-2" type="submit">정보 수정</button>
								<button class="btn btn-success p-1 mb-2" onclick="window.location.href='#'" id="reply-link">입양을 희망해요</button>
							</div>
		
	                  	</div>
               		</div>
            	</form>
            </div>
         </div>
      </div>

	</section>




	<!-- 푸터 로딩 -->
	<jsp:include page="/WEB-INF/views/footer.jsp" />

   <!-- 몰라용 -->
   <script src="js/jquery-1.11.0.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
   <script src="${pageContext.request.contextPath}/js/plugins.js"></script>
   <script src="${pageContext.request.contextPath}/js/script.js"></script>
   <script src="https://code.iconify.design/iconify-icon/1.0.7/iconify-icon.min.js"></script>
   
</body>

</html>