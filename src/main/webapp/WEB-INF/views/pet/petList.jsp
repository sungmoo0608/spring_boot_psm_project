<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="${pageContext.request.contextPath}/js/lostDog.js"></script>

<script type="text/javascript">
$(document).ready(function(){

function listCallback(result) {	
	let htmls = "";
	
	// 기존 내용 삭제
	$("#list-table").html('');
	
	$("<tr>" , {
		html : "<td>" + "입양대기 동물번호" + "</td>"+  // 컬럼명들
				"<td>" + "썸네일" + "</td>"+
				"<td>" + "발견장소" + "</td>"+				
				"<td>" + "동물종류" + "</td>"+
				"<td>" + "나이" + "</td>"+
				"<td>" + "분양상황" + "</td>"+
				"<td>" + "성별" + "</td>"+
				"<td>" + "삭제" + "</td>"+
				"<td colspan='5'>" + '<a href="/write_view.html">' + "글작성" + '</a>' + '</td>'	
	}).appendTo("#list-table")
	
	// 결과를 순회하며 HTML 생성
	$(result).each(function() {
		htmls += '<tr>';
		htmls += '<td>' + this.desertionNo + '</td>'; 
		htmls += '<td>' +
	    '<a href="/pet_content_view.html?desertionNo=' + this.desertionNo + '">' + '<img src="' + this.filename + '" alt="Image" style="width: 100px; height: auto;">' + '</a>' + '</td>';
		htmls += '<td>' + this.happenPlace + '</td>';
		htmls += '<td>' + this.kindCd + '</td>'; 
		htmls += '<td>' + this.age + '</td>'; 
		htmls += '<td>' + this.processState + '</td>'; 
		htmls += '<td>' + this.sexCd + '</td>';
		htmls += '<td>'+ '<input id=' + this.desertionNo + " type='button' class='btn_delete' value='삭제'>" + '</td>';
		htmls += '</tr>'; // 각 행의 끝
	}); // each end

	// 생성된 HTML을 테이블에 추가
	$('#list-table').append(htmls);
}

// 예시로 lostDog() 호출 후 listCallback을 사용하는 코드
let pet = lostDog();
pet.list(listCallback);

});
</script>


<script type="text/javascript">
$(document).ready(function(){
	
	$(document).on("click","#list-table .btn_delete", function(){
		console.log($(this).attr("id"))
		
		$(this).parent().parent().remove();
		
		let pet = lostDog();
		pet.del($(this).attr("id"));
		
	});
	
});
</script>
</head>
<body>
	<table id="list-table" width="800" cellpadding="0" cellspacing="0"
		border="1">

	</table>
</body>
</html>