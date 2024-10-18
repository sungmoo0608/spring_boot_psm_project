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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/vendor.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Chilanka&family=Montserrat:wght@300;400;500&display=swap" rel="stylesheet">

</head>

<body>

	<jsp:include page="/WEB-INF/views/header.jsp" />
	
	<section >
	<div class="container mt-5">
		<h1 class="mb-4 text-center">정기적인 건강 Check!</h1>

		<div class="card mb-4">
			<div class="card-body">

				<h6 class="card-subtitle mb-2 text-muted">작성일: {}</h6>
				<hr>

				<br>
				<h4><b>핑핑 직원들이 아낌없이 보살펴주는 동물들의 생명 지킴이</b></h4>
				<br>
				<h5>1. 신체검사</h5>

				<p>체중, 체온, 맥박, 호흡수 등을 측정하여 전반적인 건강 상태를 평가합니다. 피부, 귀, 눈, 치아 등을
					점검하여 이상 징후를 확인합니다.</p>
				<h5>2. 백신 접종</h5>

				<p>파보바이러스, 광견병, 보르데텔라 등 필수 백신 접종을 확인하고 필요 시 추가 접종을 실시합니다.</p>
				<h5>3. 구충 및 외부 기생충 예방</h5>

				<p>내외부 기생충(예: 벼룩, 진드기, 회충 등) 구충제를 주기적으로 투여합니다.</p>
				<h5>4. 혈액 검사</h5>

				<p>일반적인 건강 상태를 확인하고 특정 질병(예: 간, 신장 기능 등)을 조기에 발견하기 위해 혈액 검사를 진행할
					수 있습니다.</p>
				<h5>5. 영양 상태 점검</h5>

				<p>급여되는 사료의 질과 양을 평가하여 적절한 영양 섭취를 돕습니다.</p>
				<h5>6. 행동 관찰</h5>

				<p>스트레스, 불안, 행동 문제 등을 관찰하여 필요한 경우 행동 교정 프로그램을 진행합니다.</p>
				<h5>7. 정신 건강 체크:</h5>

				<p>사회화와 상호작용이 중요한 유기견의 경우, 다양한 환경과 사람과의 접촉을 통해 정신 건강을 관리합니다.</p>

			</div>
			
			<div class="text-center mt-4">
    			<a href="<c:url value="/pboard/notice" />"><button class="btn btn-secondary">이전으로 돌아가기</button></a>
			</div>
		</div>

	<div><h3 class="rounded p-1 mb-3 bg-dark text-light text-center">댓글</h3></div>
		
		
		<div id="comments">
		
			<div class="comment">
				<p>
					<strong>이름</strong> - 작성날짜:
				</p>
				<p>가을 이벤트 혹시 끝났나요?!!</p>
				
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<button class="btn btn-danger btn-sm float-end delete-comment">삭제</button>
				</sec:authorize>
				
			</div>
			<div class="comment">
				<p>
					<strong>이름</strong> - 작성날짜:
				</p>
				<p>좋은 정보네요!</p>
				
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<button class="btn btn-danger btn-sm float-end delete-comment">삭제</button>
				</sec:authorize>
				
			</div>
		</div>

		<form id="commentForm" class="mt-4 mb-5">
			<h4>댓글 작성</h4>
			<div class="mb-3">
				<label for="name" class="form-label">이름</label> <input type="text"
					class="form-control" id="name" required>
			</div>
			<div class="mb-3">
				<label for="comment" class="form-label">댓글</label>
				<textarea class="form-control" id="comment" rows="3" required></textarea>
			</div>
			<button type="submit" class="btn btn-primary">댓글 작성</button>
		</form>
	</div>

	</section>

	<jsp:include page="/WEB-INF/views/footer.jsp" />

	

</body>

</html>

