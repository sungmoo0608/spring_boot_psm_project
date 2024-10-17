$(document).ready(function() {
    // 게시글 리스트를 테이블 형식으로 추가하는 함수
    function listCallback(result) {	
        let htmls = "";
		
        // 기존 내용 삭제
        $("#list-table").html(''); // 테이블 내의 내용 삭제
		
        // 결과를 순회하며 테이블 행 생성
        $(result).each(function() {
            htmls += '<tr>';
            htmls += '<th scope="row">' + this.petboards.bnum + '</th>';
            htmls += '<td><a href="/petboard_content_view.html?bnum=' + this.petboards.bnum + '" class="text-decoration-none">' + this.petboards.btitle + '</a></td>';
            htmls += '<td>' + this.petboards.pet_user_id + '</td>';
            htmls += '<td>' + this.petboards.bdate + '</td>';
            htmls += '<td><a href="qna_write.html"><span class="badge text-bg-secondary">답글 쓰기</span></a></td>';
            htmls += '<td><button class="btn btn-danger btn-sm delete-post" data-id="' + this.petboards.bnum + '">삭제</button></td>';
            htmls += '</tr>'; // 각 행의 끝
        }); // each end

        // 생성된 HTML을 테이블에 추가
        $('#list-table').append(htmls);
    }

    // 게시글 리스트 가져오기
    let pet = PetBoard();
    pet.list(2, listCallback);

    // 테이블에서 삭제 버튼 클릭 시 동작
    $(document).on("click", ".delete-post", function() {
        const postId = $(this).data("id"); // 버튼의 data-id 속성에서 게시글 ID를 가져옴
        console.log(postId);
		
        // 행 삭제
        $(this).closest("tr").remove();
		
        // 서버에 삭제 요청
        pet.del(postId);
    });
});