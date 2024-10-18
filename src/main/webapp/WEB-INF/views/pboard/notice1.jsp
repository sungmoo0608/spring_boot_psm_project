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
	<div class="container mt-5 ">
		<h1 class="mb-4 text-center fw-bolder">성장을 함께하는 핑핑 직원들을 소개합니다.</h1>

		<div class="card mb-4">
			<div class="card-body">

				<h6 class="card-subtitle mb-2 text-muted">작성일 : {}</h6>
							<hr>
				<p class="card-text">안녕하세요, PING 보호소입니다. 저희 직원 핑핑이들을 소개합니다.</p>
	
				<p class="card-text"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
  				<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
				</svg> 팀장 : 박성무</p>
				<p class="card-text"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
  				<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
				</svg> 팀원 : 김윤정, 김현중, 윤다영</p>
				<p class="card-text">저희 PING 보호소에서는 협력을 중시하여 입사전 성격 유형 테스트를 통해
					서로에 대해 알아왔습니다.</p>
					<br>
				<b >핑테스트 결과 </b>
				<table border=" solid 1px ">
					<tr >
						<td  class="fw-bold text-center" style="border: solid 1px;">박성무</td>
						<td  class="fw-bold text-center" style="border: solid 1px;">김윤정</td>
						<td  class="fw-bold text-center" style="border: solid 1px;">김현중</td>
						<td  class="fw-bold text-center" style="border: solid 1px;">윤다영</td>
					</tr>

					<tr>
						<td><img class="img-fluid" style="border: solid 1px;"
							src="https://github.com/user-attachments/assets/2ee187c5-0230-4e4c-9209-f63f1180fabc">
							</img></td>
						<td><img class="img-fluid" style="border: solid 1px;"
							src="https://github.com/user-attachments/assets/1bd981db-760a-4c7a-851c-b7dae00c1c08">
							</img></td>
						<td><img class="img-fluid" style="border: solid 1px;"
							src="https://github.com/user-attachments/assets/e8acdc0e-8267-4126-a822-8d2c73d7fb25">
							</img></td>
						<td><img class="img-fluid" style="border: solid 1px;"
							src="https://github.com/user-attachments/assets/d1b5a2ce-4b21-45d3-abfc-a706d625ed17">
							</img></td>
					</tr>
				</table>
			
			</div>
			
			<div class="text-center mt-4">
    			<a href="<c:url value="/pboard/notice" />"><button class="btn btn-secondary">이전으로 돌아가기</button></a>
			</div>
			
		</div>

		<div><h3 class="rounded p-1 mb-3 bg-dark text-light text-center">댓글</h3></div>
		
		<div id="comments">
			<div class="comment">
				<p>
					<strong>이름</strong> - 작성 	날짜 :
				</p>
				<p>테스트 결과 재밌네요!</p>
				
				<sec:authorize access="hasRole('ROLE_ADMIN')">
				<button class="btn btn-danger btn-sm float-end delete-comment">삭제</button>
				</sec:authorize>
				
			</div>
			<div class="comment">
				<p>
					<strong>이름</strong> - 작성 날짜 :
				</p>
				<p>핑테스트 유행인가봐요 ㅎㅎ</p>
				
				<sec:authorize access="hasRole('ROLE_ADMIN')">
				<button class="btn btn-danger btn-sm float-end delete-comment">삭제</button>
				</sec:authorize>
				
			</div>
		</div>

		<form id="commentForm" class="mt-4 mb-5">
			<h4>댓글 작성</h4>
			<div class="mb-3">
				<label for="name" class="form-label">이름</label> <input type="text"
					class="form-control" id="name" required>
			</div>
			<div class="mb-3">
				<label for="comment" class="form-label">댓글</label>
				<textarea class="form-control" id="comment" rows="3" required></textarea>
			</div>
			<button type="submit" class="btn btn-primary">댓글 작성</button>
		</form>
	</div>
   </section>

	<jsp:include page="/WEB-INF/views/footer.jsp" />

	

</body>

</html>

