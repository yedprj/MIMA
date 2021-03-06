<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <!--page-title-two-->
<section class="page-title-two">
    <div class="title-box centred bg-color-2">
        <div class="pattern-layer">
            <div class="pattern-1" style="background-image: url(${pageContext.request.contextPath}/assets/images/shape/shape-70.png);"></div>
            <div class="pattern-2" style="background-image: url(${pageContext.request.contextPath}/assets/images/shape/shape-71.png);"></div>
        </div>
        <div class="auto-container">
            <div class="title">
                <h1>${item.title }</h1>
            </div>
        </div>
    </div>
    <div class="lower-content">
        <div class="auto-container">
            <ul class="bread-crumb clearfix">
                <li><a href="index.html">Home</a></li>
                <li><a href="totalList">전체 리스트</a></li>
                <li><a href="totalList?category=${item.category }">${item.category }</a></li>
                <li>${item.title }</li>
            </ul>
        </div>
    </div>
</section>
<!--page-title-two end-->


<!-- sidebar-page-container -->
<section class="sidebar-page-container">
    <div class="auto-container">
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 content-side">
                <div class="blog-details-content">
                <!-- 본문 -->
                    <div class="news-block-one">
                        <div class="inner-box">
                            <div class="image-box" style="text-align:center; background-color: 	#f1f1f4;">
                            
                                <%-- <img src="${pageContext.request.contextPath}/resources/assets/images/news/meditationFile" alt=""> --%>
                                <video width="770" height="470" src="${pageContext.request.contextPath}/meditation/video/${item.fileName }" controls auto></video>
                                <span class="category">${item.category }</span>
                                
                           	</div>
                                
                           	<!-- 명상정보 담는 부분 -->
                            <div class="lower-content">
                           	 <!-- 좋아요 버튼 아이콘 -->
                                <a><i id="likeBtn" class="fas fa-heart fa-2x" style="color:rgb(246, 238, 238)"></i></a><h3>${item.title }</h3>

                                <!-- 명상가 정보 -->
                                <ul class="post-info">
                                    <li><img src="${pageContext.request.contextPath}/resources/assets/images/medit/미마명상.png" alt="">
                                    	${item.teacherName }</li>
                                    <li><fmt:formatDate value="${item.regDate }" pattern="yyyy-MM-dd" /></li>
                                    <li id="likesNum">Likes: ${item.meditationLike }</li>
                                </ul>
                                <p>${item.contents }</p>
                               
                            </div>
                            <!-- End of 명상정보 담는 부분 -->
                        </div>
                    </div>
                    <blockquote>
                        <i class="fas fa-quote-left"></i>
                        <p><img src="assets/images/news/admin-1.png" alt=""><a href="index.html">${item.teacherName }</a></p>
                        <p>${item.teacherInfo }</p>
                    </blockquote>
                  <!-- end of 본문 -->
                 
                 
                   <!-- 코멘트 입력 폼 -->
                    <div class="comments-form-area" style="margin-bottom: 50px;">
                        <div class="group-title">
                            <h3>Leave a Comment</h3>
                        </div>
                        <form id="replyForm" action="../replies" method="post" class="comment-form">
                            <div id="endOfCForm" class="row clearfix">
                                <input type="hidden" name="cmainNo" value="${item.meditationNo }">
                                <input type="hidden" name="cmainCategory" value="medit">
                                <!-- 세션에서 멤버 넘버 가져와서 넣어줄것 -->
                                <input type="hidden" name="commentWriterNo" value="${session.memberNo }">
                                
                                <div class="col-lg-4 col-md-4 col-sm-12 form-group">
                                
                                <!-- 세션에서 이름 가져와서 넣어줄 것임 -->
                                    <input type="text" name="writer" value="${session.name }" disabled>
                                </div>
                                
                                <div class="col-lg-12 col-md-12 col-sm-12 form-group">
                                    <textarea id="commentInput" name="contents" placeholder="Leave A Comment"></textarea>
                                </div>
                                
                                <div  class="col-lg-12 col-md-12 col-sm-12 form-group message-btn" >
                                    <button id="saveReply" style="float:right" type="button" class="theme-btn-one">댓글 등록<i class="icon-Arrow-Right"></i></button>
                                </div>
                            </div>
                        </form>
                    </div>
                     <!-- end of 코멘트 입력 폼 -->
                 
                 
                 <!-- 코멘트 코멘트  -->
                    <div class="comment-box">
                        <div class="group-title">
                            <h3>Comments</h3>
                        </div>
                        <div class="comment-inner">
	                        <ul class="chat">
		                        <!-- 댓글 들어가는 부분~~ -->
	                        </ul>
	                        <div class="panel-footer">
	
							</div><!-- /end of 댓글 페이지 리스트 -->
                        </div>
                    </div>
                     <!-- end of 코멘트본문 코멘트  -->
                </div>
            </div>
         
        </div>
    </div>
</section>
<!-- side bar-page-container end -->    



