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

<script src="${pageContext.request.contextPath}/js/lostDog.js"></script>
<script src="${pageContext.request.contextPath}/js/petview.js"></script>

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
	<section style="background: rgb(255, 246, 241);">
	
		<h1 class="text-center fw-bold py-5">입양 대기 동물 관리</h1>	
		<div class="container">	
		
			<div id="list-table" class="row">
				
				    <!-- 데이터가 여기에 추가됩니다 -->	   
					   
			</div>
		    		       
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