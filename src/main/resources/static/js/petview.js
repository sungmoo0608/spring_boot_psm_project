$(document).ready(function() {
	function listCallback(result) {
		let htmls = "";

		// 기존 내용 삭제
		$("#list-table").html('');

		// 결과를 순회하며 HTML 생성
		$(result).each(function() {
			htmls += '<div class="col-md-3 col-sm-3">';
			htmls += '<div class="card shadow-sm mb-3">';
			htmls += '<a href="/pet_content_view.html?desertionNo=' + this.desertionNo + '"><img src="' + this.filename + '" alt="Image" style="width: 100%; height: 150px;"></a>';
			htmls += '<div class="card-body bg-light">';
			htmls += '<p class="card-text fw-bold">';
			htmls += '성별: <span class="pet-gender">' + this.sexCd + '</span><br>'; // 성별
			htmls += '나이: <span class="pet-age">' + this.age + '</span><br>'; // 나이
			htmls += '품종: <span class="pet-breed">' + this.kindCd + '</span><br>'; // 품종
			htmls += '지역: <span class="pet-location">' + this.happenPlace + '</span><br>'; // 지역
			htmls += '상황: <span class="pet-situation">' + this.processState + '</span><br>'; // 상황
			htmls += '</p>';
			htmls += '<div class="d-flex justify-content-between align-items-center">';
			htmls += '<button id="' + this.desertionNo + '" type="button" class="btn_delete">삭제</button>';
			htmls += '</div></div></div></div>'; // 카드 닫기
		}); // each end

		// 생성된 HTML을 리스트에 추가
		console.log(htmls)
		$('#list-table').append(htmls);
	}

	// 예시로 lostDog() 호출 후 listCallback을 사용하는 코드
	let pet = lostDog();
	pet.list(listCallback);

	$(document).on("click", ".btn_delete", function() {
		const petId = $(this).attr("id");
		console.log(petId);

		// 카드 삭제
		$(this).closest('.col-md-3').remove();

		// 서버에 삭제 요청
		let pet = lostDog();
		pet.del(petId);
	});
});