<!-- edit reply Modal -->
      <div class="modal fade" id="editReplyModal" tabindex="-1" role="dialog"
        aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              
              <h4 class="modal-title" id="myModalLabel">댓글 수정</h4>
              
              <button type="button" class="close" data-dismiss="modal"
                aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
            	<input type="hidden" id="hiddenCno" name='cno'>
            	<div class="form-group">
	                <label>댓글 작성자</label> 
	                <input class="form-control" name='commentWriter' value='${session.name }' disabled>
	                <input type="hidden" class="form-control" name='commentWriterNo' value='${session.memberNo }'>
              	</div>
              
              <div class="form-group">
                <label>Reply</label> 
                <input class="form-control" name='contents' value='내용'>
              </div>      
              
            </div>
			<div class="modal-footer">
		        <button id='replyEditBtn' type="button" class="btn btn-warning">수정</button>
		        <button id='modalCloseBtn' type="button" data-dismiss="modal" class="btn btn-default">취소</button>
	     	 </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
      </div>
      <!-- /.modal -->



<script src="../resources/assets/js/comments.js"></script>
<script>



var csrfHeaderName = "${_csrf.headerName}";
var csrfTokenValue = "${_csrf.token}";



/* 페이지 로드 이벤트 */

let cmainCategory = "medit";
let cmainNo = ${item.meditationNo};
let str = "";

