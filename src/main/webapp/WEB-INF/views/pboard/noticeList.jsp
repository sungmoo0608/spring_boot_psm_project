<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>



<script type="text/javascript">
$(document).ready(function(){

function listCallback(result) {	
	let htmls = "";
	
	// 기존 내용 삭제
	$("#list-table").html('');
	// 컬럼명들
	$("<tr>" , {
		html :  "<td>" + "글 종류" + "</td>"+
				"<td>" + "글 번호" + "</td>"+				
				"<td>" + "제목" + "</td>"+
				"<td>" + "내용" + "</td>"+
				"<td>" + "조회수" + "</td>"+
				"<td>" + "작성일" + "</td>"+
				"<td>" + "작성자" + "</td>"+
				"<td colspan='5'>" + '<a href="/petboardwrite_view.html">' + "글작성" + '</a>' + '</td>'	
	}).appendTo("#list-table")
	
	// 결과를 순회하며 HTML 생성
	$(result).each(function() {
		htmls += '<tr>';
		htmls += '<td>' + this.categories.cate_name + '</td>'; 
		htmls += '<td>' + this.petboards.bnum + '</td>'; 
		htmls += '<td>' +
	    '<a href="/petboard_content_view.html?bnum=' + this.petboards.bnum + '">' + this.petboards.btitle + '</a>' + '</td>';
		htmls += '<td>' + this.petboards.bcontent + '</td>';
		htmls += '<td>' + this.petboards.bhit + '</td>'; 
		htmls += '<td>' + this.petboards.bdate + '</td>'; 
		htmls += '<td>' + this.petboards.userid + '</td>'; 
		htmls += '<td>'+ '<input id=' + this.petboards.bnum + " type='button' class='btn_delete' value='삭제'>" + '</td>';
		htmls += '</tr>'; // 각 행의 끝
	}); // each end

	// 생성된 HTML을 테이블에 추가
	$('#list-table').append(htmls);
}

// 예시로 lostDog() 호출 후 listCallback을 사용하는 코드
let pet = PetBoard();
pet.list(1 ,listCallback);

});
</script>

</script>
<script type="text/javascript">
$(document).ready(function(){
	
	$(document).on("click","#list-table .btn_delete", function(){
		console.log($(this).attr("id"))
		
		$(this).parent().parent().remove();
		
		let pet = PetBoard();
		pet.del($(this).attr("id"));
		
	});
	
});
</script>
</head>
<body>
<h1>공지사항</h1>
	<table id="list-table" width="800" cellpadding="0" cellspacing="0"
		border="1">

	</table>
	<script src="${pageContext.request.contextPath}/js/PetBoard.js"></script>
</body>
</html>