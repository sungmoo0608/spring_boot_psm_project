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
<script src="${pageContext.request.contextPath}/js/PetBoard.js"></script>
<script src="${pageContext.request.contextPath}/js/qnaview.js"></script>

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
	
	<section>
		<div class="card-body" style="background-color: rgb(234, 245, 220); border-radius: 15px; padding: 20px;">
			<div class="container mt-4">
				<h1 class="mb-4 text-center fw-bolder">Q & A</h1>
			</div>
	
			<table class="table table-hover" style="background-color: white">
		        <thead>
		            <tr>
		                <th scope="col">번호</th>
		                <th scope="col">제목</th>
		                <th scope="col">작성자</th>
		                <th scope="col">작성일</th>
		                <th scope="col">상태</th>
		                <th scope="col">삭제</th>
		            </tr>
		        </thead>
		        <tbody id="list-table">
		            <!-- 게시글이 여기 추가됩니다 -->
		        </tbody>
			</table>
	
	
			<div class="text-center mt-5 mb-5">
				<a href="<c:url value="/pboard/qna_add" />" class="btn btn-primary btn-lg fw-bolder">질문 작성하기</a>
			</div>
		</div>
	</section>

	<jsp:include page="/WEB-INF/views/footer.jsp" />

</body>

</html>

