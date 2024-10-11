<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 탈퇴 페이지</title>
</head>
<body>
<h1>회원 탈퇴 페이지</h1>
<hr/>
<c:if test="${not empty error}">
    <p style="color: red;">${error}</p>
</c:if>
<form action="${pageContext.request.contextPath}/deleteUser" method="POST">
    <!-- 사용자 ID를 세션에서 가져옵니다 -->
    <input type="hidden" name="userid" value="${userid}" />
    
    <p>사용자 ID: ${userid}</p> <!-- 로그인된 사용자 ID 표시 -->
    
    <input type="password" name="password" placeholder="비밀번호를 입력하세요." required/> <br/>
    
    <button type="submit">회원 탈퇴</button>
</form>
</body>
</html>
