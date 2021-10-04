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
											<option data-display="카테고리 선택">-------</option>
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
<!-- sidebar-page-container end -->

<script>

	// pillSearch VO
	var itemName;
	var itemSeq;
	var efcyQesitm;
	var intrcQesitm;
	
	// durSearch VO
	var entpName; // 제약회사명
	
	// durDanger VO
	var ingrCode;
	var typeName;
	
	// 변수 초기화
	function initVar(){
		itemName = '';
		itemSeq = '';
		efcyQesitm = '';
		intrcQesitm = '';
		entpName = '';

	}
	
	
	$(function() {
		
		// 약 병용금기 검색 버튼
		$("body").on("click","#durDangerBtn" , function(){
			$(".accordion-box").empty();
			initVar();
			$("#titleH3 h3").text("병용금기검색");
			$('.icon-Arrow-Right').remove();
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
				+	'<option data-display="카테고리 선택">-------</option>'
				+	'<option value="itemName">품목명</option>'
				+	'<option value="typeName">DUR유형</option>'
				+	'<option value="ingrcode">DUR성분코드</option>'
				+   '</select>'
			);
		});
		
		
		// 약 정보검색
		$("body").on("click","#durBtn" , function(){
			$(".accordion-box").empty();
			initVar();
			$("#titleH3 h3").text("약 정보검색");
			$('.icon-Arrow-Right').remove();
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
				+	'<option data-display="카테고리 선택">-------</option>'
				+	'<option value="itemName">제품명</option>'
				+	'<option value="entpName">제약회사명</option>'
				+   '</select>'
			);
			
		});
		
		// 다시 e-약은요 검색
		$("body").on("click","#e_pill" , function(){
			$(".accordion-box").empty();
			initVar();
			$("#titleH3 h3").text("e-약은요");
			$('.icon-Arrow-Right').remove();
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
				+	'<option data-display="카테고리 선택">-------</option>'
				+	'<option value="itemName">제품명</option>'
				+	'<option value="itemSeq">품목기준코드</option>'
				+	'<option value="efcyQesitm">효능</option>'
				+	'<option value="intrcQesitm">상호작용</option>'
				+   '</select>'
			);
		
		});
		
		// e-약은요 search Btn
		$("body").on("click","#searchBtn" , function(){
			$(".accordion-box").empty();
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
							
							if (datas == null){
								alert("검색 되는 내용이 없습니다!");
							} else {
							$(".accordion-box").append($("<h3>검색결과</h3>"));
							$.each(datas, function(i, data) {
								// 이미지, 내용값 없는지 체크
								console.log(data);
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
				if(category == "itemName"){
					itemName = search;
				}else {
					entpName = search;
				}
				

				var str1 = '' ; 
				var str2 = '' ; 
				var str3 = '' ; 
				var str4 = '' ; 
				
				
				$.ajax({
					url : "dur",
					method : "post",
					dataType : "json",
					data : JSON.stringify({
						itemName : itemName,
						entpName : entpName
					}),
					contentType : 'application/json',
					success : function(datas) {
						if (datas == null){
							alert("검색 되는 내용이 없습니다!");
						} else {
						$(".accordion-box").append($("<h3>검색결과</h3>"));
						$.each(datas, function(i, data) {
							// 이미지, 내용값 없는지 체크
							console.log(data);
							
							if(data.eeDocId == null ){ str1 = '조회되는 내용이 없습니다.'; } else {
								str1 = data.eeDocId;
							}
							if(data.udDocId == null ){ str2 = '조회되는 내용이 없습니다.' } else {
								str2 = data.udDocId;
							}
							if(data.nbDocId == null ){ str3 = '조회되는 내용이 없습니다.' } else {
								str3 = data.nbDocId;
							}
							if(data.insertFile == null ){ str4 = '조회되는 내용이 없습니다.' } else {
								str4 = data.insertFile;
							}
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
	                        	+ '<a href="'+ str1 +'" target="_blank">'+ str1 +'</a></div></div></li>'
	                        	// 용법용량
	                         	+ '<li class="accordion block"><div class="acc-btn"><div class="icon-outer"></div>'
	                            + '<h6><b> 용법용량 </b></h6></div>'
	                        	+ '<div class="acc-content"><div class="text">'
	                        	+ '<a href="'+ str2 +'" target="_blank">'+ str2 + '</a>'
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
	                        	+ '<a href="'+str4 +'" target="_blank">'+ str4 +'</a>'
	                        	+ '<p>포장단위 : ' + data.packUnit + '</p>'
	                        	+ '<p>보험코드 : ' + data.ediCode + '</p>'
	                        	+ '</div></div></li>'
	                        	
	                    	).appendTo($(".accordion-box"));
						})} // each end + else end
						
					},// success end
					error : function(){
						alert("검색되는 내용이 존재하지 않습니다!");
					}// error end
					
				}); // ajax end
			 
			} // else end
			
			//**********************병용금기*************************
		} else if(searText =="병용금기검색" ) {
			
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
				if(category == "itemName"){
					itemName = search;
				}else if(category == "typeName") {
					typeName = search;
				}else {
					ingrCode = search;
				}
				

				var str1 = '' ; 
				var str2 = '' ; 
				var str3 = '' ; 
				var str4 = '' ; 
				
				
				$.ajax({
					url : "durDanger",
					method : "post",
					dataType : "json",
					data : JSON.stringify({
						itemName : itemName,
						typeName : typeName,
						ingrCode : ingrCode
						
					}),
					contentType : 'application/json',
					success : function(datas) {
						if (datas == null){
							alert("검색 되는 내용이 없습니다!");
						} else {
						$(".accordion-box").append($("<h3>검색결과</h3>"))
										   .append($("<h5>검색한 품목명: "+datas[0].ingrKorName+"</h5>"));
						$.each(datas, function(i, data) {
							// 이미지, 내용값 없는지 체크
							console.log(data);
							
							if(data.eeDocId == null ){ str1 = '조회되는 내용이 없습니다.'; } else {
								str1 = data.eeDocId;
							}
							if(data.udDocId == null ){ str2 = '조회되는 내용이 없습니다.' } else {
								str2 = data.udDocId;
							}
							if(data.nbDocId == null ){ str3 = '조회되는 내용이 없습니다.' } else {
								str3 = data.nbDocId;
							}
							if(data.insertFile == null ){ str4 = '조회되는 내용이 없습니다.' } else {
								str4 = data.insertFile;
							}
							// 제품명	
							$(".accordion-box")
								.append('<br><div class="title-box"><h6>병용금기품목명: '
										+ data.mixtureItemName + '<span>병용금기전문일반구분코드['+ data.mixtureEtcOtcCode + ']  병용금기약효분류코드: '+ data.mixtureClassCode +'</span></h6></div>');
							$('<ul class="accordion-inner">')
								// 효능
							.append('<li class="accordion block">'
								+ '<div class="acc-btn"><div class="icon-outer"></div>'
								+ '<h6><b> 병용금기 </b></h6></div>'
	                            + '<div class="acc-content"><div class="text">'
	                            + '<p> 병용금기 DUR번호 : '+ data.mixtureDurSeq +', 병용금기DUR성분코드: '+data.mixtureIngrCode +' </p>'
	                            + '<p> 병용금기DUR성분 : '+ data.mixtureIngrKorName +', 병용금기DUR성분(영문) : '+data.mixture +' </p>'
	                        	+ '<a href="'+ str1 +'" target="_blank">'+ str1 +'</a></div></div></li>'
	                        	// 용법용량
	                         	+ '<li class="accordion block"><div class="acc-btn"><div class="icon-outer"></div>'
	                            + '<h6><b> 용법용량 </b></h6></div>'
	                        	+ '<div class="acc-content"><div class="text">'
	                        	+ '<a href="'+ str2 +'" target="_blank">'+ str2 + '</a>'
	                        	+ '<p>저장방법: '+data.storageMethod +'</p>'
	                        	+ '<p>유효기간: '+data.validTerm +'</p>'
	                        	+ '</div></div></li>'
	                        	// 주의사항
	                        	+ '<li class="accordion block"><div class="acc-btn"><div class="icon-outer"></div>'
	                            + '<h6><b> 주의사항 </b><span></span></h6></div>'
	                        	+ '</a></div></div></li>'
	                        	// 첨부문서
	                        	+ '<li class="accordion block"><div class="acc-btn"><div class="icon-outer"></div>'
	                            + '<h6><b> 첨부문서 및 기타 </b><span></h6></div>'
	                        	+ '<div class="acc-content"><div class="text">'
	                        	+ '<a href="'+str4 +'" target="_blank">'+ str4 +'</a>'
	                        	+ '<p>포장단위 : ' + data.packUnit + '</p>'
	                        	+ '<p>보험코드 : ' + data.ediCode + '</p>'
	                        	+ '</div></div></li>'
	                        	
	                    	).appendTo($(".accordion-box"));
						})} // each end + else end
						
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
	
	function openWindow(url){
		window.open(url,'name','resizable=no width=800 height=600');
	}
	
</script>

