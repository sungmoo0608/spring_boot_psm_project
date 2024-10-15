<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
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
</head>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">

<link rel="stylesheet" type="text/css" href="css/vendor.css">
<link rel="stylesheet" type="text/css" href="style.css">



<link
	href="https://fonts.googleapis.com/css2?family=Chilanka&family=Montserrat:wght@300;400;500&display=swap"
	rel="stylesheet">

</head>

<body>

	<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
    <defs>
  
      
      <symbol xmlns="http://www.w3.org/2000/svg" id="category"
			viewBox="0 0 24 24">
        <path fill="currentColor"
			d="M19 5.5h-6.28l-.32-1a3 3 0 0 0-2.84-2H5a3 3 0 0 0-3 3v13a3 3 0 0 0 3 3h14a3 3 0 0 0 3-3v-10a3 3 0 0 0-3-3Zm1 13a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1v-13a1 1 0 0 1 1-1h4.56a1 1 0 0 1 .95.68l.54 1.64a1 1 0 0 0 .95.68h7a1 1 0 0 1 1 1Z" />
      </symbol>
     
      <symbol xmlns="http://www.w3.org/2000/svg" id="heart"
			viewBox="0 0 24 24">
        <path fill="currentColor"
			d="M20.16 4.61A6.27 6.27 0 0 0 12 4a6.27 6.27 0 0 0-8.16 9.48l7.45 7.45a1 1 0 0 0 1.42 0l7.45-7.45a6.27 6.27 0 0 0 0-8.87Zm-1.41 7.46L12 18.81l-6.75-6.74a4.28 4.28 0 0 1 3-7.3a4.25 4.25 0 0 1 3 1.25a1 1 0 0 0 1.42 0a4.27 4.27 0 0 1 6 6.05Z" />
      </symbol>
      
      <symbol xmlns="http://www.w3.org/2000/svg" id="user"
			viewBox="0 0 24 24">
        <path fill="currentColor"
			d="M15.71 12.71a6 6 0 1 0-7.42 0a10 10 0 0 0-6.22 8.18a1 1 0 0 0 2 .22a8 8 0 0 1 15.9 0a1 1 0 0 0 1 .89h.11a1 1 0 0 0 .88-1.1a10 10 0 0 0-6.25-8.19ZM12 12a4 4 0 1 1 4-4a4 4 0 0 1-4 4Z" />
      </symbol>
      
      <symbol xmlns="http://www.w3.org/2000/svg" id="close"
			viewBox="0 0 15 15">
        <path fill="currentColor"
			d="M7.953 3.788a.5.5 0 0 0-.906 0L6.08 5.85l-2.154.33a.5.5 0 0 0-.283.843l1.574 1.613l-.373 2.284a.5.5 0 0 0 .736.518l1.92-1.063l1.921 1.063a.5.5 0 0 0 .736-.519l-.373-2.283l1.574-1.613a.5.5 0 0 0-.283-.844L8.921 5.85l-.968-2.062Z" />
      </symbol>

    </defs>
  </svg>

	<header>
		<div class="container ">
			<div class="row pb-0 pb-sm-0 align-items-center ">

				<div class="col-sm-4 col-lg-4 text-center text-sm-center">
				</div>



				<div class="col-sm-12 col-lg-4 text-center text-sm-center">
					<div class="main-logo">
						<a href="/"> <img src="images/logo3.jpg" alt="logo"
							class="img-fluid">
						</a>
					</div>
				</div>
				<div class="col-sm-12 col-lg-4 text-end">
					<span> </span>
					<!-- 로그인이 안된 사람 -->
						<sec:authorize access="isAnonymous()">
							<p><a href="<c:url value="/login" />">로그인</a></p>
							<span>|</span> 
							<span><a href="<c:url value="/join" />" class="login">회원가입</a> </span>
						</sec:authorize>
					   
						<!-- 로그인이 완료된 사람 -->
						<sec:authorize access="isAuthenticated()">
							<span><sec:authentication property="principal.username"/>님 환영합니다.</span>
							<span>|</span> 
							<span><a href="<c:url value="/modify" />" class="login">마이페이지</a> </span>
							<span>|</span> 
							<a href="<c:url value="/logout" />" class="login">로그아웃</a>
						</sec:authorize>
					

				</div>
			</div>
		</div>

		<div class="container-fluid">
			<hr class="m-0">
		</div>

		<section>
			<div class="container">
				<nav class="main-menu d-flex navbar navbar-expand-lg ">

					<div class="d-flex d-lg-none align-items-end mt-3">
						<ul class="d-flex justify-content-end list-unstyled m-0">
							<li><a href="account.html" class="mx-3"> <iconify-icon
										icon="healthicons:person" class="fs-4"></iconify-icon>
							</a></li>
							<li><a href="wishlist.html" class="mx-3"> <iconify-icon
										icon="mdi:heart" class="fs-4"></iconify-icon>
							</a></li>


						</ul>

					</div>

					<button class="navbar-toggler" type="button"
						data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
						aria-controls="offcanvasNavbar">
						<span class="navbar-toggler-icon"></span>
					</button>

					<div class="offcanvas offcanvas-end" tabindex="-1"
						id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">

						<div class="offcanvas-header justify-content-center">
							<button type="button" class="btn-close"
								data-bs-dismiss="offcanvas" aria-label="Close"></button>
						</div>

						<div class="offcanvas-body justify-content-center">
							<ul
								class="navbar-nav menu-list list-unstyled d-flex gap-md-3 mb-0">

								<li class="nav-item"><a href="hope.html" class="nav-link">반려동물
										찾아요</a></li>
								<br>

								<li class="nav-item"><a href="shelter.html" class="nav-link">보호소
										방문 예약</a></li>
								<br>


								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" role="button" id="pages"
									data-bs-toggle="dropdown" aria-expanded="false">게시판</a>
									<ul class="dropdown-menu" aria-labelledby="pages">
										<li><a href="notice.html" class="dropdown-item">공지
												사항</a></li>
										<li><a href="areview.html" class="dropdown-item">입양
												후기</a></li>
										<li><a href="qna.html" class="dropdown-item">Q
												& A</a></li>
									</ul></li>
								<br>
							
							</ul>

						</div>

					</div>

				</nav>



			</div>
		</section>
	</header>

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
									성장을 함께하는 <br> <span class="text-primary">핑핑 직원들을
										소개합니다.</span>
								</h3>
								<a href="#" class="btn btn-outline-dark btn-lg fs-6 rounded-1 ">
									Detail Page </a>
							</div>

						</div>
					</div>





					<div class="swiper-slide py-5">
						<div class="row banner-content align-items-center">
							<div class="img-wrapper col-md-5">
								<img src="images/banner-img.png" class="img-fluid">
							</div>
							<div class="content-wrapper col-md-7 p-5 mb-5">
								<h5 class="secondary-font text-primary mb-4 fw-bold">10/2
									~ 10/21</h5>
								<h3 class="banner-title fw-normal display-3">
									새로운 가족을 맞이할 준비되셨나요? <br> <span class="text-primary">Fall
										Event</span>
								</h3>
								<a href="#" class="btn btn-outline-dark btn-lg  fs-6 rounded-1 ">
									Detail Page </a>
                    <use xlink:href="#arrow-right"></use>
                  </svg>
								</a>
							</div>

						</div>
					</div>
					<div class="swiper-slide py-5">
						<div class="row banner-content align-items-center">
							<div class="img-wrapper col-md-5">
								<img src="images/banner-img3.png" class="img-fluid">
							</div>
							<div class="content-wrapper col-md-7 p-5 mb-5">
								<h5 class="secondary-font text-primary mb-4 fw-bold">Adoption
									Procedure</h5>
								<h3 class="banner-title display-3 fw-normal">
									새 가족과의 만남,<br> <span class="text-primary">입양절차 과정</span>
								</h3>
								<a href="#" class="btn btn-outline-dark btn-lg  fs-6 rounded-1 ">
									Detail Page </a>
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
								<a href="#" class="btn btn-outline-dark btn-lg  fs-6 rounded-1 ">
									Detail Page </a>
							</div>

						</div>
					</div>	
				</div>

				<div class="swiper-pagination mb-5"></div>

			</div>
		</div>
	</section>

	<section id="categories">
		<div class="container  py-5 text-center">
			<div class="display-5 fw-normal">엄마 & 아빠를 찾아요.</div>
			<div class="row my-5">



				<div class="col ">


					<a href="index.html"> <img src="images/logo_final.png"
						alt="logo" class="logo">
					</a>

				</div>


			</div>
	</section>

	<section id="clothing" class="overflow-hidden "
		style="background: url('images/background-img.png') no-repeat; background-size: cover">
		<div class="container pb-5 ">

			<div class="section-header  mb-3">
				<div class="display-5 fw-normal py-5 text-center">반려 동물을 찾아요.</div>

			</div>

			<div class="products-carousel swiper">
				<div class="swiper-wrapper">

					<div class="swiper-slide">

						<div class="card position-relative">
							<a href="single-product.html"><img src="images/item1.jpg"
								class="img-fluid rounded-4" alt="image"></a>
							<div class="card-body p-0">
								<a href="single-product.html">
									<h3 class="card-title pt-4 m-0">이름</h3>
								</a>

								<div class="card-text">
									<span class="rating secondary-font"> </span>

									<div class="d-flex flex-wrap mt-3">
										<a href="#" class="btn-cart me-3 px-4 pt-3 pb-3"> <span>잃어버린
												날짜</span><br> <span>잃어버린 장소</span><br> <span>품종</span><br>
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
				<a href="#" class="btn btn-outline-dark btn-lg fs-6 rounded-1">
					더보기 </a>
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







	<div class="container-fluid">
		<hr class="m-0">
	</div>


	<div id="footer-bottom ">
		<div class="container">

			<div class="row mt-3 text-center">
				<div class="col-md-4 copyright">
					<p class="secondary-font">contact : 02-1234-5678</p>
				</div>

				<div class="col-md-4 copyright">
					<p class="secondary-font">email : pingping@gmail.com</p>
				</div>

				<div class="col-md-4 copyright">
					<p class="secondary-font">address : 서울특별시 성동구 아차산로 113</p>
				</div>
			</div>
		</div>
	</div>







	<script src="js/jquery-1.11.0.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
	<script src="js/plugins.js"></script>
	<script src="js/script.js"></script>
	<script
		src="https://code.iconify.design/iconify-icon/1.0.7/iconify-icon.min.js"></script>
</body>

</html>
   