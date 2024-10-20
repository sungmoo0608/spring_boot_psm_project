<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="${pageContext.request.contextPath}/js/PetHope.js"></script>

<script type="text/javascript">
$(document).ready(function(){

function listCallback(result) {	
	let htmls = "";
	
	// 기존 내용 삭제
	$("#list-table").html('');
	// 컬럼명들
	$("<tr>" , {
		html :  "<td>" + "희망자 번호" + "</td>"+
				"<td>" + "유기동물번호" + "</td>"+
				"<td>" + "보호소명" + "</td>" +
				"<td>" + "방문희망날자" + "</td>"+
				"<td>" + "희망자 id" + "</td>" +
				"<td colspan='5'>" + '<a href="/pethopewrite_view.html">' + "신청서 작성" + '</a>' + '</td>'	
	}).appendTo("#list-table");
	
	// 결과를 순회하며 HTML 생성
	$(result).each(function() {
		htmls += '<tr>';
		htmls += '<td>' + this.petHopeVO.hopeno + '</td>'; 
		htmls += '<td>' +
	    '<a href="/pet_content_view.html?desertionNo=' + this.petHopeVO.desertionNo + '">' + this.petHopeVO.desertionNo + '</a>' + '</td>';
	    htmls += '<td>' + this.petVO.careNm + '</td>';
		htmls += '<td>' + this.petHopeVO.hdate + '</td>';
		htmls += '<td>' + this.petHopeVO.userid + '</td>'; 
		htmls += '<td>'+ '<input id=' + this.petHopeVO.hopeno + " type='button' class='btn_delete' value='삭제'>" + '</td>';
		htmls += '</tr>'; // 각 행의 끝
		
	}); // each end

	// 생성된 HTML을 테이블에 추가
	$('#list-table').append(htmls);
}

// 예시로 lostDog() 호출 후 listCallback을 사용하는 코드
let pet = PetHope();
pet.list(listCallback);

});
</script>

<script type="text/javascript">
$(document).ready(function(){
	
	$(document).on("click","#list-table .btn_delete", function(){
		console.log($(this).attr("id"))
		
		$(this).parent().parent().remove();
		
		let pet = PetHope();
		pet.del($(this).attr("id"));
		
	});
	
});
</script>
</head>
<body>
<h1>입양희망</h1>
	<table id="list-table" width="800" cellpadding="0" cellspacing="0"
		border="1">

	</table>
</body>
</html>