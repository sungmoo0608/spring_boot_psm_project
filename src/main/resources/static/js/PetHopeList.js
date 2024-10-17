$(document).ready(function() {
    $("#reservationForm").submit(function(event) {
        event.preventDefault(); // 기본 제출 방지

        // 입력값 가져오기
        let hopeno = $("#hopeno").val(); // 필요한 경우 추가
        let desertionNo = $("#desertionNo").val();
        let hdate = $("#hdate").val(); // 'YYYY-MM-DDTHH:MM' 형식으로 반환됨
        let pet_user_id = $("#pet_user_id").val();

        // insert 객체 생성
        let insert = {
            hopeno: hopeno, // 필요에 따라 사용
            desertionNo: desertionNo,
            hdate: hdate, // 이 값을 서버에 전송
            pet_user_id: pet_user_id
        };

        // 콘솔에 출력 (디버깅 용도)
        console.log(insert);

        // PetHope 객체 생성 및 insert 메서드 호출
        let pet = PetHope();
        pet.insert(insert, function(result) {
            console.log(result);
            // 성공적으로 삽입한 후 처리 로직 추가
        });
    });
});
$(document).ready(function() {
    // 예약 목록 가져오기
    function listCallback(result) {
        // 기존 내용 삭제
        $("#reservationList").html('');

        // 결과를 순회하며 카드 생성
        $(result).each(function() {
            // 날짜 및 시간 포맷팅
            const dateString = this.petHopeVO.hdate; // 날짜 문자열
            const date = new Date(dateString);
            const formattedDateTime = date.toISOString().replace('T', ' ').split(':').slice(0, 2).join(':'); // "YYYY-MM-DD HH" 형식으로 변환

            const card = `
                <div class="col-md-6">
                    <div class="card mb-4">
                        <div class="card-body" style="background-color: #f8f9fa;">
                            <h5 class="card-title">희망자 번호: ${this.petHopeVO.hopeno}</h5>
                            <p class="card-text">유기 동물 번호: 
                                <a href="/pet_content_view.html?desertionNo=${this.petHopeVO.desertionNo}">
                                    ${this.petHopeVO.desertionNo}
                                </a>
                            </p>
                            <p class="card-text">보호소명: ${this.petVO.careNm}</p>
                            <p class="card-text">방문 희망 날짜: ${formattedDateTime}</p> <!-- 포맷팅된 날짜와 시간 -->
                            <p class="card-text">희망자 ID: ${this.petHopeVO.pet_user_id}</p>
                            <button id="${this.petHopeVO.hopeno}" class="btn btn-danger btn_delete">삭제</button>
                        </div>
                    </div>
                </div>
            `;
            // 생성된 카드를 추가
            $("#reservationList").append(card);
        });
    }

    // 예약 목록 호출 예시
    let pet = PetHope();
    pet.list(listCallback);

    // 삭제 버튼 클릭 이벤트
    $(document).on("click", ".btn_delete", function() {
        const hopeno = $(this).attr("id");
        // 카드 삭제
        $(this).closest('.col-md-6').remove(); // 수정된 클래스 이름
        // 서버에서 삭제 요청
        pet.del(hopeno);
    });
});
