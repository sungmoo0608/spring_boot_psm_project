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
	
	<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
  />
	

</head>

<body onload="document.f.id.focus();">

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
					<span>  </span>
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
										<li><a href="shelter.html" class="dropdown-item">입양 대기소
												방문 예약 관리</a></li>
										<li><a href="find.html" class="dropdown-item">반려 동물
												찾아요 관리</a></li>
									</ul></li>
								<br>

								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" role="button" id="pages"
									data-bs-toggle="dropdown" aria-expanded="false">게시글 관리</a>
									<ul class="dropdown-menu" aria-labelledby="pages">
										<li><a href="notice.html" class="dropdown-item">공지
												사항</a></li>
										<li><a href="areview.html" class="dropdown-item">입양
												후기</a></li>
										<li><a href="qna.html" class="dropdown-item">Q
												& A</a></li>
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

	

	<div class="login-container text-center ">
	    
	    <div style="background-color: rgb(255, 254, 239);  height: 550px; margin: 0 auto; " class="pt-5 ">
	
	    <h2 class="pb-5 ">로그인 <i class="fa-solid fa-paw"></i></h2>
	    	<c:url value="/login" var="loginUrl" />
	    	  	
	        <form:form name="f" action="${loginUrl}" method="POST" >
	        
	        	<c:if test="${param.error != null}">
					<p>아이디와 비밀번호가 잘못되었습니다.</p>
				</c:if>
				
				<c:if test="${param.logout != null}">
					<p>로그아웃 하였습니다.</p>
				</c:if>
				
	            <label for="userid">아이디</label> <input type="text" id="userid" name="userid" placeholder="아이디" required><br><br>
	            <label for="password">비밀번호</label> <input type="password" id="password" name="password" placeholder="비밀번호" required><br><br>
	            <button type="submit" class="btn btn-outline-secondary">로그인</button><br>      
			
			</form:form>
	        
	        <br>
	        <p>계정이 없으신가요? <a href="<c:url value="/join" />" ><button type="button" class="btn btn-outline-secondary">회원가입</button></a></p>
	        
		</div>
		
	</div>



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