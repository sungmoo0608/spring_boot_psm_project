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
	
	<section clas>
      <div class="card-body" style="background-color: rgb(234, 245, 220); border-radius: 15px; padding: 20px;">

         <div class="container mt-4">
            <h1 class="mb-4 text-center fw-bolder">공지사항</h1>
         </div>

         <div class="row mb-4">
            <div>
               <form class="d-flex justify-content-center">
                  <div class="container">
                     <div class="row justify-content-center">
                        <div class="col-md-6">
                           <div class="input-group">
                              <input type="text" class="form-control" placeholder="Search">
                              <button class="btn btn-outline-secondary" type="button">검색
                              </button>
                           </div>
                        </div>
                     </div>
                  </div>
               </form>
            </div>
         </div>

         <div class="list-group mb-3">
            
			<div class="d-flex w-100 justify-content-between">
				<a href="<c:url value="/pboard/notice1" />" class="list-group-item list-group-item-action notice-item">
					<h5 class="mb-1 fw-bolder">핑핑 직원들을 소개합니다.</h5>
					<p class="mb-1"> 성장을 함께하는 핑핑 직원들!</p>
				</a>
				
				<sec:authorize access="hasRole('ROLE_ADMIN')">
				<!-- 삭제할 항목 -->
				<button class="btn btn-danger btn-sm float-end" onclick="deleteItem()">삭제</button> 
				</sec:authorize>		
				
			</div>

			
		</div>

		<div class="list-group mb-3">
            
			<div class="d-flex w-100 justify-content-between">
           		<a href="<c:url value="/pboard/notice2" />" class="list-group-item list-group-item-action notice-item">
	           		<h5 class="mb-1 fw-bolder">새로운 가족을 맞이할 준비 되셨나요?</h5>
	           		<p class="mb-1"> 가을 이벤트로 여러분을 찾아갑니다!</p>
           		</a>
           		
           		<sec:authorize access="hasRole('ROLE_ADMIN')">
           		<!-- 삭제할 항목 -->
           		<button class="btn btn-danger btn-sm float-end" onclick="deleteItem()">삭제</button>
           		</sec:authorize>
			</div>
			
		</div>


		<div class="list-group mb-3">
			
			<div class="d-flex w-100 justify-content-between">
				<a href="<c:url value="/pboard/notice3" />" class="list-group-item list-group-item-action notice-item">
					<h5 class="mb-1 fw-bolder">입양 절차 과정에 대해서 알려드립니다!</h5>
					<p class="mb-1"> 귀여운 동물들과 새로운 엄마 & 아빠와의 만남!</p>
				</a>
				
				<sec:authorize access="hasRole('ROLE_ADMIN')">
				<!-- 삭제할 항목 -->
				<button class="btn btn-danger btn-sm float-end" onclick="deleteItem()">삭제</button>	
				</sec:authorize>		
			</div>

         </div>


		<div class="list-group mb-3">
           
			<div class="d-flex w-100 justify-content-between">
				<a href="<c:url value="/pboard/notice4" />" class="list-group-item list-group-item-action notice-item">
					<h5 class="mb-1 fw-bolder">정기적인 건강 Check!</h5>
					<p class="mb-1">핑핑 직원들이 아낌없이 보살펴주는 동물들의 생명 지킴이</p>
				</a>
				<sec:authorize access="hasRole('ROLE_ADMIN')">
				<!-- 삭제할 항목 -->
				<button class="btn btn-danger btn-sm float-end" onclick="deleteItem()">삭제</button>
				</sec:authorize>
			</div>
				
		</div>
         
		</div>
   </section>

	<jsp:include page="/WEB-INF/views/footer.jsp" />

	

</body>

</html>