/* 페이지 온 로드 */
$(function(){
	//댓글 페이지 링크 클릭시 댓글 제일 위로 이동
	var offset = $('#endOfCForm').offset();
	
	//s:1013 페이지 불러 왔을 때 사용자가 명상 좋아요 한 수가 1이면 하트 색칠
	if(${item.likesNo} ==1){
	
		$('#likeBtn').css("color", "rgb(255, 51, 51)");
	}
	
	//페이지 로드시 댓글 리스트 불러오기
	showList(${cri.pageNum});
	
	//댓글 등록처리(post)
	   $("#saveReply").on("click", function() {
	      replyService.add(function (data) {       
	         $(".chat").append(makeLi(data));
	         $('#commentInput').val("");
	         showList(-1); //댓글 등록 후 댓글 마지막 페이지로
	      });
	   });
	
	//showList function
	function showList(page){
	   //목록조회(get)
	   replyService.getList({cmainCategory:cmainCategory, cmainNo:cmainNo, page:page}, function (replyCnt, list){
	      if(page==-1){
	    	  pageNum =Math.ceil(replyCnt/10.0);
	    	  //alert(pageNum +"from showList page ==-1")
	    	  showList(pageNum);
	    	  return;
	      }
	      
	      var str = "";
	      if(list ===null || list.length ==0){
	    	  return;
	      }
	      
	      for (i = 0; i < list.length; i++) {
	         str += makeLi(list[i]);
	      }
	      $(".chat").html(str);
	      showReplyPage(replyCnt);
	   });//end of 댓글목록조회getList
	}//end of showList function
	   
	   //get replyPages function
	   var pageNum =1;
	   var replyPageFooter = $(".panel-footer");
	   function showReplyPage(replyCnt){
		   var endNum = Math.ceil(pageNum/10.0)*10;
		   var startNum =endNum-9;

		   var prev = startNum !=1;
		   var next = false;
		   
		   if(endNum *10 >= replyCnt){
			   endNum = Math.ceil(replyCnt/10.0);
		   }
			   
		   if(endNum * 10 < replyCnt){
			   next = true;
		   }
	   		var str= "<ul class='pagination pull-right'>";
	   		
	   		if(prev){
	   			str+="<li class='page-item'><a class='page-link' href='"+(startNum-1)+"'>Previous</a></li>";
	   		}
	   		
	   		for(var i =startNum; i<=endNum; i++){
	   			var active=pageNum ==1?"active":"";
	   			
	   			str+="<li class='page-item"+active+"'><a class='page-link' href='"+i+"'>"+i+"</a></li>";
	   		}
	   		
	   		if(next){
	   			str+="<li class='page-item'><a class='page-link' href='"+(endNum+1)+"'>Next</a></li>";
	   		}
	   		
	   		str+='</ul><div>';
	   		//console.log(str);
	   		replyPageFooter.html(str);
	   }// end of get replyPages function
	
	 //댓글 페이지 이동이벤트
	   replyPageFooter.on('click','li a', function(e){
		   e.preventDefault();
		 
		   var targetPageNum=$(this).attr("href");
		   showList(targetPageNum);
		   
		   
		   $('html').animate({scrollTop : offset.top}, 400);

	   });//End of onClick event reply pagination
	   
	   
	   
	   
	   function makeLi(data) {
		   let regDate = new Date(data.regDate);
		   let nick = "${session.nickname}";
		   var str = '<li class="comment">'
		       +'<figure class="thumb-box">'
		       +'    <img src="${pageContext.request.contextPath}/resources/assets/images/medit/미마명상.png" alt="">'
		       +'</figure>'
		       +'<div class="comment-inner">'
		       +'    <div class="comment-info d-flex">'
			   +'		<div class="mr-auto p-2"><h5>'+data.nickname+'</h5></div>'
		       +'        <div class="p-2"><span class="comment-time">'+regDate.toLocaleDateString()+'</span></div>'
		       +'     </div>'
		       +'     <div class="d-flex">'
		       +'     <div class="mr-auto p-2"><p style="font-size:20px">'+data.contents+'</p></div>';
		   	   
			   if(nick == data.nickname){
				   str += '<div class="p-2"><a style="float:right; background-color:#39cabb; border: none; border-radius: 30px; margin-right:10px" href="'+data.cno+'" id="replyEdit" class="btn btn-info">수정</a></div>'	
			       +'<div class="p-2"><a style="float:right; background-color:#fe5948; border: none; border-radius: 30px;" href="'+data.cno+'" id="replyDelete" class="btn btn-danger">삭제</a></div>';
	
			   }
			   str+= '</div>'
				   +'     </div>'
		   	   		+'</li>';
			  
			   	return str;
		   }

	   
	 //댓글 수정처리(모달띄우기)
		var modal=$(".modal");
		var modalInputReply=modal.find("input[name='contents']");
		var modalInputWriter =modal.find("input[name='commentWriterNo']");
		
		var modalEditBtn=$("#replyEditBtn");
		
		//댓글수정버튼 이벤트(모달띄우기)
		 $(".chat").on("click","#replyEdit", function(e) {
			 e.preventDefault();
			 let cno = $(this).attr('href');
			
			 replyService.read({cmainCategory:cmainCategory, cno:cno}, function(data){
				 $(modalInputReply).val(data.contents);
				 $(modalInputWriter).val(data.commentWriterNo);
				 $("#hiddenCno").val(cno);
				 $(".modal").modal("show");
				 
			 }, function(err){console.error(err)});
			 
		 });// End of 댓글수정버튼 이벤트(모달띄우기)
	   
		 $(modalEditBtn).on('click', function(e){
			 var cno = $("#hiddenCno").val();
			 
			var editedReply={
					contents: modalInputReply.val(),
					cno:cno
			};
			
			replyService.update(editedReply, function(result){
				alert("댓글이 수정되었습니다.")
				modal.find("input").val();
				modal.modal("hide");
				showList(1);
			});
		 });
	   
	   
		 
		   //삭제처리(delete)
		   $(".chat").on("click","#replyDelete", function(e) {
			   e.preventDefault();
			   let cno = $(this).attr('href');
			   console.log("cno==================="+ cno);
			   let li= $(this).closest('li');
			   console.log("list=================="+JSON.stringify(li));
			   
			   replyService.deleteReply(cno, function(count){
					console.log("count==========="+count);
					 if(count ===true){
					alert("댓글 삭제 완료");
					$(li).remove();
					}
				}, function(err){
					alert('Error...');
				});
		   });
		 
	   
		   
	// 좋아요 클릭 이벤트
		$(document).on("click", "#likeBtn", function(e) {
			e.preventDefault();
			
			var heart = $(this);
			var category=cmainCategory;
			var postNo = cmainNo;
			/* 멤버번호는 로그인 세션에서 가져올거임 */
			var memberNo = ${session.memberNo};
			var likeAjaxUrl;
							
			if ($(heart).css("color") == "rgb(255, 51, 51)") {
				likeAjaxUrl = "updateNotLike";
				$.ajax({
					url : "../likes/likesDelete",
					method : "delete",
					dataType : "json",
					data : JSON.stringify({
						likeMainNo : postNo,
						category: category,
						memberNo : memberNo
					}),
					 beforeSend : function(xhr) {
							xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
						},
					contentType : 'application/json',
					success : function(data) {
						$('#likeBtn').css("color", "rgb(237, 222, 222)");
					},// success end
					error :function(err){
						console.err(err);
					}
				}); //  ajax end
				
			} else {
				likeAjaxUrl = "updateLike";
				$.ajax({
					url : "../likes/likesInsert",
					method : "post",
					dataType : "json",
					data : JSON.stringify({
						likeMainNo : postNo,
						category: category,
						memberNo : memberNo
					}),
					 beforeSend : function(xhr) {
							xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
						},
					contentType : 'application/json',
					success : function() {
					},
					errpr: function(err){
						console.error(err);
					}
				}); //  ajax end
			}
			
			
			$.ajax({
				url : likeAjaxUrl,
				method : "put",
				dataType : "json",
				data : JSON.stringify({
					meditationNo : postNo
				}),
				 beforeSend : function(xhr) {
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
				contentType : 'application/json',
				success : function() {
					if (likeAjaxUrl == "updateLike") {
						alert("이 명상을 좋아합니다!");
						let num=${item.meditationLike }
						$('#likesNum').text("Likes : "+(${item.meditationLike }+1));
						$(heart).css("color", "rgb(255, 51, 51)");
					} else {
						alert("좋아요 취소 ㅠㅠ");
						$('#likesNum').text("Likes : "+(${item.meditationLike }-1));
						$(heart).css("color", "rgb(237, 222, 222)");
					}
				}// success end
			})
			//  ajax end
		})// heartIcon end	   
		   
		   
		   
		   
		   
		   
})/* end of 페이지 온 로드 */

</script>

