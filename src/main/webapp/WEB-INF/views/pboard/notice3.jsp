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
	<div class="container mt-5 ">
		<h1 class="mb-4 text-center">새 가족과의 만남, 입양 절차 과정</h1>

		<div class="card mb-4">
			<div class="card-body">

				<h6 class="card-subtitle mb-2 text-muted">작성일: {}</h6>
				<hr>

				<br>
				<div>
					<b>1. 입양 신청서 작성</b>
					<p>입양을 원하시는 분은 먼저 온라인 또는 보호소에서 입양 신청서를 작성해주세요. 신청서에는 개인 정보와 함께
						반려동물을 키울 수 있는 환경인지에 대한 질문들이 포함되어 있습니다.</p>
					<b>2. 입양 상담 </b>
					<p>신청서 검토후, 입양 상담원과의 1:1 상담이 진행됩니다. 이 과정에서 입양 동기, 반려동물 경험, 주거
						환경 등에 대해 자세히 이야기를 나누게 됩니다.</p>
					<b>3. 가정 방문</b>
					<p>필요한 경우, 입양 동물이 생활하게 될 환경을 직접 확인하기 위해 가정 방문이 이루어질 수 있습니다.</p>
					<b>4.입양 동물 만남</b>
					<p>상담 결과가 긍정적이라면, 입양을 원하는 동물과의 만남이 주선됩니다. 이 때 동물과의 상호작용을 관찰하고,
						궁금한 점들을 물어볼 수 있습니다.</p>
					<b>5. 입양 결정 및 계약</b>
					<p>모든 과정이 순조롭게 진행되면, 입양 계약을 체결합니다. 이 때 입양 동의서 서명, 입양비 납부 등의 절차가
						진행됩니다.</p>
					<b>입양 후 관리 </b>
					<p>입양 후에도 정기적인 연락과 방문을 통해 동물의 적응 상황을 확인하고, 필요한 조언을 제공합니다. 입양 후
						1개월, 3개월, 6개월, 1년 시점에 follow-up을 진행합니다.</p>
					<br> 입양은 한 생명에 대한 책임을 지는 중요한 결정입니다. <br>충분한 고민과 준비 후에 입양을
					결정해주시기 바랍니다.<br> 입양 과정에 대해 더 자세한 문의사항이 있으시면 언제든 연락 주시기 바랍니다.
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

