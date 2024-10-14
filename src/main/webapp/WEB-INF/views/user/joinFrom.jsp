<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
			<div class="row pb-0 pb-sm-0 align-items-center ">

				<div class="col-sm-4 col-lg-4 text-center text-sm-center"></div>

				<div class="col-sm-12 col-lg-4 text-center text-sm-center">
					<div class="main-logo">
						<a href="/"> <img src="images/logo3.jpg"
							alt="logo" class="img-fluid">
						</a>
					</div>
				</div>
				<div class="col-sm-12 col-lg-4 text-end">
					<span> <a href="login.html" class="login">로그인 </a></span> <span>
						|</span> <span><a href="add.html" class="login">회원가입</a> </span>
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
							<li><a href="account.html" class="mx-3"> <iconify-icon
										icon="healthicons:person" class="fs-4"></iconify-icon>
							</a></li>

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
			<h2 class="text-center mb-4 pt-3">회원 ID 등록</h2>
			<div id="errorMessage" class="text-danger"></div>
			<form id="adminRegisterForm" action="/insertUser" method="POST" onsubmit="return validateForm()" novalidate>
                <div class="mb-3">
                    <label for="userid" class="form-label">아이디</label>
                    <input type="text" name="userid" id="userid" class="form-control" placeholder="아이디를 입력하세요." required />
                    <button type="button" onclick="checkDuplicateUser()" class="btn btn-outline-secondary mt-2">중복 체크</button>
                    <span id="useridMessage"></span>
                    <div class="invalid-feedback">아이디를 입력해주세요.</div>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">비밀번호</label>
                    <input type="password" name="password" class="form-control" placeholder="비밀번호를 입력하세요." required minlength="6" />
                    <div class="invalid-feedback">비밀번호는 최소 6자 이상이어야 합니다.</div>
                </div>
                <div class="mb-3">
                    <label for="uname" class="form-label">이름</label>
                    <input type="text" name="uname" class="form-control" placeholder="이름을 입력하세요." required />
                    <div class="invalid-feedback">이름을 입력해주세요.</div>
                </div>
                <div class="mb-3">
                    <label for="utel" class="form-label">휴대폰 번호</label>
                    <input type="text" name="utel" id="utel" class="form-control" placeholder="휴대폰 번호를 입력하세요." required />
                    <button type="button" onclick="checkDuplicatePhone()" class="btn btn-outline-secondary mt-2">중복 체크</button>
                    <span id="utelMessage"></span>
                    <div class="invalid-feedback">유효한 휴대폰 번호를 입력해주세요.</div>
                </div>
                <div class="mb-3">
                    <label for="uadd" class="form-label">주소</label>
                    <input type="text" name="uadd" class="form-control" placeholder="주소를 입력하세요." required />
                    <div class="invalid-feedback">주소를 입력해주세요.</div>
                </div>
                <div class="mb-3">
                    <label for="uemail" class="form-label">이메일</label>
                    <input type="email" name="uemail" id="uemail" class="form-control" placeholder="이메일을 입력하세요." required />
                    <button type="button" onclick="checkDuplicateEmail()" class="btn btn-outline-secondary mt-2">중복 체크</button>
                    <span id="uemailMessage"></span>
                    <div class="invalid-feedback">유효한 이메일 주소를 입력해주세요.</div>
                </div>
                <div class="d-grid gap-2">
                    <button class="btn btn-primary" type="submit">등록하기</button>
                    <button class="btn btn-secondary" type="button" onclick="window.location.href='login.html'">취소</button>
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

            var form = document.getElementById('adminRegisterForm');
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

        function checkDuplicateUser() {
            var userid = $("#userid").val();
            if (userid) {
                $.ajax({
                    url: "/checkUserId",
                    type: "GET",
                    data: { userid: userid },
                    success: function (response) {
                        if (response.exists) {
                            $("#useridMessage").text("이미 존재하는 사용자입니다.").css("color", "red");
                        } else {
                            $("#useridMessage").text("사용 가능한 아이디입니다.").css("color", "green");
                        }
                    },
                    error: function () {
                        $("#errorMessage").text("중복 체크 중 오류가 발생했습니다.");
                    }
                });
            } else {
                $("#useridMessage").text("아이디를 입력하세요.").css("color", "red");
            }
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

        function checkDuplicateEmail() {
            var uemail = $("#uemail").val();
            if (uemail) {
                $.ajax({
                    url: "/checkUserEmail",
                    type: "GET",
                    data: { uemail: uemail },
                    success: function (response) {
                        if (response.exists) {
                            $("#uemailMessage").text("이미 존재하는 이메일입니다.").css("color", "red");
                        } else {
                            $("#uemailMessage").text("사용 가능한 이메일입니다.").css("color", "green");
                        }
                    },
                    error: function () {
                        $("#errorMessage").text("중복 체크 중 오류가 발생했습니다.");
                    }
                });
            } else {
                $("#uemailMessage").text("이메일을 입력하세요.").css("color", "red");
            }
        }
        
        
    </script>

</body>

</html>