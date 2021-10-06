<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.nice-select {
		padding: 0px 0px;
		padding-left : 17px;
	}
	input::placeholder {
	  color: #d9d9d9;
	  font-style: italic;
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
											<option value="" data-display="카테고리 선택&nbsp;&nbsp;▼" class="option selected focus">검색 카테고리</option>
											<option value="juso">주소검색</option>
											<option value="phaName">약국명</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="search-inner">
							<form action="blog-3.html" method="post" class="search-form">
                               <div class="form-group">
                                   <input type="search" name="search-field" placeholder="Search">
                                   <button id="searchBtn" type="button"><i class="fas fa-search"></i></button>
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


	$(function() {
		
		// 검색 버튼 클릭시
		$("#searchBtn").on("click", function(){
			var search = $("input[name='search-field']").val();
			var category = $("select[name='category']").val();
			if( search == ''){
				$("input[name='search-field']").attr("placeholder", "검색할 내용을 입력하세요!");
				$("input[name='search-field']").focus();
				return;
			}else if (category == ''){
				alert("카테고리를 선택하세요");
				return;
			}
			alert("검색 클릭!"+ search);
		});// searchBtn end
		
	}); // function end
</script>
