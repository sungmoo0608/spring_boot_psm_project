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

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="css/vendor.css">
<link rel="stylesheet" type="text/css" href="css/style.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Chilanka&family=Montserrat:wght@300;400;500&display=swap" rel="stylesheet">

</head>

<body>
	
	<jsp:include page="/WEB-INF/views/header.jsp" />

	<section id="banner" style="background: #F9F3EC;">
		<div class="container">
			<div class="swiper main-swiper">
				<div class="swiper-wrapper">

					<div class="swiper-slide py-5">
						<div class="row banner-content align-items-center">
							<div class="img-wrapper col-md-5">
								<img src="images/ping.jpg" class="img-fluid">
							</div>
							<div class="content-wrapper col-md-7 p-5 mb-5">
								<h5 class="secondary-font text-primary mb-4 fw-bold">introduce</h5>
								<h3 class="banner-title fw-normal display-3">
									성장을 함께하는 <br> <span class="text-primary">핑핑 직원들을 소개합니다.</span>
								</h3>
								<a href="<c:url value="/pboard/notice1" />" class="btn btn-outline-dark btn-lg fs-6 rounded-1 "> Detail Page </a>
							</div>
						</div>
					</div>

					<div class="swiper-slide py-5">
						<div class="row banner-content align-items-center">
							<div class="img-wrapper col-md-5">
								<img src="images/banner-img.png" class="img-fluid">
							</div>
							<div class="content-wrapper col-md-7 p-5 mb-5">
								<h5 class="secondary-font text-primary mb-4 fw-bold">10/2 ~ 10/21</h5>
								<h3 class="banner-title fw-normal display-3">
									새로운 가족을 맞이할 준비되셨나요? <br> 
									<span class="text-primary">Fall Event</span>
								</h3>
								<a href="<c:url value="/pboard/notice2" />" class="btn btn-outline-dark btn-lg  fs-6 rounded-1 "> Detail Page </a>
                    		<use xlink:href="#arrow-right"></use> </svg></a>
							</div>
						</div>
					</div>
					
					<div class="swiper-slide py-5">
						<div class="row banner-content align-items-center">
							<div class="img-wrapper col-md-5">
								<img src="images/banner-img3.png" class="img-fluid">
							</div>
							<div class="content-wrapper col-md-7 p-5 mb-5">
								<h5 class="secondary-font text-primary mb-4 fw-bold">Adoption Procedure</h5>
								<h3 class="banner-title display-3 fw-normal">
									새 가족과의 만남,<br> <span class="text-primary">입양절차 과정</span>
								</h3>
								<a href="<c:url value="/pboard/notice3" />" class="btn btn-outline-dark btn-lg  fs-6 rounded-1 ">Detail Page </a>
							</div>
						</div>
					</div>
					
					<div class="swiper-slide py-5">
						<div class="row banner-content align-items-center">
							<div class="img-wrapper col-md-5">
								<img src="images/banner-img4.png" class="img-fluid">
							</div>
							<div class="content-wrapper col-md-7 p-5 mb-5">
								<h5 class="secondary-font text-primary mb-4 fw-bold">Special Care</h5>
								<h3 class="banner-title display-3 fw-normal">
									정기적인 건강체크,<br> <span class="text-primary">생명 지킴이</span>
								</h3>
								<a href="<c:url value="/pboard/notice4" />" class="btn btn-outline-dark btn-lg  fs-6 rounded-1 "> Detail Page </a>
							</div>

						</div>
					</div>	
				</div>

				<div class="swiper-pagination mb-5"></div>

			</div>
		</div>
	</section>

	<section id="categories">
		<div class="container py-5 text-center">
			<div class="display-5 fw-normal">엄마 & 아빠를 찾아요.</div>
			<div class="row my-5">
				<div class="col ">
					<a href="<c:url value="/pet" />"> <img src="images/logo_final.png" alt="logo" class="logo"></a>
				</div>
			</div>
		</div>
	</section>

<%-- 	<section id="register" class="overflow-hidden "
		style="background: url('images/background-img.png') no-repeat; background-size: cover; height:500px">

		<div class="container">
			<div class="display-5 fw-normal py-5 text-center">서울시 동물 보호 센터</div>
		
			<div class="row justify-content-center">
				<div class="col-12">
					<select id="districtSelect" class="form-select mb-3 text-center">
						<option value="">지역구 선택</option>
						<option value="강남구">강남구</option>
						<option value="강동구">강동구</option>
						<option value="강북구">강북구</option>
						<option value="강서구">강서구</option>
						<option value="관악구">관악구</option>
						<option value="광진구">광진구</option>
						<option value="구로구">구로구</option>
						<option value="금천구">금천구</option>
						<option value="노원구">노원구</option>
						<option value="도봉구">도봉구</option>
						<option value="동대문구">동대문구</option>
						<option value="동작구">동작구</option>
						<option value="마포구">마포구</option>
						<option value="서대문구">서대문구</option>
						<option value="서초구">서초구</option>
						<option value="성동구">성동구</option>
						<option value="성북구">성북구</option>
						<option value="송파구">송파구</option>
						<option value="양천구">양천구</option>
						<option value="영등포구">영등포구</option>
						<option value="용산구">용산구</option>
						<option value="은평구">은평구</option>
						<option value="종로구">종로구</option>
						<option value="중구">중구</option>
						<option value="중랑구">중랑구</option>
					</select>
				</div>
			</div>

			<div id="shelterResults" class="row justify-content-center mt-4"
				style="display: none;">
				<div class="col-12">
					<h3 class="text-center mb-3">검색 결과</h3>
					<ul id="shelterList" class="list-group text-center">
						<!-- Shelter results will be inserted here -->
					</ul>
				</div>
			</div>
		</div>
	</section> --%>

	<script>
	  // This is a mock database. In a real application, this data would come from a server.
	  const shelters = {
	    '강남구': ['강남 동물 보호센터', '강남 유기견 보호소'],
	    '강동구': ['강동 애견 보호센터'],
	    '마포구': ['마포 동물 사랑센터', '마포구 유기동물 보호소'],
	    // Add more districts and their shelters here
	  };
	
	  document.getElementById('districtSelect').addEventListener('change', function() {
	    const district = this.value;
	    const shelterList = document.getElementById('shelterList');
	    const shelterResults = document.getElementById('shelterResults');
	    
	    shelterList.innerHTML = '';
	    
	    if (district && shelters[district]) {
	      shelters[district].forEach(shelter => {
	        const li = document.createElement('li');
	        li.className = 'list-group-item';
	        li.textContent = shelter;
	        shelterList.appendChild(li);
	      });
	      shelterResults.style.display = 'block';
	    } else {
	      shelterResults.style.display = 'none';
	    }
	  });
	</script>


	<jsp:include page="/WEB-INF/views/footer.jsp" />
	
	<script>
        $(document).ready(function () {
            const swiper = new Swiper('.main-swiper', {
                pagination: {
                    el: '.swiper-pagination',
                    clickable: true,
                },
                loop: true,
                autoplay: {
                    delay: 5000,
                },
            });
        });
    </script>
    
 	<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
 	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
  	<script src="js/plugins.js"></script>
  	<script src="js/script.js"></script>
  	<script src="https://code.iconify.design/iconify-icon/1.0.7/iconify-icon.min.js"></script>

</body>

</html>