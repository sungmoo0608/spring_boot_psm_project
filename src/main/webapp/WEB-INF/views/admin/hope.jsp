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
	<section style="background: rgb(244, 243, 224)" class="pb-5">
		<h1 class="text-center fw-bold pt-5">입양 회원 정보 관리</h1>

		<div class="row mb-4 ">
			<div>
            <form class="d-flex justify-content-center">
               <div class="container mt-5">
                  <div class="row justify-content-center">
                     <div class="col-md-6">
                        <div class="input-group">
                           <input type="text" class="form-control" placeholder="Search"
                              style="border-color: black;">
                           <button class="btn btn-outline-secondary" type="button">
                              <i class="fas fa-search"></i>
                           </button>

                        </div>
                     </div>
                  </div>
               </div>
            </form>
			</div>
		</div>

      <div class="container">

         <div class="row">
            <div class="text-end pb-5 ">
               <a href="hope_add.html" class="fw-bolder" style="text-decoration: none;">신규 회원 등록</a>
            </div>
            <div class="col-md-3 col-sm-3">
               <div class="card shadow-sm">

                  <div class="card-body bg-light">
                     <p class="card-text fw-bold">
                        이름 : <br> 나이 : <br> 전화번호 : <br> 이메일 : <br>
                        주소 : <br>
                     </p>
                     <div class="d-flex justify-content-between align-items-center">
                     </div>
                  </div>
               </div>
            </div>

            <div class="col-md-3 col-sm-3">
               <div class="card shadow-sm">

                  <div class="card-body  bg-light">
                     <p class="card-text fw-bold">
                        이름 : <br> 나이 : <br> 전화번호 : <br> 이메일 : <br>
                        주소 : <br>
                     </p>
                     <div class="d-flex justify-content-between align-items-center">
                     </div>
                  </div>
               </div>
            </div>

            <div class="col-md-3 col-sm-3">
               <div class="card shadow-sm">

                  <div class="card-body  bg-light">
                     <p class="card-text fw-bold">
                        이름 : <br> 나이 : <br> 전화번호 : <br> 이메일 : <br>
                        주소 : <br>
                     </p>
                     <div class="d-flex justify-content-between align-items-center">
                     </div>
                  </div>
               </div>
            </div>

            <div class="col-md-3 col-sm-3">
               <div class="card shadow-sm">

                  <div class="card-body  bg-light">
                     <p class="card-text fw-bold">
                        이름 : <br> 나이 : <br> 전화번호 : <br> 이메일 : <br>
                        주소 : <br>
                     </p>
                     <div class="d-flex justify-content-between align-items-center">
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
	</section>
   

	
	<!-- 푸터 로딩 -->
	<jsp:include page="/WEB-INF/views/footer.jsp" />

   <!-- 몰라용 -->
   <script src="js/jquery-1.11.0.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
   <script src="${pageContext.request.contextPath}/js/plugins.js"></script>
   <script src="${pageContext.request.contextPath}/js/script.js"></script>
   <script src="https://code.iconify.design/iconify-icon/1.0.7/iconify-icon.min.js"></script>
   
</body>

</html>