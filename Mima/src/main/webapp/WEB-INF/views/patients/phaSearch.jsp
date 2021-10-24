<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<style>
	.nice-select {
		padding: 0px 0px;
		padding-left : 17px;
	}
	input::placeholder {
	  	color: #d9d9d9;
	  	font-style: italic;
	}
	.nice-select.open .list {
		height: 150px;
  		overflow-y: auto;
	}

</style>
<div class="auto-container">
		<div class="row clearfix">
			<div class="col-lg-12 col-md-12 col-sm-12 sidebar-side">
				<div class="blog-sidebar">
					<br>
					<div class="title-box">
					   <div class="btn-box">
					       <h3 class="text-center"><b>약국 찾기</b></h3>
					   </div>
					</div>
					<br>
					<div class="sidebar-widget sidebar-search"
						style="background-color: #ebf7f6;">
						<div class="widget-title col-12">
							<div class="row">
								<div class="col-12 col-sm-4">
									<div class="form-group categroyBox">
										<select class="wide" name="category">
											<option value=""  data-display="카테고리 선택&nbsp;&nbsp;▼" class="option selected focus" <c:out value="${pageMaker.cri.type==null ?'selected':''}"/>> 검색 카테고리</option>
											<option value="D" <c:out value="${pageMaker.cri.type eq 'D' ?'selected':''}"/> >주소검색</option>
											<option value="P" <c:out value="${pageMaker.cri.type eq 'P' ?'selected':''}"/> >약국명</option>
										</select>
									</div>
								</div>
								<div class="col-12 col-sm-8"></div>
								<br><br>
								<div class="col-12 col-sm-6">
									<div class="form-group categroyBox">
									<select id="cido" class="wide" name="cido" >
                                        <option value="" data-display="시도 선택&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;▼" class="option selected focus">선택</option>
                                        <option value="서울">서울특별시</option>
										<option value="부산">부산광역시</option>
										<option value="대구">대구광역시</option>
										<option value="인천">인천광역시</option>
										<option value="광주">광주광역시</option>
										<option value="대전">대전광역시</option>
										<option value="울산">울산광역시</option>
										<option value="세종특별자치시">세종특별자치시</option>
										<option value="경기도">경기도</option>
										<option value="강원">강원도</option>
										<option value="충청북도">충청북도</option>
										<option value="충청남도">충청남도</option>
										<option value="전라북도">전라북도</option>
										<option value="전라남도">전라남도</option>
										<option value="경상북도">경상북도</option>
										<option value="경상남도">경상남도</option>
										<option value="제주특별자치도">제주특별자치도</option>
                                     </select>
                                     </div>
								</div>
								<div class="col-12 col-sm-6">
									<div class="form-group ciBox">
										<select id="ci" class="wide" name="ci" >
											<option value="" data-display="구,군&nbsp;&nbsp;▼" class="option selected focus">선택</option>
											
										</select>
									</div>
								</div>
							</div>
						</div>
						<!-- 검색 구간 -->
						<div id="searchBox" class="search-inner">
							<form class="search-form">
                               <div class="form-group">
                                   <input type="search" name="search-field" placeholder="Search">
                                   <button id="searchBtn" type="button"><i class="fas fa-search"></i></button>
                               </div>
                               <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                               
                            </form>
						</div>
					</div> <!-- 약 검색 구간 END -->
					<div class="wrapper list">
	                    <div class="clinic-list-content list-item">
	                        <!-- 검색 결과내용 -->
	                        
	                    </div>
	                </div>
					
                    <!-- 검색결과 끝 -->
                    <div class="pagination-wrapper">
                         <ul class="pagination">
                             
                         </ul>
                    </div>
                    <br>
                    </div>
                </div>
            </div>
       
        </div>
<!-- sidebar-page-container end -->

