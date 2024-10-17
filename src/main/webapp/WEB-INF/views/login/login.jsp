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

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<script src="js/plugins.js"></script>
<script src="js/script.js"></script>
<script src="https://code.iconify.design/iconify-icon/1.0.7/iconify-icon.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/vendor.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Chilanka&family=Montserrat:wght@300;400;500&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>


</head>

<body onload="document.f.id.focus();">

	<jsp:include page="/WEB-INF/views/header.jsp" />
	
	<div class="container mb-5">
        <div class="form-container">
            <h2 class="text-center mb-5 pt-5">로그인</h2>
            
            <c:url value="/login" var="loginUrl" /> 
            <form:form name="f" action="${loginUrl}" method="POST">
                <div class="mb-3">
                    <!-- <label for="userid" class="form-label">아이디</label> -->
                    <input type="text" class="form-control" id="userid" name="userid" placeholder="아이디를 입력해주세요." required>
                    <div class="invalid-feedback">
                        아이디를 입력해주세요.
                    </div>
                </div>
      
				<div class="mb-3">
                    <!-- <label for="password" class="form-label">비밀번호</label> -->
                    <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호는 최소 6자 이상 입력해주세요." required minlength="6">
                    <div class="invalid-feedback">
                        비밀번호는 최소 6자 이상 입력해주세요.
                    </div>
                </div>
                
				<c:if test="${param.logout != null}">
				<div class="rounded p-1 mb-2 bg-danger text-light text-center">
					<p class="m-0 p-0">로그아웃 하였습니다.</p>
				</div>	
				</c:if>    
				
            	<c:if test="${param.error != null}">
            	<div class="rounded p-1 mb-2 bg-danger text-light text-center">
					<p class="m-0 p-0">아이디와 비밀번호가 잘못되었습니다.</p>
				</div>	
				</c:if>

                <div class="d-grid gap-2">
                    <button class="btn btn-primary" type="submit">로그인</button>
                    <button class="btn btn-outline-secondary" onclick="window.location.href='/join'">회원가입</button>             
                </div>
			</form:form>
        </div>
    </div>

	<div>
		<hr class="m-0">
	</div>

	<jsp:include page="/WEB-INF/views/footer.jsp" />

</body>

</html>