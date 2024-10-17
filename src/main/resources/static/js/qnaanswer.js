$(document).ready(function(){
		let searchParams = new URLSearchParams(window.location.search);
		  let bnum = searchParams.get('bnum');

		  function getboard(petboards) {
		      $("#bnum").val(petboards.bnum);
		      $("#bgroup").val(petboards.bgroup);
		      $("#bstep").val(petboards.bstep);
			  $("#bindent").val(petboards.bindent);
			 }
			
			 let petget = PetBoard();
			 petget.get(bnum,getboard);
			 });		 
			 
$(document).ready(function() {
	$("#questionForm").submit(function(event){
	       event.preventDefault(); 
        // 폼 데이터 수집
        let bnum1 = $("#bnum").val();
        let bgroup = $("#bgroup").val();
        let bstep = $("#bstep").val();
        let bindent = $("#bindent").val();
        let pet_user_id = $("#pet_user_id").val();
        let btitle = $("#btitle").val();
        let bcontent = $("#bcontent").val();
        let cate_no = Number($("#cate_no").val()); // cate_no가 포함되어 있지 않으면 확인 필요

        // 데이터 객체 생성
        let answer = {
            bnum: bnum1,
            bgroup: bgroup,
            bstep: bstep,
            bindent: bindent,
            pet_user_id: pet_user_id,
            btitle: btitle,
            bcontent: bcontent,
            cate_no: cate_no
        }
		
		

	        let petboard = PetBoard();
			
			
	        petboard.answer(answer, function(result){
	            console.log(result); 
	        });
	    });
	});