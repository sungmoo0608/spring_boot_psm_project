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
<script src="${pageContext.request.contextPath}/js/areview.js"></script>

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
            <h1 class="mb-4 text-center fw-bolder">입양 후기 작성</h1>
            <div class="form-container">
               <form id="adoptionStoryForm" enctype="multipart/form-data">
                  <div class="mb-3">
                     <label for="storyTitle" class="form-label fw-bolder">제목</label> <input
                        type="text" class="form-control" id="storyTitle"
                        name="storyTitle" required>
                  </div>
                  <div class="mb-3">
                     <label for="authorName" class="form-label fw-bolder">작성자 이름</label> <input
                        type="text" class="form-control" id="authorName"
                        name="authorName" required>
                  </div>
                  <div class="mb-3">
                     <label for="adoptionDate" class="form-label fw-bolder">작성 날짜</label> <input
                        type="date" class="form-control" id="adoptionDate"
                        name="adoptionDate" required>
                  </div>

                  <div class="mb-3">
                     <label for="storyContent" class="form-label fw-bolder">내용</label>
                     <textarea class="form-control" id="storyContent"
                        name="storyContent" rows="6" required></textarea>
                  </div>

                  <div class="mb-3 form-check">
                     <input type="checkbox" class="form-check-input" id="agreeTerms"
                        required> <label class="form-check-label fw-bolder"
                        for="agreeTerms">개인정보 수집 및 이용에 동의합니다.</label>
                  </div>
                  <div class="d-grid gap-2 pb-5">
                     <button type="submit" class="btn btn-primary fw-bolder">후기 등록하기</button>

                  </div>
               </form>
            </div>
         </div>
         
	</section>


	<jsp:include page="/WEB-INF/views/footer.jsp" />

	

</body>

</html>

