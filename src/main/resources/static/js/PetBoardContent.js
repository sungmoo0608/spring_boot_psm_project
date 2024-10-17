$(document).ready(function() {
    let searchParams = new URLSearchParams(window.location.search);
    let bnum = searchParams.get('bnum');

    function getboard(petboards) {
        $("#input_hidden").val(petboards.cate_no);
        $("#bnum").text(petboards.bnum);
        $("#bhit").text(petboards.bhit);
        $("#pet_USER_ID").val(petboards.pet_USER_ID);

        let cateno = parseInt(petboards.cate_no, 10);
        let h1Text = "";

        switch (cateno) {
            case 1:
                h1Text = "공지사항";
                break;
            case 2:
                h1Text = "Q & A";
                break;
            case 3:
                h1Text = "입양후기";
                break;
            default:
                h1Text = "알 수 없는 카테고리";
        }

        $("#title").text(h1Text);

        // 새로운 div를 list-table에 추가
        const boardDiv = `
            <div class="col-md-12 mb-4">
                <div class="card">
                    <div class="card-body">
                        <form id="updateboard">
						<input id="input_hidden" type="hidden" name="cate_no" value="${petboards.cate_no}">
						<input id="bnum" type="hidden" name="bnum" value="${petboards.bnum}">
                        <label for="btitle">제목</label>                      
                        <input type="text" id="btitle" class="form-control" value="${petboards.btitle}">
                        
                        <label for="bcontent" class="mt-3">내용</label>
                        <textarea id="bcontent" class="form-control" rows="4">${petboards.bcontent}</textarea>
                        <p class="card-text mt-3">작성자: ${petboards.pet_user_id}</p>
                        <p class="card-text mt-3">조회수: ${petboards.bhit}</p>
                        <p class="card-text">카테고리: ${h1Text}</p>
                        <input type="submit" id="modifyButton" class="btn btn-primary mt-3" value="수정">
                        </form>
                    </div>
                </div>
            </div>
        `;
        $("#list-table").append(boardDiv); // list-table에 추가
    }

    // 보드 정보를 가져옴
    let board = PetBoard();
    board.get(bnum, getboard);
	});
    
	$(document).ready(function() {
	$(document).on('submit', '#updateboard', function(event) { // 이벤트 위임
	        event.preventDefault();
	        let bnum = $("#bnum").text();
	        let btitle = $("#btitle").val();
	        let bcontent = $("#bcontent").val();

	        let modify = {
	            bnum: bnum,
	            btitle: btitle,
	            bcontent: bcontent
	        };

	        let board = PetBoard();
	        board.modify(modify, function(result) {
	            console.log(result); // 응답 확인

	            if (result.success) { // 서버의 성공 여부 확인
	                let url = '/areview.html';
	                location.href = url; // URL 변경
	            } else {
	                console.error('수정 실패:', result.message);
	            }
	        });
	    });
		});