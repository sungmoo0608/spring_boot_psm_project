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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/vendor.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Chilanka&family=Montserrat:wght@300;400;500&display=swap" rel="stylesheet">

</head>

<body>

	<jsp:include page="/WEB-INF/views/header.jsp" />
	
	<div class="container mb-5">
		<div class="form-container">
			<h2 class="text-center mb-4 pt-3">회원 탈퇴</h2>

	            <c:if test="${not empty error}">
	            <div class="p-3 mb-2 bg-warning text-dark text-center">
	                ${error}
	            </div>
	            </c:if>

			<form action="${pageContext.request.contextPath}/deleteUser" method="POST">
				<!-- 사용자 ID를 세션에서 가져옵니다 -->
	            <input type="hidden" name="userid" value="${userid}" />
	            <!-- 읽기 전용 입력 필드 --> 
	            <!-- 로그인된 사용자 ID 표시 -->	
				<div class="mb-3">
					<label for="userid" class="form-label">아이디</label> 
					<input type="text" name="displayUserid" class="form-control" value="${not empty param.displayUserid ? param.displayUserid : userid}" readonly />
				</div>
				
				<div class="mb-3">
					<label for="password" class="form-label">비밀번호 확인</label> 
					<input type="password" name="password" class="form-control" placeholder="비밀번호를 입력하세요." required/>
				</div>
				
				<div class="d-grid gap-2">
					<button class="btn btn-primary" type="submit">회원 탈퇴</button>
					<button class="btn btn-secondary" type="button"
						onclick="window.location.href='/'">취소</button>
				</div>
			</form>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/footer.jsp" />

	

</body>

</html>

