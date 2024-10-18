<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
			<div class="row pb-0 mb-3 align-items-center ">	
				<div class="col-sm-12 col-lg-12 text-center">
					<div class="main-logo">
						<a href="/"> <img src="${pageContext.request.contextPath}/images/logo3.jpg" alt="logo" class="img-fluid">
						</a>
					</div>
				</div>
				<!-- 로그인이 완료된 사람 -->	
				<div class="col-sm-12 col-lg-12 text-center">
					<div>
						<sec:authorize access="isAuthenticated()">
							<span class="badge rounded-pill text-bg-warning"><sec:authorize access="hasRole('ROLE_USER')">일반회원</sec:authorize></span>
							<span class="badge rounded-pill text-bg-warning"><sec:authorize access="hasRole('ROLE_ADMIN')">관리자</sec:authorize></span>
							<span class="badge rounded-pill text-bg-success"><sec:authentication property="principal.username"/>님 환영합니다.</span>
						</sec:authorize>
					</div>
				</div>
				<div class="col-sm-12 col-lg-12 text-center">
				
					<!-- 로그인이 안된 사람 -->
					<div class="gap-2">
						<sec:authorize access="isAnonymous()">					
							<button type="button" class="btn btn-sm btn-primary" onclick="window.location.href='/login'">로그인</button>
							<button type="button" class="btn btn-sm btn-outline-secondary" onclick="window.location.href='/join'">회원가입</button>
						</sec:authorize>
					</div>
					   
					<!-- 로그인이 완료된 사람 -->
					<div class="gap-2">	
						<sec:authorize access="isAuthenticated()">
							<button type="button" class="btn btn-sm btn-primary" onclick="window.location.href='/mypage'">마이페이지</button>
							<button type="button" class="btn btn-sm btn-outline-secondary" onclick="window.location.href='/logout'">로그아웃</button>
						</sec:authorize>
					</div>	
				</div>
			</div>
		</div>

		<div>
			<hr class="m-0">
		</div>

		<section>
			<div class="container">
				<nav class="main-menu d-flex navbar navbar-expand-lg ">

					<div class="d-flex d-lg-none align-items-end mt-3">
						<ul class="d-flex justify-content-end list-unstyled m-0">
						
							<!-- 로그인이 완료된 사람 -->	
							<sec:authorize access="isAuthenticated()">	
								<li><a href="<c:url value="/mypage" />" class="mx-3"> 
								<iconify-icon icon="healthicons:person" class="fs-4"></iconify-icon>
								</a></li>
								
<!-- 								<li><a href="wishlist.html" class="mx-3"> 
								<iconify-icon icon="mdi:heart" class="fs-4"></iconify-icon>
								</a></li> -->
							</sec:authorize>
							
						</ul>
					</div>

					<button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
						<span class="navbar-toggler-icon"></span>
					</button>

					<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">

						<div class="offcanvas-header justify-content-center">
							<button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
						</div>

						<div class="offcanvas-body justify-content-center">
							<ul class="navbar-nav menu-list list-unstyled d-flex gap-md-3 mb-0">
								<sec:authorize access="isAnonymous()">		
									<li class="nav-item">로그인 하면 메뉴가 활성화 됩니다.</li>
								</sec:authorize>
								
								<sec:authorize access="hasRole('ROLE_ADMIN')">
								<li class="nav-item"><a href="<c:url value="/pet" />" class="nav-link">입양 대기 동물 관리</a></li>


								<li class="nav-item"><a href="<c:url value="/ushelter" />" class="nav-link">입양 대기소 방문 예약 관리</a></li>

								
								<li class="nav-item dropdown">
									<a class="nav-link dropdown-toggle" role="button" id="pages" data-bs-toggle="dropdown" aria-expanded="false">게시글 관리</a>
									<ul class="dropdown-menu" aria-labelledby="pages">
										<li><a href="<c:url value="/pboard/notice" />" class="dropdown-item">공지 사항</a></li>
										<li><a href="<c:url value="/pboard/areview" />" class="dropdown-item">입양 후기</a></li>
										<li><a href="<c:url value="/pboard/qna" />" class="dropdown-item">Q & A</a></li>
									</ul>
								</li>
								</sec:authorize>
								
								<sec:authorize access="hasRole('ROLE_USER')">
								<li class="nav-item"><a href="<c:url value="/pet" />" class="nav-link">입양 할래요</a></li>

								<li class="nav-item"><a href="<c:url value="/ushelter" />" class="nav-link">보호소 방문 예약</a></li>
								
								<li class="nav-item dropdown">
									<a class="nav-link dropdown-toggle" role="button" id="pages" data-bs-toggle="dropdown" aria-expanded="false">게시판</a>
									<ul class="dropdown-menu" aria-labelledby="pages">
										<li><a href="<c:url value="/pboard/notice" />" class="dropdown-item">공지 사항</a></li>
										<li><a href="<c:url value="/pboard/areview" />" class="dropdown-item">입양 후기</a></li>
										<li><a href="<c:url value="/pboard/qna" />" class="dropdown-item">Q & A</a></li>
									</ul>
								</li>
								</sec:authorize>
								
							</ul>
						</div>
					</div>
				</nav>
			</div>
		</section>
		
	<div>
		<hr class="m-0">
	</div>
			
	</header>
	



	