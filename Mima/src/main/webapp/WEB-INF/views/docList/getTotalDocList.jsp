<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>

<style>
	.like-box {
		background-color: white;
	}
	
	.fill-heart {
		color: rgb(255, 51, 51);
	}

</style>

        <div class="boxed_wrapper">

        <!-- preloader -->
        <div class="preloader"></div>
        <!-- preloader -->

        <!--page-title-two-->
        <section class="page-title-two">
            <div class="title-box centred bg-color-2">
                <div class="pattern-layer">
                    <div class="pattern-1" style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-70.png);"></div>
                    <div class="pattern-2" style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-71.png);"></div>
                </div>
                <div class="auto-container">
                    <div class="title">
                        <h1>미마의 전체 의사 리스트</h1>
                    </div>
                </div>
            </div>
            <div class="lower-content">
                <div class="auto-container">
                    <ul class="bread-crumb clearfix">
                        <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                        <li>전체 의사 리스트</li>
                    </ul>
                </div>
            </div>
        </section>
        <!--page-title-two end-->


        <div class="select-field bg-color-3">
            <div class="auto-container">
                <div class="content-box">
                    <div class="form-inner clearfix">
                    
                       <form action="getTotalDocList" method="get" class="search-form" id="actionForm">
                            <div class="form-group clearfix">
                                <select class="wide" name="type">
                                  <option value=""
                                    <c:out value="${pageMaker.cri.type == null ? 'selected':'' }"/>
                                 >선택</option>
                                 <option value="A" 
                                    <c:out value="${pageMaker.cri.type eq 'A'? 'selected':'' }"/>
                                 >지역</option>
                                 <option value="C"
                                    <c:out value="${pageMaker.cri.type eq 'C'? 'selected':'' }"/>
                                 >카테고리</option>
                                 <option value="D"
                                    <c:out value="${pageMaker.cri.type eq 'W'? 'selected':'' }"/>
                                 >의사</option>
                                 <option value="AC"
                                    <c:out value="${pageMaker.cri.type eq 'TC'? 'selected':'' }"/>
                                 >지역 or 카테고리</option>
                                 <option value="AD" 
                                    <c:out value="${pageMaker.cri.type eq 'TW'? 'selected':'' }"/>
                                 >지역 or 의사</option>
                                 <option value="ADC"
                                    <c:out value="${pageMaker.cri.type eq 'TWC'? 'selected':'' }"/>
                                 >지역 or 카테고리 or 의사</option>
                                </select>
                                <input type="hidden" id="pageNum" name="pageNum" value="1">
                             <input type="hidden" id="amount" name="amount" value="${pageMaker.cri.amount}">
                                <input type="search" id="keyword" name="keyword" placeholder="Search">
                                <button type="submit"><i class="icon-Arrow-Right"></i></button>
                            </div>
                        </form>
                    
                    </div>
                </div>
            </div>
        </div>


        <!-- doctors-page-section -->
        <section class="clinic-section doctors-page-section">
            <div class="auto-container">
                <div class="row clearfix d-flex justify-content-center">
                    <div class="col-lg-2 col-md-12 col-sm-12 content-side"></div>
                    <div class="col-lg-8 col-md-12 col-sm-12 content-side">
                        <!-- 아이템 정렬 바 시작 -->
                        <div class="item-shorting clearfix">
                            <div class="left-column pull-left">
                                <h3>총 의사 ${pageMaker.total }</h3>
                            </div>
                            <div class="right-column pull-right clearfix">
                                <div class="short-box clearfix">
                                    <div class="select-box">
                                        <select class="wide">
                                            <option data-display="Sort by">Sort by</option>
                                            <option value="스트">스트레스/트라우마</option>
                                            <option value="기분">기분장애/공황•불안장애</option>
                                            <option value="신경">신경증/성격장애</option>
                                            <option value="직장">직장인 정신건강</option>
                                            <option value="중독">중독장애</option>
                                            <option value="노인">노인장애</option>
                                            <option value="해리">해리장애(다중인격)</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="menu-box">
                                    <button class="list-view on"><i class="icon-List"></i></button>
                                    <button class="grid-view"><i class="icon-Grid"></i></button>
                                </div>
                            </div>
                        </div>
                        <!-- 아이템 정렬 바 끝 -->

                        <!-- 의사 리스트 랩퍼 시작 -->
                        <div class="wrapper list">
                            <!-- 의사 블록 컨텐츠 리스트 -->
                            <div class="clinic-list-content list-item" id="docList">
                               <c:forEach  var="item" items="${list }">
                                <div class="clinic-block-one">
                                    <div class="inner-box">
                                        <div class="pattern">
                                            <div class="pattern-1"
                                                style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-24.png);"></div>
                                            <div class="pattern-2"
                                                style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-25.png);"></div>
                                        </div>
                                        <!-- 의사 프로필 사진 -->
                  
                                        <figure class="image-box">
                                        <c:choose>
						                     <c:when test="${not empty item.profilePhoto }">
						                        <img src="FileDown.do?fname=${item.profilePhoto}">
						                     </c:when>
						                     <c:otherwise>
						                        <img src="${pageContext.request.contextPath}/resources/assets/images/team/team-1.jpg" alt="">
						                     </c:otherwise>
						                  </c:choose>
                                      <%--   <img src="${pageContext.request.contextPath}/resources/assets/images/team/team-1.jpg" alt=""> --%>
                                        </figure>
                                        <div class="content-box">
                                        <!-- e.15 like -->

                                            <button type="button" class="like-box">
                                            <i class="far fa-heart" id="${item.memberNo}"></i></button>

                                            <ul class="name-box clearfix">
                                                <li class="name">
                                                    <h3><a class="move" href="${item.memberNo }">Dr.${item.name } num ${item.memberNo }</a></h3>
                                                </li>
                                                <li><i class="icon-Trust-1"></i></li>
                                                <li><i class="icon-Trust-2"></i></li>
                                            </ul>
                                            <span class="designation">${item.clinicInfo }</span>
                                            <%-- <div class="text">
                                                <p>${item.profileContents }</p>
                                            </div> --%>
                                            <div class="rating-box clearfix">
                                                <ul class="rating clearfix">
                                                    <li><i class="icon-Star"></i></li>
                                                    <li><i class="icon-Star"></i></li>
                                                    <li><i class="icon-Star"></i></li>
                                                    <li><i class="icon-Star"></i></li>
                                                    <li><i class="icon-Star"></i></li>
                                                    <li><a href="doctors-details.html">(${item.commentsCnt })</a></li>
                                                </ul>
                                                <div class="link"><a href="doctors-details.html">24/7 Available</a>
                                                </div>
                                            </div>
                                            <div class="location-box">
                                                <p><i class="fas fa-map-marker-alt"></i>${item.addr1 }</p>
                                            </div>
                                            <div class="btn-box" ><a href="${item.memberNo }" class="move">Visit Now</a></div>
                                        </div>
                                    </div>
                                </div>
                               </c:forEach>

                            </div>
                            <!-- 의사 블록 컨텐츠 끝 -->

                            <!-- 의사 그리드 컨텐츠 -->
                            <div class="clinic-grid-content">
                                <div class="row clearfix">
                                    <c:forEach  var="item" items="${list }">
                                    <div class="col-lg-6 col-md-6 col-sm-12 team-block">
                                        <div class="team-block-three">
                                            <div class="inner-box">
                                                <figure class="image-box">
                                                    <img src="${pageContext.request.contextPath}/resources/assets/images/team/team-5.jpg" alt="">
                                                    <a href="doctors-details.html"><i class="far fa-heart"></i></a>
                                                </figure>
                                                <div class="lower-content">
                                                    <ul class="name-box clearfix">
                                                        <li class="name">
                                                            <h3><a href="${item.memberNo }">Dr. ${item.name }</a></h3>
                                                        </li>
                                                        <li><i class="icon-Trust-1"></i></li>
                                                        <li><i class="icon-Trust-2"></i></li>
                                                    </ul>
                                                    <span class="designation">${item.profileEducation }</span>
                                                    <div class="rating-box clearfix">
                                                        <ul class="rating clearfix">
                                                            <li><i class="icon-Star"></i></li>
                                                            <li><i class="icon-Star"></i></li>
                                                            <li><i class="icon-Star"></i></li>
                                                            <li><i class="icon-Star"></i></li>
                                                            <li><i class="icon-Star"></i></li>
                                                            <li><a href="doctors-details.html">(${item.commentsCnt })</a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="location-box">
                                                        <p><i class="fas fa-map-marker-alt"></i>${item.addr1 }</p>
                                                    </div>
                                                    <div class="lower-box clearfix">
                                                        <span class="text">24/7 Available</span>
                                                        <a href="doctors-details.html">Book Now</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </c:forEach>
                                    
                                </div>
                            </div>
                            <!-- 의사 그리드 컨텐츠 리스트 끝 -->
                        </div>
                        <!-- 의사 리스트 랩퍼 시작 -->
                    </div>
                    <div class="col-lg-2 col-md-12 col-sm-12 content-side"></div>
                    <div class="pagination-wrapper centred">
                       <div id="pageButton">
                          <ul class="pagination">
                             <c:if test="${pageMaker.prev }">
                             <li><a href="${pageMaker.startPage-1 }"><i class="icon-Arrow-Left"></i></a></li>
                             </c:if>
                             
                             <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
                              <li><a href="${num }" class="current">${num }</a></li>
                              </c:forEach>
                              
                              <c:if test="${pageMaker.next }">
                              <li><a href="${pageMaker.endPage+1 }"><i class="icon-Arrow-Right"></i></a></li>
                              </c:if>
                          </ul>
                       </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- doctors-page-section end -->

    </div>
    
    
    <script>
    
    var csrfHeaderName = "${_csrf.headerName}";
    var csrfTokenValue = "${_csrf.token}";

    
 $(document).ready(function() {
    var actionForm = $('#actionForm');
    
    /* 타이틀 클릭 시 상세페이지로 넘어가면서 페이지넘&어마운트 같이 가져가기 */
    $(".move").on('click', function(e){
       e.preventDefault();
       actionForm.append('<input type="hidden" id="memberNo" name="memberNo" value="'+ $(this).attr("href") +'">');
       actionForm.attr("action", "docProfileDetail");
       actionForm.submit();
    });/* 타이틀 클릭 시 상세페이지로 넘어가면서 페이지넘&어마운트 같이 가져가기  끝*/
    
    //의사좋아요 클릭이벤트 시작
    $("#docList").on('click','.like-box',function(e){
       e.preventDefault();
       var like = $(this).children().attr('id');
       
       const heart = $(this).children();
       
       if ($(하트).css("color") == "rgb(255, 51, 51)") {
                //삭제 ajax 시작
                $.ajax({
                    url : "likes/likesDelete",
                    method : "delete",
                    dataType: 'json',
                    data : JSON.stringify({
                        memberNo : "${session.memberNo}",
                        category : "doc",
                        likeMainNo: like}),
                    contentType: 'application/json',
                    beforeSend : function(xhr) {
                        xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
                    },
                    success : function(data) {
                        if (data == 1) {
                            alert("좋아요가 취소되었습니다");
                            $(하트).css("color", "rgb(237, 222, 222)");
                        } else {
                            alert('좋아요 실패');
                        }
                    }
            })//삭제 ajax 끝
       } else {
           //insert ajax 시작
         $.ajax({
            url : "likes/likesInsert",
            method : "post",
            dataType: 'json',
            data : JSON.stringify({
               memberNo : "${session.memberNo}",
               category : "doc",
               likeMainNo: like}),
            contentType: 'application/json',
            beforeSend : function(xhr) {
               xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
            },
            success : function(data) {
               if (data == 1) {
                  alert("좋아요가 되었습니다");
                  $(하트).css("color", "rgb(255, 51, 51)");   
               } else {
                  alert('좋아요 실패');
               }
               }
               
            })//insert ajax 끝  
        }
      })//의사좋아요 클릭이벤트 끝
        
        /* 교재 312 페이지네이션 */
        $("#pageButton a").on("click", function (e) {
            e.preventDefault(); //a tag, submit

            var p = $(this).attr("href");
            $('[name="pageNum"]').val(p);

            actionForm.submit();
        });   /* 끝 페이지네이션 */
    });

</script>