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
	
	<section >


	<div class="container mt-5 ">
		<h1 class="mb-4 text-center">새로운 가족을 맞이할 준비 되셨나요?</h1>

		<div class="card mb-4">
			<div class="card-body">

				<h6 class="card-subtitle mb-2 text-muted">작성일: {}</h6>
							<hr>
				<h3 class="card-text text-center">Fall Event</h3>
				<br>

				<img alt="이미지" src="https://cdn.imweb.me/upload/S20200605d0b93b390db0f/5879c60dc4dbd.png">


			</div>
		</div>
		
		<div class="text-center mt-4">
    <a href="<c:url value="/notice" />"><button class="btn btn-secondary">이전으로 돌아가기</button></a>
	</div>
		

		<h3 class="mb-3">댓글</h3>
		<div id="comments">
			<div class="comment">
				<p>
					<strong>이름</strong> - 작성날짜:
				</p>
				<p>가을 이벤트 혹시 끝났나요?!!</p>
				<button class="btn btn-danger btn-sm float-end delete-comment">삭제</button>
				</p>
			</div>
			<div class="comment">
				<p>
					<strong>이름</strong> - 작성날짜:
				</p>
				<p>좋은 정보네요!</p>
				<button class="btn btn-danger btn-sm float-end delete-comment">삭제</button>
				</p>
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

