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
</style>

<!-- sidebar-page-container -->
<section class="sidebar-page-container">
	<div class="auto-container">
		<div class="row clearfix">
			<div class="col-lg-12 col-md-12 col-sm-12 sidebar-side">
				<div class="blog-sidebar">
					<div class="sidebar-widget sidebar-search"
						style="background-color: #ebf7f6;">
						<div class="widget-title col-12">
							<div class="row">
								<div class="col-12 col-sm-2">
									<h3>약 검색</h3>
								</div>
								<div class="col-12 col-sm-2">
									<div class="form-group">
										<select class="wide" name="category">
											<option data-display="카테고리">검색 카테고리</option>
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
                    
                    
                    </div>
                </div>
            </div>
        </div>
</section>
<!-- sidebar-page-container end -->

<script>


	var itemName;
	var itemSeq;
	var efcyQesitm;
	var intrcQesitm;
	
	$(function() {
		
		// search Btn
		$("body").on("click","#searchBtn" , function(){
			var search = $("input[name='search-field']").val();
			var category = $("select[name=category] option:selected").val();
			
			if(search == ""){
				alert("검색할 내용을 입력하세요!")
				$("input[name='search-field']").focus();
				return;
			} else if(category == ""){
				alert("검색할 카테고리를 선택하세요!")
				return;
			} else {
				
				// 카테고리 체크해서 값 넣어주기
				if(category == "itemName"){
					itemName = search;
				}else if (category == "itemSeq" ){
					itemSeq = search;
				}else if (category == "efcyQesitm" ){
					efcyQesitm = search;
				}else {
					intrcQesitm = search;
				}						
				
				var img= '' ;
				var str1 = '' ; // 상호작용
				var str2 = '' ; // 사용전 주의사항
				var str3 = '' ; // 사용시 주의사항
				var str4 = '' ; // 부작용
				
				// 검색 요청
				$.ajax({
					url : "pill",
					method : "post",
					dataType : "json",
					data : JSON.stringify({
						itemName : itemName,
						itemSeq : itemSeq,
						efcyQesitm : efcyQesitm,
						intrcQesitm : intrcQesitm
					}),
					contentType : 'application/json',
					success : function(datas) {
						$(".accordion-box").empty();
						if (datas == null){
							alert("검색 되는 내용이 없습니다!");
						} else {
						$(".accordion-box").append($("<h3>검색결과</h3>"));
						$.each(datas, function(i, data) {
							// 이미지, 내용값 없는지 체크
							console.log(data);
							console.log(typeof data);
							if(data.itemImage != null){ img = '<img class="pillImg" src='+ data.itemImage +' alt="알약 이미지">'; }
							if(data.intrcQesitm == null ){ str1 = '조회되는 내용이 없습니다.'; } else {
								str1 = data.intrcQesitm;
							}
							if(data.atpnWarnQesitm == null ){ str2 = '조회되는 내용이 없습니다.' } else {
								str2 = data.atpnWarnQesitm;
							}
							if(data.atpnQesitm == null ){ str3 = '조회되는 내용이 없습니다.' } else {
								str3 = data.atpnQesitm;
							}
							if(data.seQesitm == null ){ str4 = '조회되는 내용이 없습니다.' } else {
								str4 = data.seQesitm;
							}
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
						})} // each end + else end
						
					},// success end
					error : function(){
						alert("검색되는 내용이 존재하지 않습니다!");
					}// error end
				}); // ajax end
				
				
			} // else end
		}); // searchBtn end
		
	
		
		
		
		
	}); // function end
	
</script>

