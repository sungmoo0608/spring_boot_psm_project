<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

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

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/vendor.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Chilanka&family=Montserrat:wght@300;400;500&display=swap" rel="stylesheet">

</head>

<body>

	<jsp:include page="/WEB-INF/views/header.jsp" />

	<div class="container mt-5">
		<h1 class="text-center mb-5">마이페이지</h1>

		<div class="row">
			<div class="col-md-4 mb-4">
				<div class="card">
					<div class="card-body text-center">
						<span class="badge rounded-pill text-bg-info text-light">아이디</span> ${user.userid}<br>
						<span class="badge rounded-pill text-bg-info text-light">이름</span> ${user.uname}<br>
						<span class="badge rounded-pill text-bg-info text-light">휴대폰</span> ${user.utel}<br>
						<span class="badge rounded-pill text-bg-info text-light">이메일</span> ${user.uemail}<br>
						<button class="btn btn-sm btn-success" onclick="window.location.href='/modify'">정보 수정</button>
						<button class="btn btn-sm btn-danger" onclick="window.location.href='/deleteUser'">회원 탈퇴</button>
						
					</div>
				</div>
			</div>
			
			<div class="col-md-8">
				<div class="card mb-4">
					<div class="card-header">
						<h4>
							<i class="fas fa-paw me-2"></i>입양 희망 동물 조회
						</h4>
					</div>

					<div class="row ">
						<div class="card-body">
							<div class="row">

							    <c:if test="${not empty userHope.petHopeList}">
							        <c:forEach items="${userHope.petHopeList}" var="userHope">
							            <div class="col-md-4 mb-3">
							                <div class="card">
							                    <img src="images/item8.jpg" class="card-img-top" alt="관심 동물 ">
							                    <div class="card-body">
							                        <h5 class="card-title">동물 번호: ${userHope.desertionNo}</h5>
							                        <p class="card-text">
							                            방문 예정일 : ${userHope.hdate} <!-- 필요 시 품종 정보 추가 -->
							                            
							                        </p>
							                        <a href="/pet/pet_content_view?desertionNo=${userHope.desertionNo}" class="btn btn-outline-primary">상세 정보</a>
							                    </div>
							                </div>
							            </div>
							        </c:forEach>
							    </c:if>
							    
							    <c:if test="${empty userHope.petHopeList}">
							        <p>신청한 내역이 없습니다.</p>
							    </c:if>
								
							</div>
						</div>
					</div>
				</div>

				<div class="card mb-4">
					<div class="card-header">
						<h4>
							<i class="fas fa-calendar-alt me-2"></i>작성 글 모아보기
						</h4>
					</div>
					
					<div class="card-body">
						<div class="row">
						<c:if test="${not empty userBoard.userBoardList}">
					    <c:forEach items="${userBoard.userBoardList}" var="userBoard">
					        <div class="col-md-4 mb-3">
							     <div class="card">
							        <div class="card-body">
										<h5 class="card-title">게시글 번호: ${userBoard.bnum}</h5>
							                        
											<p class="card-text">제목 : ${userBoard.btitle}</p>
											<p class="card-text">작성 일자 : ${userBoard.bdate}</p>
											<a href="/pboard/petboard_content_view?bnum=${userBoard.bnum}" class="btn btn-outline-primary">상세 정보</a>
											
							        </div>
							     </div>
							</div>
					    </c:forEach>
						</c:if>
						<c:if test="${empty userBoard.userBoardList}">
						    <p>작성한 게시글이 없습니다.</p>
						</c:if>
						</div>
					</div>

			</div>
		</div>
		
	</div>

	<jsp:include page="/WEB-INF/views/footer.jsp" />
	
</body>

</html>