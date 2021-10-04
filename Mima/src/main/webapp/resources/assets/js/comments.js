/*WebApp/resources/assets/js/comments.js*/


var csrfHeaderName = "${_csrf.headerName}";
var csrfTokenValue = "${_csrf.token}";


let replyService =(function(){

	//댓글 등록
	function add(callback, err){
	  $.ajax({
		  url:"../replies/",
		  data:$("#replyForm").serialize(),
		  beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
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
					beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
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
			  beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
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
			  beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
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
			  beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
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