<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입 페이지</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<h1>회원가입 페이지</h1>
<hr/>
<c:if test="${not empty error}">
    <p style="color: red;">${error}</p>
</c:if>
<form action="${pageContext.request.contextPath}/insertUser" method="POST" onsubmit="return validateForm()">
    <input type="text" name="username" placeholder="이름을 입력하세요." required /> <br/>
    <input type="text" name="userid" id="userid" placeholder="아이디를 입력하세요." required /> 
    <button type="button" onclick="checkDuplicateUser()">중복 체크</button> <span id="useridMessage"></span> <br/>
    <input type="password" name="password" placeholder="비밀번호를 입력하세요." required minlength="6"/> <br/>
    <input type="text" name="utel" placeholder="휴대폰 번호를 입력하세요." required/> <br/>
    <input type="text" name="uadd" placeholder="주소를 입력하세요." required/> <br/>
    <input type="email" name="uemail" placeholder="이메일을 입력하세요." required/> <br/>
    <button type="submit">회원가입</button>
</form>

<script>
function validateForm() {
    var password = document.forms[0]["password"].value;
    if (password.length < 6) {
        alert("비밀번호는 최소 6자 이상이어야 합니다.");
        return false;
    }
    return true;
}

function checkDuplicateUser() {
    var userid = $("#userid").val();
    if (userid) {
        $.ajax({
            url: "${pageContext.request.contextPath}/checkUserId",
            type: "GET",
            data: { userid: userid },
            success: function(response) {
                if (response.exists) {
                    $("#useridMessage").text("이미 존재하는 사용자입니다.").css("color", "red");
                } else {
                    $("#useridMessage").text("사용 가능한 아이디입니다.").css("color", "green");
                }
            },
            error: function() {
                alert("중복 체크 중 오류가 발생했습니다.");
            }
        });
    } else {
        $("#useridMessage").text("아이디를 입력하세요.").css("color", "red");
    }
}
</script>

[<a href="/oauth2/authorization/google">구글 로그인</a>]
</body>
</html>