<script>
	

	$(function() {
		
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		
		
		// 주소 선택시
		$("#cido").on("change",function(){
			$(".ciBox .current").text("선택");
			$(".ciBox .list").empty();
			$(".ciBox .list").append(
					'<option value="" data-display="구,군&nbsp;&nbsp;▼" class="option selected focus">선택</option>'	
				);
			
			var ciChecked = $("select[name='cido']").val();
			var subOption = {
				"seoul" : ['종로구','중구','용산구','성동구','광진구','동대문구','중랑구','성북구','강북구','도봉구','노원구','은평구','서대문구','마포구','양천구','강서구','구로구','금천구','영등포구','동작구','관악구','서초구','강남구','송파구','강동구' ],
				"busan" : ['중구','서구','동구','영도구','부산진구','동래구','남구','북구','해운대구','사하구','금정구','강서구','연제구','수영구','사상구','기장군'],
				"daegu" : ['중구','동구','서구','남구','북구','수성구','달서구','달성군'],
				"incheon" : ['중구','동구','미추홀구','연수구','남동구','부평구','계양구','서구','강화군','옹진군'],
				"ghangjo" : ['동구','서구','남구','북구','광산구'],
				"deajeon" : ['동구','중구','서구','유성구','대덕구'],
				"ulsan" : ['중구','남구','동구','북구','울주군'],
				"gyeonggi" : ['수원시 장안구','수원시 권선구','수원시 팔달구','수원시 영통구','성남시 수정구','성남시 중원구','성남시 분당구','의정부시','안양시 만안구','안양시 동안구','부천시','광명시','평택시','동두천시','안산시 상록구','안산시 단원구',
							'고양시 덕양구','고양시 일산동구','고양시 일산서구','과천시','구리시','남양주시','오산시','오산시','시흥시','군포시','의왕시','하남시','용인시 처인구','용인시 기흥구','용인시 수지구', '파주시','이천시','안성시','김포시',
							'화성시','광주시','양주시','포천시','여주시','연천군','가평군','양평군'],
				"gangwon" : ['춘천시','원주시','강릉시','동해시','태백시','속초시','삼척시','홍천군','횡성군','영월군','평창군','정선군','철원군','화천군','양구군','인제군','고성군','영양군'],
				"chungbuk" : ['청주시 상당구','청주시 서원구','청주시 흥덕구','청주시 청원구','충주시','제천시','보은군','옥천군','영동군','증평군','진천군','괴산군','음성군','단양군'],
				"chungnam" : ['천안시 동남구','천안시 서북구','공주시','보령시','아산시','서산시','논산시','계룡시','당진시','금산군','부여군','서천군','청양군','홍성군','예산군','태안군'],
				"jeonbuk" : ['전주시 완산구','전주시 덕진구','군산시','익산시','정읍시','남원시','김제시','완주군','진안군','무주군','장수군','임실군','순창군','고창군','부안군'],
				"jeonnam" : ['목포시','여수시','순천시','나주시','광양시','담양군','곡성군','구례군','고흥군','보성군','화순군','장흥군','강진군','해남군','영암군','무안군','함평군','영광군','장성군','완도군','진도군','신안군'],
				"gyeongbuk" : ['포항시 남구','포항시 북구','경주시','김천시','안동시','구미시','영주시','영천시','상주시','문경시','경산시','군위군','의성군','청송군','영양군','영덕군','청도군','고령군','성주군','칠곡군','예천군','봉화군','울진군','울릉군'],
				"gyeongnam" : ['창원시 의창구','창원시 성산구','창원시 마산합포구','창원시 마산회원구','창원시 진해구','진주시','통영시','사천시','김해시','밀양시','거제시','양산시','의령군','함안군','창녕군','고성군','남해군','하동군','산청군','함양군','거창군','합천군'],
				"jeju" : ['제주시','서귀포시']
			}
			console.log(subOption.seoul);
			var ci;
			if( ciChecked == "서울"){
				for (var i=0; i < subOption.seoul.length; i++){
					$(".ciBox .list").append(
						'<li data-value="'+subOption.seoul[i] +'" class="option">'+subOption.seoul[i] +'</li>'							
					);
					$("#ci").append(
						'<option value="'+subOption.seoul[i] +'">'+subOption.seoul[i] +'</option>'	
					);
				}
			} // if문
			else if( ciChecked == "부산"){
				for (var i=0; i < subOption.busan.length; i++){
					$(".ciBox .list").append(
						'<li data-value="'+subOption.busan[i] +'" class="option">'+subOption.busan[i] +'</li>'							
					);
					$("#ci").append(
							'<option value="'+subOption.busan[i] +'">'+subOption.busan[i] +'</option>'	
						);
				}
			} // if문
			else if( ciChecked == "대구"){
				for (var i=0; i < subOption.daegu.length; i++){
					$(".ciBox .list").append(
						'<li data-value="'+subOption.daegu[i] +'" class="option">'+subOption.daegu[i] +'</li>'							
					);
					$("#ci").append(
							'<option value="'+subOption.daegu[i] +'">'+subOption.daegu[i] +'</option>'	
						);
				}
			} // if문
			else if( ciChecked == "인천"){
				for (var i=0; i < subOption.incheon.length; i++){
					$(".ciBox .list").append(
						'<li data-value="'+subOption.incheon[i] +'" class="option">'+subOption.incheon[i] +'</li>'							
					);
					$("#ci").append(
							'<option value="'+subOption.incheon[i] +'">'+subOption.incheon[i] +'</option>'	
						);
					
				}
			} // if문
			else if( ciChecked == "광주"){
				for (var i=0; i < subOption.ghangjo.length; i++){
					$(".ciBox .list").append(
						'<li data-value="'+subOption.ghangjo[i] +'" class="option">'+subOption.ghangjo[i] +'</li>'							
					);
					$("#ci").append(
							'<option value="'+subOption.ghangjo[i] +'">'+subOption.ghangjo[i] +'</option>'	
					);
				}
			} // if문
			else if( ciChecked == "대전"){
				for (var i=0; i < subOption.deajeon.length; i++){
					$(".ciBox .list").append(
						'<li data-value="'+subOption.deajeon[i] +'" class="option">'+subOption.deajeon[i] +'</li>'							
					);
					$("#ci").append(
							'<option value="'+subOption.deajeon[i] +'">'+subOption.deajeon[i] +'</option>'	
					);
				}
			} // if문
			else if( ciChecked == "울산"){
				for (var i=0; i < subOption.ulsan.length; i++){
					$(".ciBox .list").append(
						'<li data-value="'+subOption.ulsan[i] +'" class="option">'+subOption.ulsan[i] +'</li>'							
					);
					$("#ci").append(
							'<option value="'+subOption.ulsan[i] +'">'+subOption.ulsan[i] +'</option>'	
					);
				}
			} // if문
			else if( ciChecked == "경기도"){
				for (var i=0; i < subOption.gyeonggi.length; i++){
					$(".ciBox .list").append(
						'<li data-value="'+subOption.gyeonggi[i] +'" class="option">'+subOption.gyeonggi[i] +'</li>'							
					);
					$("#ci").append(
							'<option value="'+subOption.gyeonggi[i] +'">'+subOption.gyeonggi[i] +'</option>'	
					);
				}
			} // if문
			else if( ciChecked == "강원"){
				for (var i=0; i < subOption.gangwon.length; i++){
					$(".ciBox .list").append(
						'<li data-value="'+subOption.gangwon[i] +'" class="option">'+subOption.gangwon[i] +'</li>'							
					);
					$("#ci").append(
							'<option value="'+subOption.gangwon[i] +'">'+subOption.gangwon[i] +'</option>'	
					);
				}
			} // if문
			else if( ciChecked == "충청북도"){
				for (var i=0; i < subOption.chungbuk.length; i++){
					$(".ciBox .list").append(
						'<li data-value="'+subOption.chungbuk[i] +'" class="option">'+subOption.chungbuk[i] +'</li>'							
					);
					$("#ci").append(
							'<option value="'+subOption.chungbuk[i] +'">'+subOption.chungbuk[i] +'</option>'	
					);
				}
			} // if문
			else if( ciChecked == "충청남도"){
				for (var i=0; i < subOption.chungnam.length; i++){
					$(".ciBox .list").append(
						'<li data-value="'+subOption.chungnam[i] +'" class="option">'+subOption.chungnam[i] +'</li>'							
					);
					$("#ci").append(
							'<option value="'+subOption.chungnam[i] +'">'+subOption.chungnam[i] +'</option>'	
					);
				}
			} // if문
			else if( ciChecked == "전라북도"){
				for (var i=0; i < subOption.jeonbuk.length; i++){
					$(".ciBox .list").append(
						'<li data-value="'+subOption.jeonbuk[i] +'" class="option">'+subOption.jeonbuk[i] +'</li>'							
					);
					$("#ci").append(
							'<option value="'+subOption.jeonbuk[i] +'">'+subOption.jeonbuk[i] +'</option>'	
					);
				}
			} // if문
			else if( ciChecked == "전라남도"){
				for (var i=0; i < subOption.jeonnam.length; i++){
					$(".ciBox .list").append(
						'<li data-value="'+subOption.jeonnam[i] +'" class="option">'+subOption.jeonnam[i] +'</li>'							
					);
					$("#ci").append(
							'<option value="'+subOption.jeonnam[i] +'">'+subOption.jeonnam[i] +'</option>'	
					);
				}
			} // if문
			else if( ciChecked == "경상북도"){
				for (var i=0; i < subOption.gyeongbuk.length; i++){
					$(".ciBox .list").append(
						'<li data-value="'+subOption.gyeongbuk[i] +'" class="option">'+subOption.gyeongbuk[i] +'</li>'							
					);
					$("#ci").append(
							'<option value="'+subOption.gyeongbuk[i] +'">'+subOption.gyeongbuk[i] +'</option>'	
					);
				}
			} // if문
			else if( ciChecked == "경상남도"){
				for (var i=0; i < subOption.gyeongnam.length; i++){
					$(".ciBox .list").append(
						'<li data-value="'+subOption.gyeongnam[i] +'" class="option">'+subOption.gyeongnam[i] +'</li>'							
					);
					$("#ci").append(
							'<option value="'+subOption.gyeongnam[i] +'">'+subOption.gyeongnam[i] +'</option>'	
					);
				}
			} // if문
			else if( ciChecked == "제주특별자치도"){
				for (var i=0; i < subOption.jeju.length; i++){
					$(".ciBox .list").append(
						'<li data-value="'+subOption.jeju[i] +'" class="option">'+subOption.jeju[i] +'</li>'							
					);
					$("#ci").append(
							'<option value="'+subOption.jeju[i] +'">'+subOption.jeju[i] +'</option>'	
					);
				}
			} // if문
			else {	};
			
		}); // 주소 option end
		
		// 검색 초기화
		function init(){
			
		}
		
		// 검색 버튼 클릭시
		$("#searchBtn").on("click", function(){
			$(".list-item").empty();
			var search = $("input[name='search-field']").val();
			var category = $("select[name='category']").val();
			var cido = $("select[name='cido']").val();
			var ci = $("select[name='ci']").val();
			var delJuso = cido + " " + ci;
			
			
			if (category == ''){ // 카테고리 체크
				alert("카테고리를 선택하세요");
				return;
			}
			
			// 주소검색일때
			if(category == 'D'){
				
				if (search != ""){
					delJuso = cido + " " + ci + " " + search;
				}
				$.ajax({
	    			url : "pharmacy",
	    			method : "post",
	    			data : JSON.stringify({
	    				keyword : delJuso ,
	    				type : category
	    			}),
	    			beforeSend : function(xhr) {
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
	    			dataType : "json", 
	    			contentType : "application/json",
	    			success : function(datas){
	    				if( datas == null) {
	    					alert("검색결과 존재하지 않습니다");
	    				}else {
	    					$.each(datas,function(i, data) {
	    						dataView(data);
	    					}); // each end
	    				}
	    			}  // success end
	    		}); //  ajax end
			}
			// 약국명 검색 체크
			else if (category == 'P'){
				
				// 검색내용 체크
				if( search == ''){
					$("input[name='search-field']").attr("placeholder", "검색할 약국이름을 입력하세요!");
					$("input[name='search-field']").focus();
					return;
				}
				console.log("조건문 확인"+cido+" : " + ci+" : " +search);
				if (cido == "" && ci == "") {
					console.log("if"+cido+" : " + ci+" : " +search);
					$.ajax({
		    			url : "pharmacy",
		    			method : "post",
		    			data : JSON.stringify({
		    				keyword : search ,
		    				type : category
		    			}),
		    			beforeSend : function(xhr) {
							xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
						},
		    			dataType : "json", 
		    			contentType : "application/json",
		    			success : function(datas){
		    				if( datas == null) {
		    					alert("검색결과 존재하지 않습니다");
		    				}else {
		    					$.each(datas,function(i, data) {
		    						dataView(data);
		    					}); // each end
		    				}
		    			}  // success end
		    		}); //  ajax end
				}
				// 약국명이랑 주소 같이 검색 + 스크립트에서 한번더 걸러줌
				else {
					console.log("else"+ cido + " : " + ci+" : " +search);
					$.ajax({
		    			url : "pharmacy",
		    			method : "post",
		    			data : JSON.stringify({
		    				keyword : delJuso ,
		    				type : "D"
		    			}),
		    			beforeSend : function(xhr) {
							xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
						},
		    			dataType : "json", 
		    			contentType : "application/json",
		    			success : function(datas){
		    					var result = false;
		    					$.each(datas,function(i, data) {
		    						var phaName = data.pharmacyInfo;
		    						if(phaName.includes(search)){
		    							dataView(data);
			    						result = true;
		    						} 
		    					}); // each end
		    					if(result == false){
		    						alert("일치하는 주소지와 약국명이 존재하지 않습니다.")
		    					}
		    			}  // success end
					});// ajax end
				
				 } // 주소+ 약국 end
				
            } // 카테고리 약국명 찾기
            
		});// searchBtn end
		
		 $(document).on("click","#phaCheckBtn", function(){
			console.log(this);
			var no = $(this).data("no");
			var phaName = $(this).data("name");
			var area = $(this).data("area");
			var phaTel = $(this).data("tel");
			console.log(no);
			console.log(phaName);
			$("#pharmacyNo", opener.document).val(no);
			$("#phaName", opener.document).val(phaName + " ("+ area + ")");
			$("#phaContact", opener.document).val(phaTel);
			window.close();
		 });
		
		
	}); // function end
	
	function dataView(data){
		// 이미지 존재 유무
		str = "";
		if (data.profilePhoto == ''){
			str = '<img src="${pageContext.request.contextPath}/resources/assets/images/resource/comment-1.png">'
		} else {
			str = '<img src="FileDown.do?fname='+data.profilePhoto+'">'
		}
		$(".list-item").append(
				'<div class="clinic-block-one"><div class="inner-box">'
                +    '<form><figure class="image-box">'+str+'</figure>'
                +    '<div class="content-box"><ul class="name-box clearfix">'
                +            '<li class="name"><h3>'+data.pharmacyInfo+'</h3></li>'
                +            '<li><i class="icon-Trust-1"></i></li>'
                +            '<li><i class="icon-Trust-2"></i></li></ul>'
                +        '<span class="designation">'+data.pharmacyContact+'</span>'
                +        '<div class="text"><p>'+data.profileContents+'</p></div>'
                +        '<div class="location-box"><p><i class="fas fa-map-marker-alt"></i>'+data.deliveryArea+'</p></div>'
                +        '<div class="btn-box"><a id="phaCheckBtn" data-no="'+data.memberNo+'" data-name="'+data.pharmacyInfo+'" data-area="'+data.deliveryArea+'" data-tel="'+data.pharmacyContact+'">약국 선택</a></div>'
                + '</div></form></div></div>'
       		);// append end
	}
	
</script>
