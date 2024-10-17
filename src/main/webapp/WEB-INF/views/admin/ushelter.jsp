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
<script src="/js/PetHope.js"></script>
<script src="/js/PetHopeList.js"> </script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/vendor.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Chilanka&family=Montserrat:wght@300;400;500&display=swap" rel="stylesheet">
</head>

<body>

	<!-- 헤더 로딩 -->
	<jsp:include page="/WEB-INF/views/header.jsp" />
	
	<!-- 중간 -->
	<section style="background: rgb(244, 243, 224)">
		<div class="container ">
			<h1 class="text-center fw-bold   mb-5 pt-5">보호소 방문 예약</h1>

			<div class="row">
				<div class="col-md-6 mb-4">
					<div class="card">
						<div class="card-header">
							<h4>
								<i class="fas fa-calendar-plus me-2"></i>새 예약 등록
							</h4>
						</div>
						<div class="card-body">
							<form id="reservationForm">
								<div class="mb-5">
									<label for="visitorName" class="form-label">이름</label> <input
										type="text" class="form-control" id="pet_user_id" required>
								</div>
								<div class="mb-5">
									<label for="visitorPhone" class="form-label">동물번호</label> <input
										type="tel" class="form-control" id="desertionNo" required>
								</div>
								<div class="mb-5">
									<label for="visitDate" class="form-label">방문 날짜</label> <input
										id="hdate" type="datetime-local" name="hdate" required>
								</div>
								<input type="submit" class="btn btn-primary" value="제출">
							</form>
						</div>

					</div>
				</div>
				<div class="col-md-6 mb-4">
					<div class="card">
						<div class="card-header">
							<h4>
								<i class="fas fa-calendar-check me-2"></i>현재 예약 상태
							</h4>
						</div>
						<div class="card-body" >
							
							<div id="reservationList" class="row">
								<!-- 예약 카드가 동적으로 추가됩니다. -->
							</div>
							<div id="noReservation" style="display: none;">
								<p>현재 예약이 없습니다.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- 예약 변경 모달 -->
	<div class="modal fade" id="editReservationModal" tabindex="-1"
		aria-labelledby="editReservationModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="editReservationModalLabel">예약 변경</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form id="editReservationForm">
						<div class="mb-3">
							<label for="editVisitDate" class="form-label">새로운 방문 날짜</label> <input
								id="hdate" type="datetime-local" name="hdate">
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary"
						onclick="updateReservation()">변경 확인</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 예약 취소 모달 -->
	<div class="modal fade" id="cancelReservationModal" tabindex="-1"
		aria-labelledby="cancelReservationModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="cancelReservationModalLabel">예약 취소</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p>정말로 예약을 취소하시겠습니까? 이 작업은 되돌릴 수 없습니다.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">아니오</button>
					<button type="button" class="btn btn-danger"
						onclick="cancelReservation()">예, 취소합니다</button>
				</div>
			</div>
		</div>
	</div>


	<script>
        document.getElementById('reservationForm').addEventListener('submit', function(e) {
            e.preventDefault();
            // 여기에 예약 등록 로직을 추가하세요.
            alert('예약이 등록되었습니다!');
        });

        function updateReservation() {
            // 여기에 예약 변경 로직을 추가하세요.
            alert('예약이 변경되었습니다!');
            $('#editReservationModal').modal('hide');
        }

        function cancelReservation() {
            // 여기에 예약 취소 로직을 추가하세요.
            alert('예약이 취소되었습니다!');
            $('#cancelReservationModal').modal('hide');
            document.getElementById('currentReservation').style.display = 'none';
            document.getElementById('noReservation').style.display = 'block';
        }
    </script>

	<!-- 푸터 로딩 -->
	<jsp:include page="/WEB-INF/views/footer.jsp" />

	<!-- 몰라용 -->
	<script src="js/jquery-1.11.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/plugins.js"></script>
	<script src="js/script.js"></script>
	<script src="https://code.iconify.design/iconify-icon/1.0.7/iconify-icon.min.js"></script>
   
</body>

</html>