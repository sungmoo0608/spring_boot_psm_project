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

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/vendor.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Chilanka&family=Montserrat:wght@300;400;500&display=swap" rel="stylesheet">
    
    <style>
      #map {
        width: 100%;
        height: 350px;
      }
    </style>
    
</head>

<body>

	<jsp:include page="/WEB-INF/views/header.jsp" />

	<div class="container my-5">
	    <!-- 주소 입력 필드와 버튼 -->
	    <div class="d-grid gap-3 mb-3">
	        <input type="text" id="streetAdr" name="uadr" class="form-control" placeholder="주소를 입력하세요." />
	        <button class="btn btn-primary" id="searchBtn">주소 검색 하기</button>
	        <div class="invalid-feedback">주소를 검색해주세요.</div>
	    </div>
	 
	    <!-- 지도를 표시할 div입니다 -->
	    <div id="map"></div>
	</div>

    <script
      type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9433c7ea498e7763b8f5a07dd7f53be4&libraries=services">
    </script>

    <script>
      // Kakao Maps API 로드 후 실행되는 함수
      function initMap() {
          var mapContainer = document.getElementById("map"), // 지도를 표시할 div
              mapOption = {
                  center: new kakao.maps.LatLng(33.450701, 126.570667), // 초기 중심 좌표
                  level: 3, // 초기 확대 레벨
              };

          // 지도를 표시할 div와 지도 옵션으로 지도를 생성합니다
          var map = new kakao.maps.Map(mapContainer, mapOption);

          // 주소-좌표 변환 객체를 생성합니다
          var geocoder = new kakao.maps.services.Geocoder();

          // 검색 버튼 클릭 시 주소 검색
          document.getElementById("searchBtn").onclick = function () {
              var address = document.getElementById("streetAdr").value; // 입력된 주소

              geocoder.addressSearch(address, function (result, status) {
                  if (status === kakao.maps.services.Status.OK) {
                      var coords = new kakao.maps.LatLng(result[0].y, result[0].x); // 좌표 얻기

                      // 지도 중심 이동
                      map.setCenter(coords);
                      // 마커 추가
                      var marker = new kakao.maps.Marker({
                          map: map,
                          position: coords,
                      });
                      
                      // 검색된 주소를 streetAdr 필드에 입력
                      document.getElementById("streetAdr").value = result[0].road_address ? result[0].road_address.address_name : address;
                      
                  } else {
                      alert("주소를 찾을 수 없습니다.");
                  }
              });
          };
      }

      // Kakao Maps API를 로드한 후 initMap 함수를 호출합니다.
      kakao.maps.load(initMap);
    </script>
    
	<jsp:include page="/WEB-INF/views/footer.jsp" />

</body>
</html>
   