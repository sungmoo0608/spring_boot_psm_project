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
<script src="${pageContext.request.contextPath}/js/qnaanswer.js"> </script>

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
	<div class="container mb-5">
		<div class="form-container">
	    <h1 class="text-center mt-5 pb-5">답변 작성하기</h1>
	    
	    <form id="questionForm" method="post">
	        <div class="form-group pb-5">
	        	<input type="hidden" name="userid" value="${user.userid}"/>
	            <input type="hidden" name="bnum" id="bnum">
	            <input type="hidden" name="bgroup" id="bgroup">
	            <input type="hidden" name="bstep" id="bstep">
	            <input type="hidden" name="bindent" id="bindent"> 
	            <label for="title">답변 제목</label>
	            <input type="text" class="form-control" id="btitle" name="btitle" required>
	        </div>
	        <div class="form-group pb-5">
	            <label for="userid">작성자</label>
	            <input type="text" name="userid" class="form-control" id="userid" value="${user.userid}" required readonly/>
	        </div>
	        <div class="form-group pb-5">
	            <label for="content">답변 내용</label>
	            <textarea class="form-control" id="bcontent" name="bcontent" rows="5" required></textarea>
	        </div>
	        <div class="d-grid gap-2">
	        	<button class="btn btn-primary" type="submit">답변 제출하기</button>
	        	<button class="btn btn-outline-secondary" onclick="window.location.href='/pboard/qna'">취소</button>
	        </div>
	    </form>
	    </div>
	</div>

	</section>

	<jsp:include page="/WEB-INF/views/footer.jsp" />

</body>

</html>

