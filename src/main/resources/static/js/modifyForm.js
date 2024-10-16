(function () {
	'use strict';

	var form = document.getElementById('modifyForm');
	form.addEventListener('submit', function (event) {
		if (!form.checkValidity()) {
				event.preventDefault();
				event.stopPropagation();
			}

			form.classList.add('was-validated');
			}, false);})();

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