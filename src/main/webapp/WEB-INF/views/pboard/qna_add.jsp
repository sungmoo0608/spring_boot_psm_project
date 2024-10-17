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

<script src="/js/PetBoard.js"></script>
<script src="/js/qnawrite.js"> </script>

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
	
	<section>
	
	<div class="container">
		<h1 class="text-center mt-5 pb-5">질문 작성하기</h1>
		<form id="insertPet" action="insert" method="post">
			<input type="hidden" id="bnum">

			<div class="form-group pb-5">
				<label for="btitle">질문 제목</label> <input type="text"
					class="form-control" id="btitle" name="btitle" required>
			</div>

			<div class="form-group pb-5">
				<label for="pet_user_id">작성자 ID</label> <input type="text"
					class="form-control" id="pet_user_id" name="pet_user_id" required>
			</div>

			<div class="form-group pb-5">
				<label for="bcontent">질문 내용</label>
				<textarea class="form-control" id="bcontent" name="bcontent"
					rows="5" required></textarea>
			</div>

			<div class="form-group pb-5">
				<label for="cate_no" class="form-label">카테고리</label> <select
					id="cate_no" class="form-control" name="category" required>
					<option value="" disabled selected>카테고리를 선택하세요</option>
					<option value="2">🌟 Q&A</option>
					<option value="3">📝 후기</option>
				</select>
			</div>

			<input type="submit" class="btn btn-primary btn-block"
				value="질문 제출하기">
			<button type="button" class="btn btn-dark btn-block"
				onclick="alert('수정하기 기능을 구현하세요.');">수정하기</button>
		</form>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<style>
	    /* 기본 select 박스 스타일 */
	    .form-control {
	        background-color: #f8f9fa; /* 부드러운 배경색 */
	        border: 1px solid #ced4da; /* 테두리 색상 */
	        border-radius: 0.25rem; /* 둥근 모서리 */
	        padding: 0.5rem 1rem; /* 여백 */
	        transition: border-color 0.2s; /* 부드러운 테두리 변화 */
	    }
	
	    /* 포커스 시 테두리 색상 변화 */
	    .form-control:focus {
	        border-color: #80bdff; /* 포커스 색상 */
	        box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25); /* 그림자 효과 */
	    }
	
	    /* 옵션 스타일 */
	    select option {
	        padding: 10px; /* 옵션 여백 */
	    }
	</style>
	
	</section>

	<jsp:include page="/WEB-INF/views/footer.jsp" />

</body>

</html>

