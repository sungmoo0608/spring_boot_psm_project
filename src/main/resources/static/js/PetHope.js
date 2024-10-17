/**
 * 
 */


let PetHope = function() {

	function list(callback) {
		$.ajax({
			type: "GET",
			url: "/hope/",
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
	
	function insert(insert, callback) {
			$.ajax({
				type: "POST",
				url: "/hope/",
				contentType: 'application/json; charset=utf-8',
				data: JSON.stringify(insert),
				success: function(response) {
					console.log(response);
					if (callback) {
						callback(response);
					}
					let url = '/ushelter.html';
					location.replace(url);
				},
				error: function(xhr, status, error) {
					console.error('AJAX 요청 중 오류 발생:', error); // 오류 처리
				}
			})
		}
		
		function del(hopeno) {

			$.ajax({
				type: "DELETE",
				url: "/hope/" + hopeno,
				success: function(result) {

					console.log("삭제된 개수" + result);

				},
				error: function(e) {
					console.log(e);

				}

			});

		}

	/*function get(desertionNo, callback) {
		$.ajax({
			type: "GET",
			url: "/pet/" + desertionNo,
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

	function modify(modify, callback) {
		$.ajax({
			type: "PUT",
			url: "/pet/",
			contentType: 'application/json; charset=utf-8',
			data: JSON.stringify(modify),
			success: function(response) {
				console.log(response);
				if (callback) {
					callback(response);
				}
				let url = '/pet/pet';
				location.replace(url);
			},
			error: function(xhr, status, error) {
				console.error('AJAX 요청 중 오류 발생:', error); // 오류 처리
			}
		})
	}

	




*/
	return {
		list: list,
		insert: insert,
/*		get: get,
		modify: modify,*/
		del: del
		
	}
}
