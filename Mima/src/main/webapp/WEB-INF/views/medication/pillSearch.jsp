<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<style>
.pillImg {
	border : 3px solid #ebf7f6;
	width: 200px;
	border-radius: 50x;
	transition: width 1s, height 1s;
}
.pillImg:hover {
	cursor : pointer;
 	width: 500px;  	
}
.nice-select {
	padding: 0px 0px;
	padding-left : 17px;
}
.durBtn:hover {
	color : #fff;
}
</style>

	<div class="auto-container">
		<div class="row clearfix">
			<div class="col-lg-12 col-md-12 col-sm-12 sidebar-side">
				<div class="blog-sidebar">
					<br>
					<div class="title-box">
					   <div class="btn-box">
					       <a id="e_pill" class="theme-btn-one active">e-약은요<i class="icon-Arrow-Right"></i></a>
					       <a id="durBtn" class="theme-btn-two">약 정보검색</a>
					       <a id="durDangerBtn" class="theme-btn-two">병용금기 검색</a>
					   </div>
					</div>
					<br>
					<div class="sidebar-widget sidebar-search"
						style="background-color: #ebf7f6;">
						<div class="widget-title col-12">
							<div class="row">
								<div id="titleH3" class="col-12 col-sm-3">
									<h3>e-약은요</h3>
								</div>
								<div class="col-12 col-sm-2">
									<div class="form-group categroyBox">
										<select class="wide" name="category">
											<option value="" data-display="카테고리 선택">검색 카테고리</option>
											<option value="itemName">제품명</option>
											<option value="itemSeq">품목기준코드</option>
											<option value="efcyQesitm">효능</option>
											<option value="intrcQesitm">상호작용</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="search-inner">
							<form class="search-form">
								<div class="form-group">
									<input type="search" name="search-field"
										placeholder="Pill Search..">
									<button type="button" id="searchBtn">
										<i class="fas fa-search"></i>
									</button>
									<i class="icon-star"></i>
								</div>
							</form>
						</div>
					</div> <!-- 약 검색 구간 END -->
					
                    <div class="clinic-details-content">
                        <div class="tabs-box">
                            <div class="tabs-content">
                                <div class="tab active-tab" id="tab-1">
                                    <div class="inner-box">
                                        <div class="accordion-box">
                                                 
                                            
                                        </div> <!-- 아코디언 박스 END -->
                                    </div>
                                </div>
                            </div> <!-- tab-_contents END -->
                        </div>
                    </div><!-- 검색결과 끝 -->
                    <div class="pagination-wrapper">
                         <ul class="pagination">
                             
                         </ul>
                    </div>
                    <br>
                    </div>
                </div>
            </div>
        <input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}">
        </div>
<!-- sidebar-page-container end -->

