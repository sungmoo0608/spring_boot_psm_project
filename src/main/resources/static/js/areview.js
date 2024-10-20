
$(document).ready(function() {

    // 게시글 리스트를 카드 형식으로 추가하는 함수
    function listCallback(result) {	
        let htmls = "";
		
        // 기존 내용 삭제
        $("#list-cards").html(''); // 카드 리스트 내의 내용 삭제
		
        // 결과를 순회하며 카드 생성
        $(result).each(function() {
            htmls += '<div class="col-md-4 mb-4">';
            htmls += '<div class="card h-100">';
            htmls += '<div class="card-body" style="background-color: white; border-radius: 15px; padding: 20px;">';
			htmls += '<h5 class="card-title fw-bolder">' + '<a href="/pboard/petboard_content_view?bnum=' + this.petboards.bnum + '" class="text-decoration-none">' +  this.petboards.btitle +  '</a>' + '</h5>';
			htmls += '<p class="card-text">' + this.petboards.bcontent + '</p>';
            htmls += '<p class="card-text"><small class="text-muted">작성자 : ' + this.petboards.userid + 
                     ' | 날짜 : ' + this.petboards.bdate; 
			htmls += '<button class="btn btn-danger btn-sm float-end delete-post" data-id="' + 
					              this.petboards.bnum + '">삭제</button>';
					 htmls += '</small></p>';
            htmls += '</div></div></div>'; // 카드 닫기
        }); // each end

        // 생성된 HTML을 카드 리스트에 추가
        $('#list-cards').append(htmls);
    }

    // 게시글 리스트 가져오기
    let pet = PetBoard();
    pet.list(3, listCallback);

    // 카드에서 삭제 버튼 클릭 시 동작
    $(document).on("click", ".delete-post", function() {
        const postId = $(this).data("id"); // 버튼의 data-id 속성에서 게시글 ID를 가져옴
        console.log(postId);
		
        // 카드 삭제
        $(this).closest(".col-md-4").remove();
		
        // 서버에 삭제 요청
        pet.del(postId);
    });
});

