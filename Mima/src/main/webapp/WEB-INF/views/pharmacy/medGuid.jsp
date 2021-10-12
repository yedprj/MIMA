<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--page-title-two-->
<section class="page-title-two">
	<div class="title-box centred bg-color-2">
		<div class="pattern-layer">
			<div class="pattern-1"
				style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-70.png);"></div>
			<div class="pattern-2"
				style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-71.png);"></div>
		</div>
		<div class="auto-container">
			<div class="title">
				<h1>약국 대쉬보드</h1>
			</div>
		</div>
	</div>
	<div class="lower-content">
		<ul class="bread-crumb clearfix">
			<li><a href="${pageContext.request.contextPath}">Home</a></li>
			<li>약국 대쉬보드</li>
		</ul>
	</div>
</section>
<!--page-title-two end-->
    
<section class="doctors-dashboard bg-color-3">
	<!-- 왼쪽사이드 메뉴바 연결 -->
	<div class="left-panel">
		<div class="profile-box">
			<div class="upper-box">
				<figure class="profile-image">
					<img src="${pageContext.request.contextPath}/resources/assets/images/resource/profile-2.png" alt="">
				</figure>
				<div class="title-box centred">
					<div class="inner">
						<h3>${profile.pharmacyInfo}</h3>
						<p>${profile.profileContents}</p>
					</div>
				</div>
			</div>
			<div class="profile-info">
				<ul class="list clearfix">
					<li><a id="dash" href="${pageContext.request.contextPath}/pharmacy/pharmacyDash" ><i
							class="fas fa-columns"></i>대쉬보드</a></li>
					<li><a id="delivery" href="${pageContext.request.contextPath}/pharmacy/mediDelivery"><i class="fas fa-ambulance"></i>약배달관리</a></li>
					<li><a id="guid" href="${pageContext.request.contextPath}/pharmacy/medGuid" class="current"><i class="fas fa-comment-medical"></i>복약지도관리</a></li>
					<li><a id="revicw" href="${pageContext.request.contextPath}/pharmacy/review"><i class="fas fa-star"></i>약국 후기</a></li>
					<li><a id="ques" href="${pageContext.request.contextPath}/pharmacy/phaQna"><i class="fas fa-comments"></i>문의</a><span>20</span></li>
					<li><a id="profile" href="${pageContext.request.contextPath}/pharmacy/myProfile"><i class="fas fa-user"></i>약국 프로필</a></li>
					<li><a id="pwUpdate" href="${pageContext.request.contextPath}/pharmacy/pwUpdate"><i
							class="fas fa-unlock-alt"></i>비밀번호 변경</a></li>
					<li><a id="logout" href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt"></i>로그아웃</a></li>
				</ul>
			</div>
		</div>
	</div>
	
	<div class="right-panel">
                <div class="content-container">
                    <div class="outer-container">
                        <div class="doctors-appointment my-patients">
                            <div class="title-box clearfix">
                                <div class="text pull-left">
                                    <h3>Patients List</h3>
                                </div>
                                <div class="btn-box pull-right">
                                    <form action="my-patients.html" method="post" class="search-form">
                                        <div class="form-group">
                                            <input type="search" name="search-field" placeholder="Search" required="">
                                            <button type="submit"><i class="far fa-search"></i></button>
                                        </div>
                                    </form>
                                    <a href="patient-dashboard.html" class="theme-btn-one">Add New<i class="icon-image"></i></a>
                                </div>
                            </div>
                            <div class="doctors-list">
                                <div class="table-outer">
                                    <table class="doctors-table">
                                        <thead class="table-header">
                                            <tr>
                                                <th>Patient Name</th>
                                                <th>Sex</th>
                                                <th>Address</th>
                                                <th>Mobile</th>
                                                <th>Age</th>
                                                <th>Blood Group</th>
                                                <th>Action</th>
                                                <th>&nbsp;</th>
                                            </tr>    
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <div class="name-box">
                                                        <figure class="image"><img src="assets/images/resource/patient-1.png" alt=""></figure>
                                                        <h5>Mary Astor</h5>
                                                    </div>
                                                </td>
                                                <td>
                                                    <p>Male</p>
                                                </td>
                                                <td>
                                                    <p>Flat 20, Reynolds Neck, NY</p>
                                                </td>
                                                <td>
                                                    <p>+(22) 65_458_856</p>
                                                </td>
                                                <td>
                                                    <p>29 Yrs</p>
                                                </td>
                                                <td>
                                                    <p>O+</p>
                                                </td>
                                                <td>
                                                    <span class="accept"><i class="fas fa-pencil-alt"></i>Edit</span>
                                                </td>
                                                <td>
                                                    <span class="cancel"><i class="fas fa-times"></i>Cancel</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="name-box">
                                                        <figure class="image"><img src="assets/images/resource/patient-2.png" alt=""></figure>
                                                        <h5>Samuel Daniels</h5>
                                                    </div>
                                                </td>
                                                <td>
                                                    <p>Female</p>
                                                </td>
                                                <td>
                                                    <p>Flat 20, Reynolds Neck, NY</p>
                                                </td>
                                                <td>
                                                    <p>+(22) 65_458_857</p>
                                                </td>
                                                <td>
                                                    <p>27 Yrs</p>
                                                </td>
                                                <td>
                                                    <p>AB-</p>
                                                </td>
                                                <td>
                                                    <span class="accept"><i class="fas fa-pencil-alt"></i>Edit</span>
                                                </td>
                                                <td>
                                                    <span class="cancel"><i class="fas fa-times"></i>Cancel</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="name-box">
                                                        <figure class="image"><img src="assets/images/resource/patient-3.png" alt=""></figure>
                                                        <h5>Julia Jhones</h5>
                                                    </div>
                                                </td>
                                                <td>
                                                    <p>Female</p>
                                                </td>
                                                <td>
                                                    <p>Flat 20, Reynolds Neck, NY</p>
                                                </td>
                                                <td>
                                                    <p>+(22) 65_458_854</p>
                                                </td>
                                                <td>
                                                    <p>30 Yrs</p>
                                                </td>
                                                <td>
                                                    <p>B+</p>
                                                </td>
                                                <td>
                                                    <span class="accept"><i class="fas fa-pencil-alt"></i>Edit</span>
                                                </td>
                                                <td>
                                                    <span class="cancel"><i class="fas fa-times"></i>Cancel</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="name-box">
                                                        <figure class="image"><img src="assets/images/resource/patient-4.png" alt=""></figure>
                                                        <h5>Paolo Dybala</h5>
                                                    </div>
                                                </td>
                                                <td>
                                                    <p>Male</p>
                                                </td>
                                                <td>
                                                    <p>Flat 20, Reynolds Neck, NY</p>
                                                </td>
                                                <td>
                                                    <p>+(22) 65_458_855</p>
                                                </td>
                                                <td>
                                                    <p>45 Yrs</p>
                                                </td>
                                                <td>
                                                    <p>O-</p>
                                                </td>
                                                <td>
                                                    <span class="accept"><i class="fas fa-pencil-alt"></i>Edit</span>
                                                </td>
                                                <td>
                                                    <span class="cancel"><i class="fas fa-times"></i>Cancel</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="name-box">
                                                        <figure class="image"><img src="assets/images/resource/patient-5.png" alt=""></figure>
                                                        <h5>Jean Arthur</h5>
                                                    </div>
                                                </td>
                                                <td>
                                                    <p>Female</p>
                                                </td>
                                                <td>
                                                    <p>Flat 20, Reynolds Neck, NY</p>
                                                </td>
                                                <td>
                                                    <p>+(22) 65_458_856</p>
                                                </td>
                                                <td>
                                                    <p>29 Yrs</p>
                                                </td>
                                                <td>
                                                    <p>A+</p>
                                                </td>
                                                <td>
                                                    <span class="accept"><i class="fas fa-pencil-alt"></i>Edit</span>
                                                </td>
                                                <td>
                                                    <span class="cancel"><i class="fas fa-times"></i>Cancel</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="name-box">
                                                        <figure class="image"><img src="assets/images/resource/patient-6.png" alt=""></figure>
                                                        <h5>Rex Allen</h5>
                                                    </div>
                                                </td>
                                                <td>
                                                    <p>Male</p>
                                                </td>
                                                <td>
                                                    <p>Flat 20, Reynolds Neck, NY</p>
                                                </td>
                                                <td>
                                                    <p>+(22) 65_458_859</p>
                                                </td>
                                                <td>
                                                    <p>22 Yrs</p>
                                                </td>
                                                <td>
                                                    <p>AB+</p>
                                                </td>
                                                <td>
                                                    <span class="accept"><i class="fas fa-pencil-alt"></i>Edit</span>
                                                </td>
                                                <td>
                                                    <span class="cancel"><i class="fas fa-times"></i>Cancel</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="name-box">
                                                        <figure class="image"><img src="assets/images/resource/patient-7.png" alt=""></figure>
                                                        <h5>Leroy Anderson</h5>
                                                    </div>
                                                </td>
                                                <td>
                                                    <p>Male</p>
                                                </td>
                                                <td>
                                                    <p>Flat 20, Reynolds Neck, NY</p>
                                                </td>
                                                <td>
                                                    <p>+(22) 65_458_850</p>
                                                </td>
                                                <td>
                                                    <p>32 Yrs</p>
                                                </td>
                                                <td>
                                                    <p>A-</p>
                                                </td>
                                                <td>
                                                    <span class="accept"><i class="fas fa-pencil-alt"></i>Edit</span>
                                                </td>
                                                <td>
                                                    <span class="cancel"><i class="fas fa-times"></i>Cancel</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="name-box">
                                                        <figure class="image"><img src="assets/images/resource/patient-8.png" alt=""></figure>
                                                        <h5>Amelia Anna</h5>
                                                    </div>
                                                </td>
                                                <td>
                                                    <p>Female</p>
                                                </td>
                                                <td>
                                                    <p>Flat 20, Reynolds Neck, NY</p>
                                                </td>
                                                <td>
                                                    <p>+(22) 65_458_851</p>
                                                </td>
                                                <td>
                                                    <p>27 Yrs</p>
                                                </td>
                                                <td>
                                                    <p>O+</p>
                                                </td>
                                                <td>
                                                    <span class="accept"><i class="fas fa-pencil-alt"></i>Edit</span>
                                                </td>
                                                <td>
                                                    <span class="cancel"><i class="fas fa-times"></i>Cancel</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="name-box">
                                                        <figure class="image"><img src="assets/images/resource/patient-9.png" alt=""></figure>
                                                        <h5>Terry Bradshaw</h5>
                                                    </div>
                                                </td>
                                                <td>
                                                    <p>Male</p>
                                                </td>
                                                <td>
                                                    <p>Flat 20, Reynolds Neck, NY</p>
                                                </td>
                                                <td>
                                                    <p>+(22) 65_458_852</p>
                                                </td>
                                                <td>
                                                    <p>29 Yrs</p>
                                                </td>
                                                <td>
                                                    <p>AB-</p>
                                                </td>
                                                <td>
                                                    <span class="accept"><i class="fas fa-pencil-alt"></i>Edit</span>
                                                </td>
                                                <td>
                                                    <span class="cancel"><i class="fas fa-times"></i>Cancel</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="name-box">
                                                        <figure class="image"><img src="assets/images/resource/patient-10.png" alt=""></figure>
                                                        <h5>Bryan Adams</h5>
                                                    </div>
                                                </td>
                                                <td>
                                                    <p>Male</p>
                                                </td>
                                                <td>
                                                    <p>Flat 20, Reynolds Neck, NY</p>
                                                </td>
                                                <td>
                                                    <p>+(22) 65_458_853</p>
                                                </td>
                                                <td>
                                                    <p>42 Yrs</p>
                                                </td>
                                                <td>
                                                    <p>B+</p>
                                                </td>
                                                <td>
                                                    <span class="accept"><i class="fas fa-pencil-alt"></i>Edit</span>
                                                </td>
                                                <td>
                                                    <span class="cancel"><i class="fas fa-times"></i>Cancel</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="name-box">
                                                        <figure class="image"><img src="assets/images/resource/patient-11.png" alt=""></figure>
                                                        <h5>Fran Allison</h5>
                                                    </div>
                                                </td>
                                                <td>
                                                    <p>Female</p>
                                                </td>
                                                <td>
                                                    <p>Flat 20, Reynolds Neck, NY</p>
                                                </td>
                                                <td>
                                                    <p>+(22) 65_458_854</p>
                                                </td>
                                                <td>
                                                    <p>25 Yrs</p>
                                                </td>
                                                <td>
                                                    <p>O-</p>
                                                </td>
                                                <td>
                                                    <span class="accept"><i class="fas fa-pencil-alt"></i>Edit</span>
                                                </td>
                                                <td>
                                                    <span class="cancel"><i class="fas fa-times"></i>Cancel</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="name-box">
                                                        <figure class="image"><img src="assets/images/resource/patient-12.png" alt=""></figure>
                                                        <h5>Paul Albert</h5>
                                                    </div>
                                                </td>
                                                <td>
                                                    <p>Male</p>
                                                </td>
                                                <td>
                                                    <p>Flat 20, Reynolds Neck, NY</p>
                                                </td>
                                                <td>
                                                    <p>+(22) 65_458_855</p>
                                                </td>
                                                <td>
                                                    <p>30 Yrs</p>
                                                </td>
                                                <td>
                                                    <p>AB-</p>
                                                </td>
                                                <td>
                                                    <span class="accept"><i class="fas fa-pencil-alt"></i>Edit</span>
                                                </td>
                                                <td>
                                                    <span class="cancel"><i class="fas fa-times"></i>Cancel</span>
                                                </td>
                                            </tr>
                                        </tbody>    
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="pagination-wrapper">
                            <ul class="pagination">
                                <li><a href="clinic-1.html" class="current">1</a></li>
                                <li><a href="clinic-1.html">2</a></li>
                                <li><a href="clinic-1.html">3</a></li>
                                <li><a href="clinic-1.html"><i class="icon-Arrow-Right"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
</section>
<!-- doctors-dashboard -->
