$(document).ready(function() {
	function listCallback(result) {
		let htmls = "";

		// 기존 내용 삭제
		$("#list-table").html('');

		// 결과를 순회하며 HTML 생성
		$(result).each(function() {
			htmls += '<div class="col-lg-3 col-md-4 col-sm-12">';
			htmls += '<div class="card shadow-sm mb-3">';
			htmls += '<a href="/pet/pet_content_view?desertionNo=' + this.desertionNo + '"><img src="' + this.popfile + '" alt="Image" class="img-fluid"></a>';
			htmls += '<div class="card-body bg-light">';
			htmls += '<div class="bg-dark text-light rounded p-1 m-1"> 성별: ' + this.sexCd + '</div>'; // 성별
			htmls += '<div class="bg-dark text-light rounded p-1 m-1"> 나이: ' + this.age + '</div>'; // 나이
			htmls += '<div class="bg-dark text-light rounded p-1 m-1"> 품종: ' + this.kindCd + '</div>'; // 품종
			htmls += '<div class="bg-dark text-light rounded p-1 m-1"> 지역: ' + this.happenPlace + '</div>'; // 지역
			htmls += '<div class="bg-dark text-light rounded p-1 m-1"> 상황: ' + this.processState + '</div>'; // 상황
			htmls += '<div class="bg-success text-light rounded p-1 m-1 text-center">';
			htmls += '<button id="' + this.desertionNo + '" type="button" class="btn_delete btn">삭제</button>';
			htmls += '</div>';
			htmls += '</div></div></div>'; // 카드 닫기
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
