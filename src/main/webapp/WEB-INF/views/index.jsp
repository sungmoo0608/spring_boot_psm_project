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
								<a href="#" class="btn btn-outline-dark btn-lg fs-6 rounded-1 "> Detail Page </a>
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
								<a href="#" class="btn btn-outline-dark btn-lg  fs-6 rounded-1 "> Detail Page </a>
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
								<a href="#" class="btn btn-outline-dark btn-lg  fs-6 rounded-1 ">Detail Page </a>
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
								<a href="#" class="btn btn-outline-dark btn-lg  fs-6 rounded-1 "> Detail Page </a>
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
					<a href="index.html"> <img src="images/logo_final.png" alt="logo" class="logo"></a>
				</div>
			</div>
		</div>
	</section>

	<section id="clothing" class="overflow-hidden" style="background: url('images/background-img.png') no-repeat; background-size: cover">
		<div class="container pb-5 ">

			<div class="section-header  mb-3">
				<div class="display-5 fw-normal py-5 text-center">반려 동물을 찾아요.</div>
			</div>

			<div class="products-carousel swiper">
				<div class="swiper-wrapper">

					<div class="swiper-slide">

						<div class="card position-relative">
							<a href="single-product.html"><img src="images/item1.jpg" class="img-fluid rounded-4" alt="image"></a>
							<div class="card-body p-0">
								<a href="single-product.html">
									<h3 class="card-title pt-4 m-0">이름</h3>
								</a>

								<div class="card-text">
									<span class="rating secondary-font"> </span>

									<div class="d-flex flex-wrap mt-3">
										<a href="#" class="btn-cart me-3 px-4 pt-3 pb-3"> 
											<span>잃어버린 날짜</span><br> 
											<span>잃어버린 장소</span><br> 
											<span>품종</span><br>
											<span>전화번호</span>
										</a>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="d-flex justify-content-center">
				<a href="#" class="btn btn-outline-dark btn-lg fs-6 rounded-1"> 더보기 </a>
			</div>
			<!-- / products-carousel -->
		</div>
	</section>

	<section id="register">
		<div>
			<div class="display-5 fw-normal py-5 text-center">서울시 동물 보호 센터</div>
			<img src="images/map2.png" alt="image">
		</div>
	</section>

	<jsp:include page="/WEB-INF/views/footer.jsp" />

</body>
</html>
   