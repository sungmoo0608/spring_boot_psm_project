$(document).ready(function(){
	    $("#insertPet").submit(function(event){
	        event.preventDefault();
	        
	        let bnum = $("#bnum").val();
	        let userid = $("#userid").val();
	        let btitle = $("#btitle").val();
	        let bcontent = $("#bcontent").val();
	        let cate_no = Number($("#cate_no").val());

	        let insert = {
	            bnum: bnum,
	            userid: userid,
	            btitle: btitle,
	            bcontent: bcontent,
	            cate_no: cate_no
	        }

	        let petboard = PetBoard();
	        petboard.insert(insert, function(result){
	            console.log(result);
	            if (cate_no === 1) {
	                location.replace('/pboard/notice');
	            } else if (cate_no === 2) {
	                location.replace('/pboard/qna');
	            } else if (cate_no === 3) {
	                location.replace('/pboard/areview');
	            } else {
	                console.log("알 수 없는 카테고리 번호입니다.");
	            }
	        });
	    });
	});