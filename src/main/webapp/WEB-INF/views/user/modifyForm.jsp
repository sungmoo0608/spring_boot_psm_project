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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"> </script>

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
			<h2 class="text-center mb-4 pt-3">회원 정보 수정</h2>
			<div id="errorMessage" class="text-danger"></div>
			<form id="modifyForm" action="/modify" method="POST">
				<input type="hidden" name="userid" value="${user.userid}"/>
                <div class="mb-3">
                    <label for="userid" class="form-label">아이디</label>
                    <input type="text" name="userid" class="form-control" value="${user.userid}" readonly />
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">비밀번호</label>
                    <input type="password" name="password" class="form-control" placeholder="새 비밀번호 (변경할 경우만 입력)" required minlength="6" />
                    <div class="invalid-feedback">비밀번호는 최소 6자 이상이어야 합니다.</div>
                </div>
                <div class="mb-3">
                    <label for="uname" class="form-label">이름</label>
                    <input type="text" name="uname" class="form-control" placeholder="이름을 입력하세요." value="${user.uname}" required />
                    <div class="invalid-feedback">이름을 입력해주세요.</div>
                </div>
                <div class="mb-3">
                    <label for="utel" class="form-label">휴대폰 번호</label>
                    <input type="text" name="utel" id="utel" class="form-control" placeholder="휴대폰 번호를 입력하세요." value="${user.utel}" required />
                    <button type="button" onclick="checkDuplicatePhone()" class="btn btn-outline-secondary mt-2">중복 체크</button>
                    <span id="utelMessage"></span>
                    <div class="invalid-feedback">유효한 휴대폰 번호를 입력해주세요.</div>
                </div>
                
				<div class="mb-3">
					<label for="zipcode" class="form-label">우편번호</label> 
					<input type="text" id="zipcode" name="zipcode" class="form-control" placeholder="우편번호 찾기 버튼 클릭 후 검색해주세요." value="${user.zipcode}"/> 
					<input type="button" onclick="findAddr()" value="우편번호 찾기" class="btn btn-outline-secondary mt-2">		
				</div>
				
				<div class="mb-3">
					<label for="streetAdr" class="form-label">주소</label> 
					<input type="text" id="streetAdr" name="uadr" class="form-control" placeholder="주소를 입력하세요." value="${user.uadr}" required readonly />
					<div class="invalid-feedback">주소를 입력해주세요.</div>
				</div>
				
				<div class="mb-3">
					<label for="detailAdr" class="form-label">상세주소</label>
					<input type="text" id="detailAdr" name="uadrdetail" class="form-control" placeholder="상세주소를 입력하세요." value="${user.uadrdetail}" required />
				</div>
				
				<div class="mb-3">
				    <label for="uemail" class="form-label">이메일</label> 
				    <div class="input-group">
				        <input type="text" name="uemail" id="emailInput" class="form-control" placeholder="이메일을 입력하세요." value="${user.uemail}" required />
				        <select id="emailDomain" class="form-select" onchange="updateEmail()">
				   			<option value="">직접 입력 / 도메인 선택</option>
				            <option value="@naver.com">@naver.com</option>
				            <option value="@nate.com">@nate.com</option>
				            <option value="@daum.net">@daum.net</option>
				            <option value="@hanmail.net">@hanmail.net</option>
				            <option value="@kakao.com">@kakao.com</option>
				            <option value="@gmail.com">@gmail.com</option>
				        </select>
				    </div>
				    <button type="button" onclick="checkDuplicateEmail()" class="btn btn-outline-secondary mt-2">중복 체크</button>
				    <span id="uemailMessage"></span>
				    <div class="invalid-feedback">유효한 이메일 주소를 입력해주세요.</div>
				</div>
				<div class="d-grid gap-2">
                    <button class="btn btn-primary" type="submit">수정하기</button>
                    <button class="btn btn-secondary" type="button" onclick="window.location.href='/'">취소</button>
                </div>
            </form>

		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/footer.jsp" />
	

	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="${pageContext.request.contextPath}/js/modifyForm.js"></script>

</body>

</html>

