<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	#postContents > div {
		border : solid 1px;
		backgroud-color : #f2f2f2;
		width : 200px;
		height : 200px;
		padding : 10px;
	}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<title>그린포스트잇</title>
</head>
<body>
<div>
	<h1>그린포스트잇</h1>	
</div>
<div id="postContents">

	
</div>

<script>

$(function(){
	
	postList();
	
}); //end 


	//페이지 목록 조회
	function postList(){
			$.ajax({
				url : "postList",
				dataType : "json",
				success : function(datas){
					$("#postContents").empty();
					$.each( datas , function(i, data){
						$("<div id='"+data.postNo+"'>")
								 .append( $("<p>").html(data.contents) )	 
								 .appendTo( $("#postContents")  ); // 부모에게 붙이기
					}); // each end
				} // success end
			})
		} // 페이지목록 조회 end
</script>
</body>
</html>