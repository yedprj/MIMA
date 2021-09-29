<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="include/dashHeader.jsp"></jsp:include>    
    
<section class="doctors-dashboard bg-color-3">
	<!-- 왼쪽사이드 메뉴바 연결 -->
	<jsp:include page="include/sideDash.jsp"></jsp:include>
	
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
