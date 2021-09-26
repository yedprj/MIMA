/*WebApp/resources/assets/js/comments.js*/
let replyService =(function(){

	//댓글 등록
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
		console.log(cmainCategory, cmainNo, page);
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
		  function deleteReply(rno, callback, err){
		  $.ajax({
			  url:"../replies/"+rno,
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
		 function read(rno, callback, err){
		  $.ajax({
			  url:"../replies/"+rno,
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
			console.log(editedReply)
		  $.ajax({
			  url:"../replies/"+editedReply.rno,
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