<script>
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	// pillSearch VO (e-약은요)
	var itemName;
	var itemSeq;
	var efcyQesitm;
	var intrcQesitm;
	
	// durSearch VO (약 정보)
	var entpName; 
	
	// durDanger VO (병용금기)
	var ingrCode;
	var typeName;
	
	// 페이징처리 변수
	var pageNum = 1;
	
	var img= '' ;
	var str1 = '' ; 
	var str2 = '' ; 
	var str3 = '' ; 
	var str4 = '' ; 
	
	// 변수 초기화
	function initVar(){
		itemName = '';
		itemSeq = '';
		efcyQesitm = '';
		intrcQesitm = '';
		entpName = '';
		ingrCode = '';
		typeName = '';
		
		img= '' ;
		str1 = '' ; 
		str2 = '' ; 
		str3 = '' ; 
		str4 = '' ; 
		pageNum = 1;
	}
	
	
	$(function() {
		
		// 약 병용금기 검색 버튼
		$("body").on("click","#durDangerBtn" , function(){
			$(".accordion-box").empty();
			$(".pagination").empty(); // 페이징 초기화
			initVar();	// 초기화
			$("#titleH3 h3").text("병용금기검색");
			$('.btn-box .icon-Arrow-Right').remove();
			var btn = $(".btn-box").find(".theme-btn-one");
			btn.removeClass();
			btn.addClass("theme-btn-two");
			$(this).addClass("theme-btn-one");
			$(this).append(
					'<i class="icon-Arrow-Right"></i>'		
			);
			
			$(".categroyBox").empty();
			$(".categroyBox").append(
				'<select class="wide" name="category">'
				+	'<option value="" data-display="카테고리 선택">..</option>'
				+	'<option value="itemName">품목명</option>'
				+	'<option value="typeName">DUR유형</option>'
				+	'<option value="ingrcode">DUR성분코드</option>'
				+   '</select>'
			);
		});
		
		
		// 약 정보검색
		$("body").on("click","#durBtn" , function(){
			$(".accordion-box").empty();
			$(".pagination").empty(); // 페이징 초기화
			initVar(); // 초기화
			$("#titleH3 h3").text("약 정보검색");
			$('.btn-box .icon-Arrow-Right').remove();
			var btn = $(".btn-box").find(".theme-btn-one");
			btn.removeClass();
			btn.addClass("theme-btn-two");
			$(this).addClass("theme-btn-one");
			$(this).append(
					'<i class="icon-Arrow-Right"></i>'		
			);
			
			$(".categroyBox").empty();
			$(".categroyBox").append(
				'<select class="wide" name="category">'
				+	'<option value="" data-display="카테고리 선택">..</option>'
				+	'<option value="itemName">제품명</option>'
				+	'<option value="entpName">제약회사명</option>'
				+   '</select>'
			);
			
		});
		
		// 다시 e-약은요 검색
		$("body").on("click","#e_pill" , function(){
			$(".accordion-box").empty();
			$(".pagination").empty();
			initVar(); // 초기화
			$("#titleH3 h3").text("e-약은요");
			$('.btn-box .icon-Arrow-Right').remove();
			var btn = $(".btn-box").find(".theme-btn-one");
			btn.removeClass();
			btn.addClass("theme-btn-two");
			$(this).addClass("theme-btn-one");
			$(this).append(
					'<i class="icon-Arrow-Right"></i>'		
			);
			$(".categroyBox").empty();
			$(".categroyBox").append(
				'<select class="wide" name="category">'
				+	'<option value="" data-display="카테고리 선택">검색 카테고리</option>'
				+	'<option value="itemName">제품명</option>'
				+	'<option value="itemSeq">품목기준코드</option>'
				+	'<option value="efcyQesitm">효능</option>'
				+	'<option value="intrcQesitm">상호작용</option>'
				+   '</select>'
			);
		
		});
		
		
		// ********************** e-약은요 *************************  search Btn
		$("body").on("click","#searchBtn" , function(){
			$(".accordion-box").empty();
			$(".pagination").empty();
			var searText = $("#titleH3 h3").text();
			
			if(searText == "e-약은요"){
				
				var search = $("input[name='search-field']").val();
				var category = $("select[name=category] option:selected").val();
				console.log("검색내용: " + search + ", 카테고리" + category);
				
				if(search == ""){
					alert("검색할 내용을 입력하세요!")
					$("input[name='search-field']").focus();
					return;
				} else if(category == ""){
					alert("검색할 카테고리를 선택하세요!")
					return;
				} else {
					$(".accordion-box").empty();
					
					// 카테고리 체크해서 값 넣어주기
					if		(category == "itemName")	{ itemName = search; }
					else if (category == "itemSeq" )	{ itemSeq = search;	}
					else if (category == "efcyQesitm" )	{ efcyQesitm = search; }
					else 								{ intrcQesitm = search; }						
					
					
					// 검색 요청
					$.ajax({
						url : "pill",
						method : "post",
						dataType : "json",
						data : JSON.stringify({
							itemName : itemName,
							itemSeq : itemSeq,
							efcyQesitm : efcyQesitm,
							intrcQesitm : intrcQesitm,
							pageNo : pageNum
						}),
						beforeSend : function(xhr) {
							xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
						},
						contentType : 'application/json',
						success : function(datas) {
							console.log(datas);
							if (datas == null){	alert("검색 되는 내용이 없습니다!");} 
							else 			  { eDur(datas.list);	} // 함수 호출
						
							if(datas.pageMaker.prev){
								$(".pagination").append(
										'<li class="paginate_button previous"><a onclick="eDurAjax('+ (datas.pageMaker.startPage-10) +')">이전</a></li>'	
								);
							} 
							for(var i=datas.pageMaker.startPage; i <= datas.pageMaker.endPage; i++){
								if(i == datas.pageMaker.startPage){
									$(".pagination").append( '<li><a class="current" id="'+ i +'" onclick="eDurAjax('+ i +')">'+ i +'</a></li>'	);
								}else {
									$(".pagination").append( '<li><a id="'+ i +'" onclick="eDurAjax('+ i +')">'+ i +'</a></li>'	);
								}
							}
							if (datas.pageMaker.next) {
								$(".pagination").append(
										'<li class="paginate_button next"><a onclick="eDurAjax('+ (datas.pageMaker.endPage+1) +')">다음</a></li>'	
										);
							} 
	                             
	                        
						}, // success end
						error : function(){
							alert("검색되는 내용이 존재하지 않습니다!");
						} // error end
						
					}); // ajax end
					
				} // else end
			} 
			
			
		// ********************** 약 정보검색*************************
		else if( searText =="약 정보검색") {
			
			var search = $("input[name='search-field']").val();
			var category = $("select[name=category] option:selected").val();
			console.log("검색내용: " + search + ", 카테고리" + category);
			if(search == ""){
				alert("검색할 내용을 입력하세요!")
				$("input[name='search-field']").focus();
				return;
			} else if(category == ""){
				alert("검색할 카테고리를 선택하세요!")
				return;
			} 
			else {
				$(".accordion-box").empty();
				
				// 카테고리 체크해서 값 넣어주기
				if(category == "itemName"){	itemName = search; }
				else 					  { entpName = search; }
				
				// 약정보검색 Ajax 				
				$.ajax({
					url : "dur",
					method : "post",
					dataType : "json",
					data : JSON.stringify({
						itemName : itemName,
						entpName : entpName,
						pageNo : pageNum
					}),
					beforeSend : function(xhr) {
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
					contentType : 'application/json',
					success : function(datas) {
						if (datas == null){ alert("검색 되는 내용이 없습니다!"); } 
						else			  { dur(datas.list) } // 함수 호출
						if(datas.pageMaker.prev){
							$(".pagination").append(
									'<li class="paginate_button previous"><a onclick="eDurAjax('+ (datas.pageMaker.startPage-10) +')">이전</a></li>'	
							);
						} 
						for(var i=datas.pageMaker.startPage; i <= datas.pageMaker.endPage; i++){
							if(i == datas.pageMaker.startPage){
								$(".pagination").append( '<li><a class="current" id="'+ i +'" onclick="eDurAjax('+ i +')">'+ i +'</a></li>'	);
							}else {
								$(".pagination").append( '<li><a id="'+ i +'" onclick="eDurAjax('+ i +')">'+ i +'</a></li>'	);
							}
						}
						if (datas.pageMaker.next) {
							$(".pagination").append(
									'<li class="paginate_button next"><a onclick="eDurAjax('+ (datas.pageMaker.endPage+1) +')">다음</a></li>'	
							);
						} 
						
					},// success end
					error : function(){
						alert("검색되는 내용이 존재하지 않습니다!");
					}// error end
					
				}); // ajax end
			 
			} // else end
			
			
		}
			
		//**********************병용금기*************************
		else if(searText =="병용금기검색" ) {
			
			var search = $("input[name='search-field']").val();
			var category = $("select[name=category] option:selected").val();
			console.log("검색내용: " + search + ", 카테고리" + category);
			
			if(search == ""){
				alert("검색할 내용을 입력하세요!");
				$("input[name='search-field']").focus();
				return;
			} else if(category == ""){
				alert("검색할 카테고리를 선택하세요!");
				return;
			} else {
				$(".accordion-box").empty();
				
				// 카테고리 체크해서 값 넣어주기
				if		(category == "itemName") { itemName = search; }
				else if (category == "typeName") { typeName = search; }
				else 							 { ingrCode = search; }
				
				// 병용금기 검색 Ajax 
				$.ajax({
					url : "durDanger",
					method : "post",
					dataType : "json",
					data : JSON.stringify({
						itemName : itemName,
						typeName : typeName,
						ingrCode : ingrCode,
						pageNo : pageNum
					}),
					beforeSend : function(xhr) {
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
					contentType : 'application/json',
					success : function(datas) {
						if (datas == null) { alert("검색 되는 내용이 없습니다!"); } 
						else 			   { durDanger(datas.list) } // 함수 호출
						if(datas.pageMaker.prev){
							$(".pagination").append(
									'<li class="paginate_button previous"><a onclick="prev('+ (datas.pageMaker.startPage-10) +')">이전</a></li>'	
							);
						} 
						for(var i=datas.pageMaker.startPage; i <= datas.pageMaker.endPage; i++){
							if(i == datas.pageMaker.startPage){
								$(".pagination").append( '<li><a class="current" id="'+ i +'" onclick="eDurAjax('+ i +')">'+ i +'</a></li>'	);
							}else {
								$(".pagination").append( '<li><a id="'+ i +'" onclick="eDurAjax('+ i +')">'+ i +'</a></li>'	);
							}
						}
						if (datas.pageMaker.next) {
							$(".pagination").append(
									'<li class="paginate_button next"><a onclick="next('+ (datas.pageMaker.endPage+1) +')">다음</a></li>'	
							);
						} 
					},// success end
					error : function(){
						alert("검색되는 내용이 존재하지 않습니다!");
					}// error end
					
				}); // ajax end

			}// else end
			
		} else {
			alert("검색구간이 잘못됨!")
		}
	
		
		}); // searchBtn end
		
		
		
		
		
	}); // function end
	
	function prev(num){
		var searText = $("#titleH3 h3").text();
		$(".pagination").empty(); // 페이징 초기화
		$(".accordion-box").empty();
		if(searText == "e-약은요"){
			$.ajax({
				url : "pill",
				method : "post",
				dataType : "json",
				data : JSON.stringify({
					itemName : itemName,
					itemSeq : itemSeq,
					efcyQesitm : efcyQesitm,
					intrcQesitm : intrcQesitm,
					pageNo : num
				}),
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				contentType : 'application/json',
				success : function(datas) {
					if (datas == null){	alert("검색 되는 내용이 없습니다!");} 
					else 			  { eDur(datas.list);	} // 함수 호출
					if(datas.pageMaker.prev){
						$(".pagination").append(
								'<li class="paginate_button previous"><a onclick="prev('+ (datas.pageMaker.startPage-10) +')">이전</a></li>'	
						);
					} 
					for(var i=datas.pageMaker.startPage; i <= datas.pageMaker.endPage; i++){
						if(i == datas.pageMaker.startPage){
							$(".pagination").append( '<li><a class="current" id="'+ i +'" onclick="eDurAjax('+ i +')">'+ i +'</a></li>'	);
						}else {
							$(".pagination").append( '<li><a id="'+ i +'" onclick="eDurAjax('+ i +')">'+ i +'</a></li>'	);
						}
					}
					if (datas.pageMaker.next) {
						$(".pagination").append(
								'<li class="paginate_button next"><a onclick="next('+ (datas.pageMaker.endPage+1) +')">다음</a></li>'	
						);
					} 
				}
			}); // ajax end
			$("#"+num).addClass("current");
		}
		else if(searText == "약 정보검색"){
			$.ajax({
				url : "dur",
				method : "post",
				dataType : "json",
				data : JSON.stringify({
					itemName : itemName,
					entpName : entpName,
					pageNo : num
				}),
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				contentType : 'application/json',
				success : function(datas) {
					if (datas == null){	alert("검색 되는 내용이 없습니다!");} 
					else 			  { dur(datas.list);	} // 함수 호출
					if(datas.pageMaker.prev){
						$(".pagination").append(
								'<li class="paginate_button previous"><a onclick="prev('+ (datas.pageMaker.startPage-10) +')">이전</a></li>'	
						);
					} 
					for(var i=datas.pageMaker.startPage; i <= datas.pageMaker.endPage; i++){
						if(i == datas.pageMaker.startPage){
							$(".pagination").append( '<li><a class="current" id="'+ i +'" onclick="eDurAjax('+ i +')">'+ i +'</a></li>'	);
						}else {
							$(".pagination").append( '<li><a id="'+ i +'" onclick="eDurAjax('+ i +')">'+ i +'</a></li>'	);
						}
					}
					if (datas.pageMaker.next) {
						$(".pagination").append(
								'<li class="paginate_button next"><a onclick="next('+ (datas.pageMaker.endPage+1) +')">다음</a></li>'	
						);
					} 
				}
			}); // ajax end
			$("#"+num).addClass("current");
			
		} else if(searText == "병용금기검색"){
			$.ajax({
				url : "durDanger",
				method : "post",
				dataType : "json",
				data : JSON.stringify({
					itemName : itemName,
					typeName : typeName,
					ingrCode : ingrCode,
					pageNo : num
				}),
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				contentType : 'application/json',
				success : function(datas) {
					if (datas == null){	alert("검색 되는 내용이 없습니다!");} 
					else 			  { durDanger(datas.list);	} // 함수 호출
					if(datas.pageMaker.prev){
						$(".pagination").append(
								'<li class="paginate_button previous"><a onclick="prev('+ (datas.pageMaker.startPage-10) +')">이전</a></li>'	
						);
					} 
					for(var i=datas.pageMaker.startPage; i <= datas.pageMaker.endPage; i++){
						if(i == datas.pageMaker.startPage){
							$(".pagination").append( '<li><a class="current" id="'+ i +'" onclick="eDurAjax('+ i +')">'+ i +'</a></li>'	);
						}else {
							$(".pagination").append( '<li><a id="'+ i +'" onclick="eDurAjax('+ i +')">'+ i +'</a></li>'	);
						}
					}
					if (datas.pageMaker.next) {
						$(".pagination").append(
								'<li class="paginate_button next"><a onclick="next('+ (datas.pageMaker.endPage+1) +')">다음</a></li>'	
						);
					} 
				}
			}); // ajax end
			$("#"+num).addClass("current");
		}
	}
	
	function next(num){
		var searText = $("#titleH3 h3").text();
		$(".pagination").empty(); // 페이징 초기화
		$(".accordion-box").empty();
		if(searText == "e-약은요"){
			$.ajax({
				url : "pill",
				method : "post",
				dataType : "json",
				data : JSON.stringify({
					itemName : itemName,
					itemSeq : itemSeq,
					efcyQesitm : efcyQesitm,
					intrcQesitm : intrcQesitm,
					pageNo : num
				}),
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				contentType : 'application/json',
				success : function(datas) {
					if (datas == null){	alert("검색 되는 내용이 없습니다!");} 
					else 			  { eDur(datas.list);	} // 함수 호출
					if(datas.pageMaker.prev){
						$(".pagination").append(
								'<li class="paginate_button previous"><a onclick="prev('+ (datas.pageMaker.startPage-10) +')">이전</a></li>'	
						);
					} 
					for(var i=datas.pageMaker.startPage; i <= datas.pageMaker.endPage; i++){
						if(i == datas.pageMaker.startPage){
							$(".pagination").append( '<li><a class="current" id="'+ i +'" onclick="eDurAjax('+ i +')">'+ i +'</a></li>'	);
						}else {
							$(".pagination").append( '<li><a id="'+ i +'" onclick="eDurAjax('+ i +')">'+ i +'</a></li>'	);
						}
					}
					if (datas.pageMaker.next) {
						$(".pagination").append(
								'<li class="paginate_button next"><a onclick="next('+ (datas.pageMaker.endPage+1) +')">다음</a></li>'	
						);
					} 
				}
			}); // ajax end
			$("#"+num).addClass("current");
		}
		else if(searText == "약 정보검색"){
			$.ajax({
				url : "dur",
				method : "post",
				dataType : "json",
				data : JSON.stringify({
					itemName : itemName,
					entpName : entpName,
					pageNo : num
				}),
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				contentType : 'application/json',
				success : function(datas) {
					if (datas == null){	alert("검색 되는 내용이 없습니다!");} 
					else 			  { dur(datas.list);	} // 함수 호출
					if(datas.pageMaker.prev){
						$(".pagination").append(
								'<li class="paginate_button previous"><a onclick="prev('+ (datas.pageMaker.startPage-10) +')">이전</a></li>'	
						);
					} 
					for(var i=datas.pageMaker.startPage; i <= datas.pageMaker.endPage; i++){
						if(i == datas.pageMaker.startPage){
							$(".pagination").append( '<li><a class="current" id="'+ i +'" onclick="eDurAjax('+ i +')">'+ i +'</a></li>'	);
						}else {
							$(".pagination").append( '<li><a id="'+ i +'" onclick="eDurAjax('+ i +')">'+ i +'</a></li>'	);
						}
					}
					if (datas.pageMaker.next) {
						$(".pagination").append(
								'<li class="paginate_button next"><a onclick="next('+ (datas.pageMaker.endPage+1) +')">다음</a></li>'	
						);
					} 
				}
			}); // ajax end
			$("#"+num).addClass("current");
			
		} else if(searText == "병용금기검색"){
			$.ajax({
				url : "durDanger",
				method : "post",
				dataType : "json",
				data : JSON.stringify({
					itemName : itemName,
					typeName : typeName,
					ingrCode : ingrCode,
					pageNo : num
				}),
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				contentType : 'application/json',
				success : function(datas) {
					if (datas == null){	alert("검색 되는 내용이 없습니다!");} 
					else 			  { durDanger(datas.list);	} // 함수 호출
					if(datas.pageMaker.prev){
						$(".pagination").append(
								'<li class="paginate_button previous"><a onclick="prev('+ (datas.pageMaker.startPage-10) +')">이전</a></li>'	
						);
					} 
					for(var i=datas.pageMaker.startPage; i <= datas.pageMaker.endPage; i++){
						if(i == datas.pageMaker.startPage){
							$(".pagination").append( '<li><a class="current" id="'+ i +'" onclick="eDurAjax('+ i +')">'+ i +'</a></li>'	);
						}else {
							$(".pagination").append( '<li><a id="'+ i +'" onclick="eDurAjax('+ i +')">'+ i +'</a></li>'	);
						}
					}
					if (datas.pageMaker.next) {
						$(".pagination").append(
								'<li class="paginate_button next"><a onclick="next('+ (datas.pageMaker.endPage+1) +')">다음</a></li>'	
						);
					} 
				}
			}); // ajax end
			$("#"+num).addClass("current");
		}
	}
	
	// 숫자 페이징
	function eDurAjax(num){
		var searText = $("#titleH3 h3").text();
		$(".pagination .current").removeClass();
		$(".accordion-box").empty();
		if(searText == "e-약은요"){
			$.ajax({
				url : "pill",
				method : "post",
				dataType : "json",
				data : JSON.stringify({
					itemName : itemName,
					itemSeq : itemSeq,
					efcyQesitm : efcyQesitm,
					intrcQesitm : intrcQesitm,
					pageNo : num
				}),
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				contentType : 'application/json',
				success : function(datas) {
					if (datas == null){	alert("검색 되는 내용이 없습니다!");} 
					else 			  { eDur(datas.list);	} // 함수 호출
				}
			}); // ajax end
			$("#"+num).addClass("current");
		}
		else if(searText == "약 정보검색"){
			$.ajax({
				url : "dur",
				method : "post",
				dataType : "json",
				data : JSON.stringify({
					itemName : itemName,
					entpName : entpName,
					pageNo : num
				}),
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				contentType : 'application/json',
				success : function(datas) {
					if (datas == null){	alert("검색 되는 내용이 없습니다!");} 
					else 			  { dur(datas.list);	} // 함수 호출
				}
			}); // ajax end
			$("#"+num).addClass("current");
			
		} else if(searText == "병용금기검색"){
			$.ajax({
				url : "durDanger",
				method : "post",
				dataType : "json",
				data : JSON.stringify({
					itemName : itemName,
					typeName : typeName,
					ingrCode : ingrCode,
					pageNo : num
				}),
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				contentType : 'application/json',
				success : function(datas) {
					if (datas == null){	alert("검색 되는 내용이 없습니다!");} 
					else 			  { durDanger(datas.list);	} // 함수 호출
				}
			}); // ajax end
			$("#"+num).addClass("current");
		}
	}
	
	
	// 새로운 창 사이즈 조절
	function openWindow(url){
		window.open(url,'name','resizable=no width=800 height=600');
	}
	
	// e-약은요 화면출력
	function eDur(datas){
		$(".accordion-box").append($("<h3>검색결과</h3>"));
		$.each(datas, function(i, data) {
			console.log(data);
			
			if(data.itemImage != null)   	{ img = '<img class="pillImg" src='+ data.itemImage +' alt="알약 이미지">'; }
			if(data.intrcQesitm == null )	{ str1 = '조회되는 내용이 없습니다.'; } 
			else 							{ str1 = data.intrcQesitm;	}
			if(data.atpnWarnQesitm == null ){ str2 = '조회되는 내용이 없습니다.' } 
			else 							{ str2 = data.atpnWarnQesitm; }
			if(data.atpnQesitm == null )	{ str3 = '조회되는 내용이 없습니다.' } 
			else 							{ str3 = data.atpnQesitm; }
			if(data.seQesitm == null )		{ str4 = '조회되는 내용이 없습니다.' } 
			else 							{ str4 = data.seQesitm; }
			
			// 제품명	
			$(".accordion-box")
				.append('<br><div class="title-box"><h6>제품명: '
						+ data.itemName + '<span>품목기준코드: '+ data.itemSeq + '</span></h6></div>');
			$('<ul class="accordion-inner">')
				// 효능
			.append('<li class="accordion block">'
				+ '<div class="acc-btn"><div class="icon-outer"></div>'
				+ '<h6><b> 효능 </b><span>이 약의 효능은 무엇입니까?</span></h6></div>'
                + '<div class="acc-content"><div class="text">'+ img
            	+ '<p>'+ data.efcyQesitm +'</p></div></div></li>'
            	// 상호작용
             	+ '<li class="accordion block"><div class="acc-btn"><div class="icon-outer"></div>'
                + '<h6><b> 상호작용 </b><span>이 약을 사용하는 동안 주의해야 할 약 또는 음식은 무엇입니까?</span></h6></div>'
            	+ '<div class="acc-content"><div class="text"><p>'+ str1
            	+ '</p></div></div></li>'
            	// 사용전 주의사항
            	+ '<li class="accordion block"><div class="acc-btn"><div class="icon-outer"></div>'
                + '<h6><b> 사용전 주의사항 </b><span>이 약을 사용하기 전에 반드시 알아야 할 내용은 무엇입니까?</span></h6></div>'
            	+ '<div class="acc-content"><div class="text"><p>'+ str2
            	+ '</p></div></div></li>'
            	// 사용시 주의사항
            	+ '<li class="accordion block"><div class="acc-btn"><div class="icon-outer"></div>'
                + '<h6><b> 사용시 주의사항 </b><span>이 약의 사용상 주의사항은 무엇입니까?</span></h6></div>'
            	+ '<div class="acc-content"><div class="text"><p>' + str3 
            	+ '</p></div></div></li>'
            	// 부작용
            	+ '<li class="accordion block"><div class="acc-btn"><div class="icon-outer"></div>'
                + '<h6><b> 부작용 </b><span>이 약은 어떤 이상반응이 나타날 수 있습니까?</span></h6></div>'
            	+ '<div class="acc-content"><div class="text"><p>' + str4
            	+ '</p></div></div></li>'
        	).appendTo($(".accordion-box"));
		})// each end + else end
	}
	
	// 약 정보 화면출력
	function dur(datas){
		$(".accordion-box").append($("<h3>검색결과</h3>"));
		$.each(datas, function(i, data) {
			console.log(data);
			
			if(data.eeDocId == null )	{ str1 = '조회되는 내용이 없습니다.'; } 
			else 					 	{ str1 = data.eeDocId;	}
			if(data.udDocId == null )	{ str2 = '조회되는 내용이 없습니다.' } 
			else 					 	{ str2 = data.udDocId; }
			if(data.nbDocId == null )	{ str3 = '조회되는 내용이 없습니다.' } 
			else 					 	{ str3 = data.nbDocId;	}
			if(data.insertFile == null ){ str4 = '조회되는 내용이 없습니다.' } 
			else 						{ str4 = data.insertFile; }
			
			// 제품명	
			$(".accordion-box")
				.append('<br><div class="title-box"><h6>품목명: '
						+ data.itemName + '<span>품목기준코드: '+ data.itemSeq + '</span></h6></div>');
			$('<ul class="accordion-inner">')
				// 효능
			.append('<li class="accordion block">'
				+ '<div class="acc-btn"><div class="icon-outer"></div>'
				+ '<h6><b> 효능효과 </b></h6></div>'
                + '<div class="acc-content"><div class="text">'
                + '<p><b>['+ data.etcOtcCode +']</b> 분류: '+data.classNo +' </p>'
                + '<p> 성상:'+ data.chart +' </p>'
            	+ '<a style="color:#007bff; cursor:pointer;" onClick="openWindow(\''+ str1 + '\')" target="_blank">'+ str1 +'</a></div></div></li>'
            	// 용법용량
             	+ '<li class="accordion block"><div class="acc-btn"><div class="icon-outer"></div>'
                + '<h6><b> 용법용량 </b></h6></div>'
            	+ '<div class="acc-content"><div class="text">'
            	+ '<a style="color:#007bff; cursor:pointer;" onClick="openWindow(\''+ str2 + '\')" target="_blank">'+ str2 + '</a>'
            	+ '<p>저장방법: '+data.storageMethod +'</p>'
            	+ '<p>유효기간: '+data.validTerm +'</p>'
            	+ '</div></div></li>'
            	// 주의사항
            	+ '<li class="accordion block"><div class="acc-btn"><div class="icon-outer"></div>'
                + '<h6><b> 주의사항 </b><span></span></h6></div>'
            	+ '<div class="acc-content"><div class="text"><a style="color:#007bff; cursor:pointer;" onClick="openWindow(\''+ str3 + '\')" target="_blank">'+ str3
            	+ '</a></div></div></li>'
            	// 첨부문서
            	+ '<li class="accordion block"><div class="acc-btn"><div class="icon-outer"></div>'
                + '<h6><b> 첨부문서 및 기타 </b><span></h6></div>'
            	+ '<div class="acc-content"><div class="text">'
            	+ '<a style="color:#007bff; cursor:pointer;" onClick="openWindow(\''+ str4 + '\')" target="_blank">'+ str4 +'</a>'
            	+ '<p>포장단위 : ' + data.packUnit + '</p>'
            	+ '<p>보험코드 : ' + data.ediCode + '</p>'
            	+ '</div></div></li>'
            	
        	).appendTo($(".accordion-box"));
		}); // each end
	}
	
	// 병용금기 약 검색 화면출력
	function durDanger(datas){
		$(".accordion-box").append($("<h3>검색결과</h3>"))
		   .append($("<h5>검색한 품목명: "+datas[0].ingrKorName+"</h5>"));
		$.each(datas, function(i, data) {
		
			console.log(data);
			if (data.remart == null ){ str4 = '조회되는 내용이 없습니다.' } 
			else 					 { str4 = data.remart; }
		
		// 제품명	
		$(".accordion-box")
				.append('<br><div class="title-box"><h6>병용금기품목명: '
				+ data.mixTureItemName + '<span>병용금기품목기준코드: '+ data.mixTureItemSeq + ' </span></h6></div>');
		$('<ul class="accordion-inner">')
		// 병용금기
				.append('<li class="accordion block">'
				+ '<div class="acc-btn"><div class="icon-outer"></div>'
				+ '<h6><b> 병용금기 </b></h6></div>'
				+ '<div class="acc-content"><div class="text">'
				+ '<p><b> 복합체 </b> : '+ data.mix +' </p>'
				+ '<p><b> 병용금기 DUR번호 </b> : '+ data.mixTureDurSeq +' , <b> 병용금기 DUR성분코드 </b> : '+data.mixTureIngrCode +' </p>'
				+ '<p><b> 병용금기 DUR성분 </b> : '+ data.mixTureIngrKorName +' , <b> 병용금기 DUR성분(영문) </b> : '+data.mixTureIngrEngName +' </p>'
				+ '<p><b> 병용금기 제형 </b> : '+ data.mixTureFormName + ' , <b> 병용금기 전문/일반 </b> : '+ data.mixTureEtcOtcName +' </p>'
				+ '<p><b> 병용금기 제형구분코드 </b> : '+ data.mixTureFormCode +' </p>'
				+ '<p><b> 병용금기 약효분류 코드 </b> : '+ data.mixTureClassCode +' </p>'
				+ '<p><b> 병용금기 약효분류 </b> : '+ data.mixTureClassName + ' , <b> 병용금기 주성분 </b> : '+ data.mixTureMainIngr +' </p>'
				+ '<p><b> 금기 내용 </b> : '+ data.notificationDate + '</p>'
				+ '<p><b> 비고 </b> : '+ str4 + '</p>'
				+ '</div></div></li>'
				
				).appendTo($(".accordion-box"));
		}); // each end
	}
	
</script>

