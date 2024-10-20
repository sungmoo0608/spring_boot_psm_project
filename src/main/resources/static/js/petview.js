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
			htmls += '<div class="pet-gender text-light p-1 m-1"> 성별: ' + this.sexCd + '</div>'; // 성별
			htmls += '<div class="pet-age text-light p-1 m-1"> 나이: ' + this.age + '</div>'; // 나이
			htmls += '<div class="pet-breed text-light p-1 m-1"> 품종: ' + this.kindCd + '</div>'; // 품종
			htmls += '<div class="pet-location text-light p-1 m-1"> 지역: ' + this.happenPlace + '</div>'; // 지역
			htmls += '<div class="pet-situation text-light p-1 m-1"> 상황: ' + this.processState + '</div>'; // 상황
			// 삭제 버튼은 ROLE_ADMIN만 보임
			htmls += '<div class="bg-success text-light rounded p-1 m-1 text-center">';
			htmls += '<sec:authorize access="hasRole(\'ROLE_ADMIN\')">';
			htmls += '<button id="' + this.desertionNo + '" type="button" class="btn_delete btn">삭제</button>';
			htmls += '</sec:authorize>';
			htmls += '</div>';
			htmls += '</div></div></div>'; // 카드 닫기
		}); // each end

		// 생성된 HTML을 리스트에 추가
		console.log(htmls)
		$('#list-table').append(htmls);
		
		// 페이지 네이션 추가
			let paginationHtml = '<nav aria-label="Page navigation"><ul class="pagination justify-content-center">';
			
			// 이전 버튼
			if (result.currentPage > 1) {
				paginationHtml += '<li class="page-item"><a class="page-link" href="?pageNum=' + (result.currentPage - 1) + '&amount=' + result.pageSize + '">Previous</a></li>';
			}

			// 페이지 번호
			for (let i = 1; i <= result.totalPages; i++) {
				paginationHtml += '<li class="page-item ' + (i === result.currentPage ? 'active' : '') + '">';
				paginationHtml += '<a class="page-link" href="?pageNum=' + i + '&amount=' + result.pageSize + '">' + i + '</a></li>';
			}

			// 다음 버튼
			if (result.currentPage < result.totalPages) {
				paginationHtml += '<li class="page-item"><a class="page-link" href="?pageNum=' + (result.currentPage + 1) + '&amount=' + result.pageSize + '">Next</a></li>';
			}

			paginationHtml += '</ul></nav>';

			// 페이지 네이션을 DOM에 추가
			$('#list-table').after(paginationHtml);
			
	}

	// 예시로 lostDog() 호출 후 listCallback을 사용하는 코드
	let pet = lostDog();
	pet.list(listCallback);

	$(document).on("click", ".btn_delete", function() {
		const petId = $(this).attr("id");
		console.log(petId);
		
		// 삭제 확인 대화 상자 표시
		if (confirm("정말 삭제할까요?")) {
			// 서버에 삭제 요청
			let pet = lostDog();
			pet.del(petId).then(() => {
				// 삭제 후 리스트를 다시 불러옴
				pet.list(listCallback);
			});
		}

	});
});
