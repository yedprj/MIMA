/*WebApp/resources/assets/js/like.js*/
let likeService =(function(){

	//좋아요 등록
	// 좋아요 클릭 이벤트
		$(document).on("click", "#likeBtn", function() {
			var heart = $(this);
			var category=cmainCategory;
			var postNo = cmainNo;
			/* 멤버번호는 로그인 세션에서 가져올거임 */
			var memberNo = 1;
			var likeAjaxUrl;
							
			if (heart.css("background-color") == "rgb(6, 26, 58)") {
				likeAjaxUrl = "updateNotLike";
				$.ajax({
					url : "likesDelete",
					method : "delete",
					dataType : "json",
					data : JSON.stringify({
						likeMainNo : postNo,
						memberNo : CurrentNo
					}),
					contentType : 'application/json',
					success : function(data) {
						console.log("Likes_기록취소_성공");
						
					}// success end
				}); //  ajax end
				
			} else {
				urlJuso = "updateLike";
				$.ajax({
					url : "likesInsert",
					method : "post",
					dataType : "json",
					data : JSON.stringify({
						likeMainNo : postNo,
						memberNo : CurrentNo
					}),
					contentType : 'application/json',
					success : function() {
						console.log("Likes 기록입력 성공!!");
					}// success end
				}); //  ajax end
			}
			
			console.log(urlJuso);
			console.log("===========좋아요 수==========");
			$.ajax({
				url : urlJuso,
				method : "put",
				dataType : "json",
				data : JSON.stringify({
					postNo : postNo
				}),
				contentType : 'application/json',
				success : function() {
					if (urlJuso == "updateLike") {
						console.log("좋아요_성공")
						alert("좋아요 성공!!");
						heart.css("background-color", "#061a3a");
					} else {
						console.log("좋아요_취소_성공")
						alert("좋아요 취소!!");
						heart.css("background-color", "#eaf8f6");
					}
				}// success end
			})
			//  ajax end
		})// heartIcon end	   
		   
		   
	
	
	
	
	
	
	
	
	function add(callback, err){
	  $.ajax({
		  url:"../replies/",
		  data:$("#replyForm").serialize(),
		  method:"post",
		  dataType:"json",
		  success:function(data){
			  if(callback) callback(data)
		  },
		  error: function(err){
			  console.error(err);
			  
		  }
	  });
  }
	 //댓글 조회
	  function getList(param, callback, err){
		
		var cmainCategory=param.cmainCategory;
		var cmainNo = param.cmainNo;
		var page = param.page ||1;
	$.ajax({
			  url:"../replies/",
			  method:"get",
			  data:{
					cmainCategory: cmainCategory,
					cmainNo: cmainNo,
					page:page
					},
			  dataType:"json",
			  success: function(data){
				console.log(data);
				  if(callback){
						callback(data.replyCnt, data.list);
					} 
					
				},
			  error: function(error){
					  if(error) error(error)
				}
		  });
		 }
		  
		//댓글 삭제
		  function deleteReply(cno, callback, err){
		  $.ajax({
			  url:"../replies/"+cno,
			  method:"delete",
			  dataType:"json",
			  success: function(data){
				  if(callback){
				   callback(data)
				   }
				},
			  error: function(error){
					  console.error(error);
				}
		  });
  		}

		//한건댓글 읽기
		 function read(param, callback, err){
			var cno = param.cno;
			
		  $.ajax({
			  url:"../replies/"+cno,
			  method:"get",
			  dataType:"json",
			  success: function(data){
				  if(callback){
				   callback(data)
				   }
				},
			  error: function(error){
					  console.error(error);
				}
		  });
  		}

		//댓글 수정
		function update(editedReply, callback, err){
		  $.ajax({
			  url:"../replies/"+editedReply.cno,
			  method:"put",
			  data: JSON.stringify(editedReply),
			  contentType:"application/json; charset=utf-8",
			  success: function(data){
				  if(callback){
				   callback(data)
				   }
				},
			  error: function(error){
					  console.error(error);
				}
		  });
  		}

  return {add:add, getList: getList, deleteReply:deleteReply, read:read, update:update};

})();