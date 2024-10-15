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
</head>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">

<link rel="stylesheet" type="text/css" href="css/vendor.css">

<link rel="stylesheet" type="text/css" href="style.css">

<link rel="preconnect" href="https://fonts.googleapis.com">

<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link
	href="https://fonts.googleapis.com/css2?family=Chilanka&family=Montserrat:wght@300;400;500&display=swap"
	rel="stylesheet">
</head>

<body>

	<header>
		<div class="container ">
			<div class="row pb-0 pb-sm-0 my-5 align-items-center ">

				<div class="col-sm-12 col-lg-4 text-center ">
						<!-- 로그인이 완료된 사람 -->
						<sec:authorize access="isAuthenticated()">
							<span><sec:authentication property="principal.username"/>님 환영합니다.</span>
						</sec:authorize>
				</div>

				<div class="col-sm-12 col-lg-4 text-center">
					<div class="main-logo">
						<a href="/"> <img src="images/logo3.jpg" alt="logo" class="img-fluid">
						</a>
					</div>
				</div>
				<div class="col-sm-12 col-lg-4 text-center">
					
					<!-- 로그인이 안된 사람 -->
						<sec:authorize access="isAnonymous()">
							<span> <a href="<c:url value="/login" />">로그인</a> </span>
							<span>|</span> 
							<span><a href="<c:url value="/join" />" class="login">회원가입</a> </span>
						</sec:authorize>
					   

						<!-- 로그인이 완료된 사람 -->	
						<sec:authorize access="isAuthenticated()">	
							<span><a href="<c:url value="/mypage" />" class="login">마이페이지</a> </span>
							<span>|</span> 
							<a href="<c:url value="/logout" />" class="login">로그아웃</a>
						</sec:authorize>
				</div>
			</div>
		</div>

		<div class="container-fluid">
			<hr class="m-0">
		</div>

		<section>
			<div class="container">
				<nav class="main-menu d-flex navbar navbar-expand-lg ">

					<div class="d-flex d-lg-none align-items-end mt-3">
					
						<ul class="d-flex justify-content-end list-unstyled m-0">
							<!-- 로그인이 완료된 사람 -->	
							<sec:authorize access="isAuthenticated()">	
								<li><a href="<c:url value="/mypage" />" class="mx-3"> 
								<iconify-icon icon="healthicons:person" class="fs-4"></iconify-icon>
								</a></li>
								
								<li><a href="wishlist.html" class="mx-3"> 
								<iconify-icon icon="mdi:heart" class="fs-4"></iconify-icon>
								</a></li>
							</sec:authorize>
						</ul>

					</div>

					<button class="navbar-toggler" type="button"
						data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
						aria-controls="offcanvasNavbar">
						<span class="navbar-toggler-icon"></span>
					</button>

					<div class="offcanvas offcanvas-end" tabindex="-1"
						id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">

						<div class="offcanvas-header justify-content-center">
							<button type="button" class="btn-close"
								data-bs-dismiss="offcanvas" aria-label="Close"></button>
						</div>

						<div class="offcanvas-body justify-content-center">
							<ul
								class="navbar-nav menu-list list-unstyled d-flex gap-md-3 mb-0">

								<li class="nav-item"><a href="pet.html" class="nav-link">입양
										대기 동물 관리</a></li>
								<br>


								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" role="button" id="pages"
									data-bs-toggle="dropdown" aria-expanded="false">회원 관리</a>
									<ul class="dropdown-menu" aria-labelledby="pages">
										<li><a href="hope.html" class="dropdown-item">입양 회원
												정보 관리</a></li>
										<li><a href="shelter.html" class="dropdown-item">입양
												대기소 방문 예약 관리</a></li>
										<li><a href="find.html" class="dropdown-item">반려 동물
												찾아요 관리</a></li>
									</ul></li>
								<br>

								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" role="button" id="pages"
									data-bs-toggle="dropdown" aria-expanded="false">게시글 관리</a>
									<ul class="dropdown-menu" aria-labelledby="pages">
										<li><a href="notice.html" class="dropdown-item">공지 사항</a></li>
										<li><a href="areview.html" class="dropdown-item">입양
												후기</a></li>
										<li><a href="qna.html" class="dropdown-item">Q & A</a></li>
										<li><a href="border.html" class="dropdown-item">기타 자료</a></li>
									</ul></li>
								<br>
								</li>

							</ul>

						</div>

					</div>

				</nav>



			</div>
		</section>
	</header>

	<div class="container">
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
                    <input type="password" name="password" class="form-control" placeholder="새 비밀번호 (변경할 경우만 입력)" value="${user.userid}"required minlength="6" />
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
				   			<option value="">직접 입력</option>
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

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js">
	</script>
	
	    <script>
        (function () {
            'use strict';

            var form = document.getElementById('modifyForm');
            form.addEventListener('submit', function (event) {
                if (!form.checkValidity()) {
                    event.preventDefault();
                    event.stopPropagation();
                }

                form.classList.add('was-validated');
            }, false);
        })();

        function validateForm() {
            var password = document.forms[0]["password"].value;
            if (password.length < 6) {
                alert("비밀번호는 최소 6자 이상이어야 합니다.");
                return false;
            }
            return true;
        }
        
        function checkDuplicatePhone() {
            var utel = $("#utel").val();
            if (utel) {
                $.ajax({
                    url: "/checkUserPhone",
                    type: "GET",
                    data: { utel: utel },
                    success: function (response) {
                        if (response.exists) {
                            $("#utelMessage").text("이미 존재하는 휴대폰 번호입니다.").css("color", "red");
                        } else {
                            $("#utelMessage").text("사용 가능한 휴대폰 번호입니다.").css("color", "green");
                        }
                    },
                    error: function () {
                        $("#errorMessage").text("중복 체크 중 오류가 발생했습니다.");
                    }
                });
            } else {
                $("#utelMessage").text("휴대폰 번호를 입력하세요.").css("color", "red");
            }
        }
        
		function updateEmail() {
		    const emailInput = document.getElementById('emailInput');
		    const emailDomain = document.getElementById('emailDomain').value;

		    // "직접 입력"이 선택된 경우 입력값을 변경하지 않음
		    if (emailDomain === "") {
		        return;
		    }

		    // 선택한 도메인을 이메일 입력값에 추가
		    const currentEmail = emailInput.value.split('@')[0]; // '@' 앞부분 가져오기
		    emailInput.value = currentEmail + emailDomain; // 새로운 값 설정
		}

		function checkDuplicateEmail() {
		    const emailInput = document.getElementById('emailInput').value;
		    if (emailInput) {
		        $.ajax({
		            url: "/checkUserEmail",
		            type: "GET",
		            data: {
		                uemail: emailInput
		            },
		            success: function(response) {
		                if (response.exists) {
		                    $("#uemailMessage").text("이미 존재하는 이메일입니다.").css("color", "red");
		                } else {
		                    $("#uemailMessage").text("사용 가능한 이메일입니다.").css("color", "green");
		                }
		            },
		            error: function() {
		                $("#errorMessage").text("중복 체크 중 오류가 발생했습니다.");
		            }
		        });
		    } else {
		        $("#uemailMessage").text("이메일 주소를 입력해주세요.").css("color", "red");
		    }
		}
        
        
        $(document).ready(function() {
            $('#modifyForm').on('submit', function(event) {
                event.preventDefault(); // 기본 제출 방지

                // 폼 데이터 가져오기
                var formData = {
                    userid: $('input[name="userid"]').val(),
                    password: $('input[name="password"]').val(),
                    uname: $('input[name="uname"]').val(),
                    utel: $('input[name="utel"]').val(),
                    zipcode: $('input[name="zipcode"]').val(),
                    uadr: $('input[name="uadr"]').val(),
                    uadrdetail: $('input[name="uadrdetail"]').val(),
                    uemail: $('input[name="uemail"]').val()
                };

                $.ajax({
                    url: '/modify', // PUT 요청할 URL
                    type: 'PUT',
                    contentType: 'application/json',
                    data: JSON.stringify(formData),
                    success: function(response) {
                        // 성공 시 처리
                        alert('회원정보가 수정되었습니다.');
                        window.location.href = '/'; // 수정 완료 후 리다이렉트
                    },
                    error: function(xhr) {
                        // 오류 시 처리
                        alert('수정 중 오류가 발생했습니다: ' + xhr.responseText);
                    }
                });
            });
        });

    </script>
    
    	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<script>
		function findAddr() {
			console.log('주소찾기 메서드 findAddr() 실행')
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}

								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}

								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}

								// 조합된 참고항목을 해당 필드에 넣는다.
								document.getElementById("detailAdr").value = extraAddr;
							} else {
								document.getElementById("detailAdr").value = '';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('zipcode').value = data.zonecode;
							document.getElementById("streetAdr").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("detailAdr").focus();
						}
					}).open();
		}
	</script>

</body>

</html>

