(function() {
			'use strict';

			var form = document.getElementById('adminRegisterForm');
			form.addEventListener('submit', function(event) {
				if (!form.checkValidity()) {
					event.preventDefault();
					event.stopPropagation();
				}

				form.classList.add('was-validated');
			}, false);
		})();

		function validateForm() {
			var password = document.forms[0]["password"].value;
			
			// 비밀번호 유효성 검사
			if (password.length < 6) {
				alert("비밀번호는 최소 6자 이상이어야 합니다.");
				return false;
			}

			// ** 중복 체크 여부 확인 **
			if ($("#useridMessage").text().includes("이미 존재하는 ID입니다.")
					|| $("#utelMessage").text().includes("이미 존재하는 휴대폰 번호입니다.")
					|| $("#uemailMessage").text().includes("이미 존재하는 이메일입니다.")) {
				alert("중복되는 정보가 있어 등록할 수 없습니다. 확인해주세요.");
				return false; // 중복된 값이 있으면 등록을 하지 않습니다.
			}

			// ** 중복 체크가 수행되지 않았을 경우 경고창 표시 **
			if (!$("#useridMessage").text() || !$("#utelMessage").text()
					|| !$("#uemailMessage").text()) {
				alert("모든 중복 체크를 완료해주세요.");
				return false;
			}

			return true;

		}

		function checkDuplicateUser() {
			var userid = $("#userid").val();
			if (userid) {
				$.ajax({
					url : "/checkUserId",
					type : "GET",
					data : {
						userid : userid
					},
					success : function(response) {
						if (response.exists) {
							$("#useridMessage").text("이미 존재하는 ID입니다.").css(
									"color", "red");
						} else {
							$("#useridMessage").text("사용 가능한 ID입니다.").css(
									"color", "green");
						}
					},
					error : function() {
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
					url : "/checkUserPhone",
					type : "GET",
					data : {
						utel : utel
					},
					success : function(response) {
						if (response.exists) {
							$("#utelMessage").text("이미 존재하는 휴대폰 번호입니다.").css(
									"color", "red");
						} else {
							$("#utelMessage").text("사용 가능한 휴대폰 번호입니다.").css(
									"color", "green");
						}
					},
					error : function() {
						$("#errorMessage").text("중복 체크 중 오류가 발생했습니다.");
					}
				});
			} else {
				$("#utelMessage").text("휴대폰 번호를 입력하세요.").css("color", "red");
			}
		}

		document.addEventListener("DOMContentLoaded", function() {
			document.getElementById("utel").addEventListener("keyup",
					function(event) {
						inputPhoneNumber(event.target);
					});
		});

		function inputPhoneNumber(phone) {
			if (event.keyCode != 8) {
				const regExp = new RegExp(/^[0-9]{2,3}-^[0-9]{3,4}-^[0-9]{4}/g);
				if (phone.value.replace(regExp, "").length != 0) {
					if (checkPhoneNumber(phone.value) == true) {
						let number = phone.value.replace(/[^0-9]/g, "");
						let tel = "";
						let seoul = 0;
						if (number.substring(0, 2).indexOf("02") == 0) {
							seoul = 1;
							phone.setAttribute("maxlength", "12");
							console.log(phone);
						} else {
							phone.setAttribute("maxlength", "13");
						}
						if (number.length < (4 - seoul)) {
							return number;
						} else if (number.length < (7 - seoul)) {
							tel += number.substr(0, (3 - seoul));
							tel += "-";
							tel += number.substr(3 - seoul);
						} else if (number.length < (11 - seoul)) {
							tel += number.substr(0, (3 - seoul));
							tel += "-";
							tel += number.substr((3 - seoul), 3);
							tel += "-";
							tel += number.substr(6 - seoul);
						} else {
							tel += number.substr(0, (3 - seoul));
							tel += "-";
							tel += number.substr((3 - seoul), 4);
							tel += "-";
							tel += number.substr(7 - seoul);
						}
						phone.value = tel;
					} else {
						const regExp = new RegExp(/[^0-9|^-]*$/);
						phone.value = phone.value.replace(regExp, "");
					}
				}
			}
		}

		function checkPhoneNumber(number) {
			const regExp = new RegExp(/^[0-9|-]*$/);
			if (regExp.test(number) == true) {
				return true;
			} else {
				return false;
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