/**
 * 
 */


let PetBoard = function() {

	function list(cate_no, callback) {
		$.ajax({
			type: "GET",
			url: "/pboard/noticeList/" + cate_no,
			success: function(response) {
				console.log(response); // 응답 데이터를 콘솔에 출력
				if (callback) {
					callback(response);
				}
			},
			error: function(xhr, status, error) {
				console.error('AJAX 요청 중 오류 발생:', error); // 오류 처리
			}
		});
	}

	function get(bnum, callback) {
		$.ajax({
			type: "GET",
			url: "/pboard/" + bnum,
			success: function(response) {
				console.log(response);
				if (callback) {
					callback(response);
					console.log(response.bcontent);
				}
			},
			error: function(xhr, status, error) {
				console.error('AJAX 요청 중 오류 발생:', error); // 오류 처리
			}
		})
	}

	function modify(modify, callback) {
		
		console.log(modify);
		
		$.ajax({
			type: "PUT",
			url: "/pboard/",
			contentType: 'application/json; charset=utf-8',
			data: JSON.stringify(modify),
			success: function(response) {
				console.log(response);
				if (callback) {
					callback(response);
				}
				/* let url = '/pboard/qna';
				           location.href = url; */
				
			},
			error: function(xhr, status, error) {
				console.error('AJAX 요청 중 오류 발생:', error); // 오류 처리
			}
		})
	}

	function insert(insert, callback) {
		$.ajax({
			type: "POST",
			url: "/pboard/",
			contentType: 'application/json; charset=utf-8',
			data: JSON.stringify(insert),
			success: function(response) {
				console.log(response);
				if (callback) {
					callback(response);
				}			
			},
			error: function(xhr, status, error) {
				console.error('AJAX 요청 중 오류 발생:', error); // 오류 처리
			}
		})
	}


	function del(bnum) {

		$.ajax({
			type: "DELETE",
			url: "/pboard/" + bnum,
			success: function(result) {

				console.log("삭제된 개수" + result);

			},
			error: function(e) {
				console.log(e);

			}

		});

	}
	
   function answer(answer, callback) {
      $.ajax({
         type: "POST",
         url: "/pboard/answer",
         contentType: 'application/json; charset=utf-8',
         data: JSON.stringify(answer),
         success: function(response) {
            console.log(response);
            if (callback) {
               callback(response);
               location.replace('/pboard/qna');
            }         
         },
         error: function(xhr, status, error) {
            console.error('AJAX 요청 중 오류 발생:', error); // 오류 처리
         }
      })
   }


	return {
		list: list,
		get: get,
		modify: modify,
		del: del,
		insert: insert,
		answer: answer
	}
}
