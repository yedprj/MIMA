<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!-- page wrapper -->

	<div class="boxed_wrapper">
        
        <!-- preloader -->
        <div class="preloader"></div>
        <!-- preloader -->

        <!-- team-style-two -->
        <section class="team-style-two bg-color-3">
            <div class="auto-container">
                <div class="row clearfix">

			  <c:forEach  var="member" items="${patnerStatusSelect}">
                    <div class="col-lg-3 col-md-6 col-sm-12 team-block">
                        <div class="team-block-two wow fadeInUp animated animated" data-wow-delay="600ms" data-wow-duration="1500ms">
                            <div class="inner-box">
                                <div class="pattern" style="background-image: url(assets/images/shape/shape-43.png);"></div>
                               		 <button type="button" class = "btn btn-primary" onclick="location.href='insert'">등록</button>
                                <div class="lower-content">
                                    <h3><a href="doctors-details.html">${member.name }</a></h3>
                                    <span class="designation">${member.license }</span>
                                    <ul class="rating clearfix">
                                        <li><i class="icon-Star"></i></li>
                                        <li><i class="icon-Star"></i></li>
                                        <li><i class="icon-Star"></i></li>
                                        <li><i class="icon-Star"></i></li>
                                        <li><i class="icon-Star"></i></li>
                                        <li><a href="index.html">5 reviews</a></li>
                                    </ul>
                                    <div class="location-box">
                                        <p><i class="fas fa-map-marker-alt"></i>${member.address }</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
               </c:forEach>
               
               </div></div>
          
               <br><br>
	<div align="center">
		<button type="button" class="btn btn-primary" onclick="location.href='list'">목록</button>
	</div>
               
        </section>
	</div>
	
	
        <!-- team-style-two -->

