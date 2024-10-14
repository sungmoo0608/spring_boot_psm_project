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

<link rel="preconnect" href="https://fonts.googleapis.com">

<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link
	href="https://fonts.googleapis.com/css2?family=Chilanka&family=Montserrat:wght@300;400;500&display=swap"
	rel="stylesheet">
</head>

<body>

	<header>
		<div class="container ">
			<div class="row pb-0 pb-sm-0 align-items-center ">

				<div class="col-sm-4 col-lg-4 text-center text-sm-center"></div>

				<div class="col-sm-12 col-lg-4 text-center text-sm-center">
					<div class="main-logo">
						<a href="/"> <img src="images/logo3.jpg"
							alt="logo" class="img-fluid">
						</a>
					</div>
				</div>
				<div class="col-sm-12 col-lg-4 text-end">
				<span>  </span>
					<!-- 로그인이 안된 사람 -->
						<sec:authorize access="isAnonymous()">
					         <p><a href="<c:url value="/login" />">로그인</a></p>
						</sec:authorize>
					   
						<!-- 로그인이 완료된 사람 -->
						<sec:authorize access="isAuthenticated()">
							<span><sec:authentication property="principal.username"/>님 환영합니다.</span>
						</sec:authorize>
					
						<span>|</span> 
						<span><a href="<c:url value="/join" />" class="login">회원가입</a> </span>
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

								<li class="nav-item"><a href="pet.html" class="nav-link">입양
										대기 동물 관리</a></li>
								<br>


								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" role="button" id="pages"
									data-bs-toggle="dropdown" aria-expanded="false">회원 관리</a>
									<ul class="dropdown-menu" aria-labelledby="pages">
										<li><a href="hope.html" class="dropdown-item">입양 회원
												정보 관리</a></li>
										<li><a href="shelter.html" class="dropdown-item">입양
												대기소 방문 예약 관리</a></li>
										<li><a href="find.html" class="dropdown-item">반려 동물
												찾아요 관리</a></li>
									</ul></li>
								<br>

								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" role="button" id="pages"
									data-bs-toggle="dropdown" aria-expanded="false">게시글 관리</a>
									<ul class="dropdown-menu" aria-labelledby="pages">
										<li><a href="notice.html" class="dropdown-item">공지 사항</a></li>
										<li><a href="areview.html" class="dropdown-item">입양
												후기</a></li>
										<li><a href="qna.html" class="dropdown-item">Q & A</a></li>
										<li><a href="border.html" class="dropdown-item">기타 자료</a></li>
									</ul></li>
								<br>
								</li>

							</ul>

						</div>

					</div>

				</nav>



			</div>
		</section>
	</header>

	<div class="container">
		<div class="form-container">
			<h2 class="text-center mb-4 pt-3">회원 탈퇴</h2>
			<div id="errorMessage" class="text-danger">
	            <c:if test="${not empty error}">
	                ${error}
	            </c:if>
        	</div>
        
	        <form action="${pageContext.request.contextPath}/deleteUser" method="POST">
	            <!-- 사용자 ID를 세션에서 가져옵니다 -->
	            <input type="hidden" name="userid" value="${userid}" />
	            
	            <!-- 읽기 전용 입력 필드 --> 
	            <!-- 로그인된 사용자 ID 표시 -->
	             <p>사용자 ID: <input type="text" name="displayUserid" value="${not empty param.displayUserid ? param.displayUserid : userid}" readonly /></p> 
	              
	            <input type="password" name="password" placeholder="비밀번호를 입력하세요." required/> <br/>
	            
	            <button type="submit">회원 탈퇴</button>
	        </form>
			
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js">
	</script>

</body>

</html>

