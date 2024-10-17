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
<script src="/js/lostDog.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/vendor.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Chilanka&family=Montserrat:wght@300;400;500&display=swap" rel="stylesheet">

<script type="text/javascript">

   $(document).ready(function(){
      let searchParams = new URLSearchParams(window.location.search)
         
      console.log(searchParams.has('desertionNo'));   
      let desertionNo = searchParams.get('desertionNo')
         console.log(desertionNo);
      
      function getPet(pet){
         $("#input_hidden").val(pet.desertionNo);
         $("#desertionNo").text(pet.desertionNo);
         $("#processState").val(pet.processState);
         $("#kindCd").text(pet.kindCd);
         $("#sexCd").text(pet.sexCd);
         $("#happenPlace").text(pet.happenPlace);
         $("#age").text(pet.age);
         $("#careAddr").text(pet.careAddr);
         $("#officetel").val(pet.officetel);
         $("#specialMark").val(pet.specialMark);
         $("#careNum").text(pet.careNm);
         $("#popfile").attr("src", pet.popfile);
         
      }
      
       $("#reply-link").click(function(event) {
              event.preventDefault(); // 기본 링크 동작 방지
              let desertionNo = $("#desertionNo").text();
              let url = '/ushelter?desertionNo=' + desertionNo;
              location.href = url; // 페이지 이동
          });
      
      $("#updatePet").submit(function(event){
         let desertionNo = $("#desertionNo").text();
         let processState = $("#processState").val();
         let officetel = $("#officetel").val();
         let specialMark = $("#specialMark").val();
         
         let modify ={
               desertionNo : desertionNo,
               processState : processState,
               officetel : officetel,
               specialMark : specialMark
         }
         
         let pet = lostDog();
         pet.modify(modify,function(result){
            console.log(result);
         });
         
      });
      
      
      let pet = lostDog();
      pet.get(desertionNo,getPet);
      
   });
</script>

</head>

<body>

	<!-- 헤더 로딩 -->
	<jsp:include page="/WEB-INF/views/header.jsp" />
	
	<!-- 중간 -->
	<section style="background: rgb(255, 246, 241);">
	
      <h1 class="text-center fw-bold py-5">입양 대기 동물 관리</h1>


      <div class="table-container">
         <div class="container mb-5 justify-content-md-center" id="list-table">
         	<div class="form-container">
            	<form id="updatePet" action="modify" method="post">
               		<input id="input_hidden" type="hidden" name="bid" value="">
	                <div class="row">
					  	<div class="col-12 rounded p-1 mb-2 bg-primary text-dark text-center">
							<p class="m-0 p-0">입양대기 동물 번호&emsp;<span class="badge rounded-pill text-bg-warning px-3" id="desertionNo"></span></p>
						</div>
	                  	<div class="col-12 rounded p-1 mb-2 text-dark text-center">
	                  		<img id="popfile" class="pet-img rounded" />
	                  	</div>  
	                  	<div class="col-12 rounded p-1 mb-2 bg-primary text-dark text-center">
							<p class="m-0 p-0 text-center">분양상황</p>
							<input class="form-control text-center m-0 p-0" id="processState" type="text" name="btitle" value="">
						</div>
						<div class="col-12 rounded p-1 mb-2 bg-primary text-dark text-center">
							<p class="m-0 p-0">동물종류&emsp;<span class="badge rounded-pill text-bg-warning px-3" id="kindCd"></span></p>
						</div>
						<div class="col-12 rounded p-1 mb-2 bg-primary text-dark text-center">
							<p class="m-0 p-0">성별&emsp;<span class="badge rounded-pill text-bg-warning px-3" id="sexCd"></span></p>
						</div>
						<div class="col-12 rounded p-1 mb-2 bg-primary text-dark text-center">
							<p class="m-0 p-0">발견장소&emsp;<span class="badge rounded-pill text-bg-warning px-3" id="happenPlace"></span></p>
						</div>
						<div class="col-12 rounded p-1 mb-2 bg-primary text-dark text-center">
							<p class="m-0 p-0">나이&emsp;<span class="badge rounded-pill text-bg-warning px-3" id="age"></span></p>
						</div>
						<div class="col-12 rounded p-1 mb-2 bg-primary text-dark text-center">
							<p class="m-0 p-0">보호소 주소&emsp;<span class="badge rounded-pill text-bg-warning px-3" id="careAddr"></span></p>
						</div>
						<div class="col-12 rounded p-1 mb-2 bg-primary text-dark text-center">
							<p class="m-0 p-0">전화번호</p>
							<input class="form-control text-center m-0 p-0" id="officetel" type="text" name="officetel" value="">
						</div>
						<div class="col-12 rounded p-1 mb-2 bg-primary text-dark text-center">
							<p class="m-0 p-0">특징</p>
							<input class="form-control text-center m-0 p-0" id="specialMark" type="text" name="specialMark" value="">
						</div>                           
						<div class="col-12 rounded p-1 mb-2 bg-primary text-dark text-center">
							<p class="m-0 p-0">보호소명&emsp;<span class="badge rounded-pill text-bg-warning px-3" id="careNum"></span></p>
						</div>
						
						<button id="input_modify" class="btn btn-dark p-1 mb-2" type="submit">수정</button>

	                  	<button class="btn btn-success p-1 mb-2" onclick="window.location.href='#'" id="reply-link">입양을 희망해요</button>

	                  	</div>
               		</div>
            	</form>
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