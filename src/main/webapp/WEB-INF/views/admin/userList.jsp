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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="${pageContext.request.contextPath}/js/PetHope.js"></script>
<script src="${pageContext.request.contextPath}/js/PetHopeList.js"> </script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/vendor.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Chilanka&family=Montserrat:wght@300;400;500&display=swap" rel="stylesheet">
</head>

<body>

	<!-- 헤더 로딩 -->
	<jsp:include page="/WEB-INF/views/header.jsp" />
	
	<!-- 중간 -->
	<section>
	<div class="container mb-5">
	
		<div class="container mt-4">
			<h1 class="mb-4 text-center fw-bolder">회원 조회</h1>
		</div>

		<div class="row">
			
			<div class="col">회원 ID</div>
			<div class="col">회원 이름</div>
			<div class="col">회원 EMAIL</div>
			<div class="col">회원 휴대폰 번호</div>
			<div class="col">수정 | 삭제</div>
				
		</div>
		
		<c:forEach var="user" items="${userList}">				
		<div class="row">	
			<div class="col">${user.userid}</div>
			<div class="col">${user.uname}</div>
			<div class="col">${user.uemail}</div>
			<div class="col">${user.utel}</div>
			<div class="col">
				<a href="<c:url value='/modify?userid=${user.userid}' />">Edit</a>
				<a href="<c:url value='/deleteUser?userid=${user.userid}' />">Delete</a>
			</div>
		</div>
		</c:forEach>

	</div>
	</section>

	<!-- 푸터 로딩 -->
	<jsp:include page="/WEB-INF/views/footer.jsp" />

	<!-- 몰라용 -->
	<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/plugins.js"></script>
	<script src="${pageContext.request.contextPath}/js/script.js"></script>
	<script src="https://code.iconify.design/iconify-icon/1.0.7/iconify-icon.min.js"></script>
   
</body>

</html>