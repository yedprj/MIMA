<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


	<div class="boxed_wrapper">

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
						<h1>Clinic Grid</h1>
					</div>
				</div>
			</div>
			<div class="lower-content">
				<div class="auto-container">
					<ul class="bread-crumb clearfix">
						<li><a href="index.html">Home</a></li>
						<li>Clinic Grid</li>
					</ul>
				</div>
			</div>
		</section>
		<!--page-title-two end-->


		<div class="select-field bg-color-3">
			<div class="auto-container">
				<div class="content-box">
					<div class="form-inner clearfix">
						<form action="index.html" method="post">
							<div class="form-group clearfix">
								<select class="wide">
									<option data-display="Select Location">Select Location</option>
									<option value="1">California</option>
									<option value="2">New York</option>
									<option value="3">Sun Francis</option>
									<option value="4">Shicago</option>
								</select> <input type="text" name="name"
									placeholder="Ex. Name, Specialization..." required="">
								<button type="submit">
									<i class="icon-Arrow-Right"></i>
								</button>
							</div>
						</form>
						<ul class="select-box clearfix">
							<li>
								<div class="single-checkbox">
									<input type="radio" name="check-box" id="check1"> <label
										for="check1"><span></span>All</label>
								</div>
							</li>
							<li>
								<div class="single-checkbox">
									<input type="radio" name="check-box" id="check2"> <label
										for="check2"><span></span>Doctor</label>
								</div>
							</li>
							<li>
								<div class="single-checkbox">
									<input type="radio" name="check-box" id="check3" checked="">
									<label for="check3"><span></span>Clinic</label>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>


		<!-- clinic-section -->
		<section class="clinic-section">
			<div class="auto-container">
				<div class="row clearfix">
					<div class="col-lg-8 col-md-12 col-sm-12 content-side">
						<div class="item-shorting clearfix">
							<div class="left-column pull-left">
								<h3>Showing 1-6 of 20 Results</h3>
							</div>
							<div class="right-column pull-right clearfix">
								<div class="short-box clearfix">
									<div class="select-box">
										<select class="wide">
											<option data-display="Sort by">Sort by</option>
											<option value="1">Cardiology</option>
											<option value="2">Nurology</option>
											<option value="4">Pragnency</option>
										</select>
									</div>
								</div>
								<div class="menu-box">
									<button class="list-view">
										<i class="icon-List"></i>
									</button>
									<button class="grid-view on">
										<i class="icon-Grid"></i>
									</button>
								</div>
							</div>
						</div>
						<div class="wrapper grid">
							<div class="clinic-list-content">
								<div class="clinic-block-one">
									<div class="inner-box">
										<div class="pattern">
											<div class="pattern-1"
												style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-24.png);"></div>
											<div class="pattern-2"
												style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-25.png);"></div>
										</div>
										<figure class="image-box">
											<img
												src="${pageContext.request.contextPath}/resources/assets/images/clinic/clinic-1.png"
												alt="">
										</figure>
										<div class="content-box">
											<div class="like-box">
												<a href="clinic-details.html"><i class="far fa-heart"></i></a>
											</div>
											<ul class="name-box clearfix">
												<li class="name"><h3>
														<a href="clinic-details.html">Memorial Hospital</a>
													</h3></li>
												<li><i class="icon-Trust-1"></i></li>
												<li><i class="icon-Trust-2"></i></li>
											</ul>
											<span class="designation">It’s all about care</span>
											<div class="text">
												<p>Lorem ipsum dolor sit amet consectur adipisc elit sed
													eiusmod tempor incididunt labore dolore magna.</p>
											</div>
											<div class="rating-box clearfix">
												<ul class="rating clearfix">
													<li><i class="icon-Star"></i></li>
													<li><i class="icon-Star"></i></li>
													<li><i class="icon-Star"></i></li>
													<li><i class="icon-Star"></i></li>
													<li><i class="icon-Star"></i></li>
													<li><a href="clinic-details.html">(17)</a></li>
												</ul>
												<div class="link">
													<a href="clinic-details.html">24/7 Available</a>
												</div>
											</div>
											<div class="location-box">
												<p>
													<i class="fas fa-map-marker-alt"></i>G87P, Birmingham, UK
												</p>
											</div>
											<div class="btn-box">
												<a href="clinic-details.html">Visit Now</a>
											</div>
										</div>
									</div>
								</div>
								<div class="clinic-block-one">
									<div class="inner-box">
										<div class="pattern">
											<div class="pattern-1"
												style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-24.png);"></div>
											<div class="pattern-2"
												style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-25.png);"></div>
										</div>
										<figure class="image-box">
											<img
												src="${pageContext.request.contextPath}/resources/assets/images/clinic/clinic-2.png"
												alt="">
										</figure>
										<div class="content-box">
											<div class="like-box">
												<a href="clinic-details.html"><i class="far fa-heart"></i></a>
											</div>
											<ul class="name-box clearfix">
												<li class="name"><h3>
														<a href="clinic-details.html">Potsdam Hospital</a>
													</h3></li>
												<li><i class="icon-Trust-1"></i></li>
												<li><i class="icon-Trust-2"></i></li>
											</ul>
											<span class="designation">Best healthcare center</span>
											<div class="text">
												<p>Lorem ipsum dolor sit amet consectur adipisc elit sed
													eiusmod tempor incididunt labore dolore magna.</p>
											</div>
											<div class="rating-box clearfix">
												<ul class="rating clearfix">
													<li><i class="icon-Star"></i></li>
													<li><i class="icon-Star"></i></li>
													<li><i class="icon-Star"></i></li>
													<li><i class="icon-Star"></i></li>
													<li><i class="icon-Star"></i></li>
													<li><a href="clinic-details.html">(21)</a></li>
												</ul>
												<div class="link">
													<a href="clinic-details.html">24/7 Available</a>
												</div>
											</div>
											<div class="location-box">
												<p>
													<i class="fas fa-map-marker-alt"></i>G87P, Birmingham, UK
												</p>
											</div>
											<div class="btn-box">
												<a href="clinic-details.html">Visit Now</a>
											</div>
										</div>
									</div>
								</div>
								<div class="clinic-block-one">
									<div class="inner-box">
										<div class="pattern">
											<div class="pattern-1"
												style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-24.png);"></div>
											<div class="pattern-2"
												style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-25.png);"></div>
										</div>
										<figure class="image-box">
											<img
												src="${pageContext.request.contextPath}/resources/assets/images/clinic/clinic-3.png"
												alt="">
										</figure>
										<div class="content-box">
											<div class="like-box">
												<a href="clinic-details.html"><i class="far fa-heart"></i></a>
											</div>
											<ul class="name-box clearfix">
												<li class="name"><h3>
														<a href="clinic-details.html">Hepburn Medical</a>
													</h3></li>
												<li><i class="icon-Trust-1"></i></li>
												<li></li>
											</ul>
											<span class="designation">Change your lifestyle</span>
											<div class="text">
												<p>Lorem ipsum dolor sit amet consectur adipisc elit sed
													eiusmod tempor incididunt labore dolore magna.</p>
											</div>
											<div class="rating-box clearfix">
												<ul class="rating clearfix">
													<li><i class="icon-Star"></i></li>
													<li><i class="icon-Star"></i></li>
													<li><i class="icon-Star"></i></li>
													<li><i class="icon-Star"></i></li>
													<li><i class="icon-Star"></i></li>
													<li><a href="clinic-details.html">(32)</a></li>
												</ul>
												<div class="link">
													<a href="clinic-details.html">24/7 Available</a>
												</div>
											</div>
											<div class="location-box">
												<p>
													<i class="fas fa-map-marker-alt"></i>G87P, Birmingham, UK
												</p>
											</div>
											<div class="btn-box">
												<a href="clinic-details.html">Visit Now</a>
											</div>
										</div>
									</div>
								</div>
								<div class="clinic-block-one">
									<div class="inner-box">
										<div class="pattern">
											<div class="pattern-1"
												style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-24.png);"></div>
											<div class="pattern-2"
												style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-25.png);"></div>
										</div>
										<figure class="image-box">
											<img
												src="${pageContext.request.contextPath}/resources/assets/images/clinic/clinic-4.png"
												alt="">
										</figure>
										<div class="content-box">
											<div class="like-box">
												<a href="clinic-details.html"><i class="far fa-heart"></i></a>
											</div>
											<ul class="name-box clearfix">
												<li class="name"><h3>
														<a href="clinic-details.html">Queens Hospital</a>
													</h3></li>
												<li></li>
												<li><i class="icon-Trust-2"></i></li>
											</ul>
											<span class="designation">It’s all about care</span>
											<div class="text">
												<p>Lorem ipsum dolor sit amet consectur adipisc elit sed
													eiusmod tempor incididunt labore dolore magna.</p>
											</div>
											<div class="rating-box clearfix">
												<ul class="rating clearfix">
													<li><i class="icon-Star"></i></li>
													<li><i class="icon-Star"></i></li>
													<li><i class="icon-Star"></i></li>
													<li><i class="icon-Star"></i></li>
													<li><i class="icon-Star"></i></li>
													<li><a href="clinic-details.html">(20)</a></li>
												</ul>
												<div class="link">
													<a href="clinic-details.html">24/7 Available</a>
												</div>
											</div>
											<div class="location-box">
												<p>
													<i class="fas fa-map-marker-alt"></i>G87P, Birmingham, UK
												</p>
											</div>
											<div class="btn-box">
												<a href="clinic-details.html">Visit Now</a>
											</div>
										</div>
									</div>
								</div>
								<div class="clinic-block-one">
									<div class="inner-box">
										<div class="pattern">
											<div class="pattern-1"
												style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-24.png);"></div>
											<div class="pattern-2"
												style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-25.png);"></div>
										</div>
										<figure class="image-box">
											<img
												src="${pageContext.request.contextPath}/resources/assets/images/clinic/clinic-5.png"
												alt="">
										</figure>
										<div class="content-box">
											<div class="like-box">
												<a href="clinic-details.html"><i class="far fa-heart"></i></a>
											</div>
											<ul class="name-box clearfix">
												<li class="name"><h3>
														<a href="clinic-details.html">Highland Hospital</a>
													</h3></li>
												<li><i class="icon-Trust-1"></i></li>
												<li><i class="icon-Trust-2"></i></li>
											</ul>
											<span class="designation">Best healthcare center</span>
											<div class="text">
												<p>Lorem ipsum dolor sit amet consectur adipisc elit sed
													eiusmod tempor incididunt labore dolore magna.</p>
											</div>
											<div class="rating-box clearfix">
												<ul class="rating clearfix">
													<li><i class="icon-Star"></i></li>
													<li><i class="icon-Star"></i></li>
													<li><i class="icon-Star"></i></li>
													<li><i class="icon-Star"></i></li>
													<li><i class="icon-Star"></i></li>
													<li><a href="clinic-details.html">(35)</a></li>
												</ul>
												<div class="link">
													<a href="clinic-details.html">24/7 Available</a>
												</div>
											</div>
											<div class="location-box">
												<p>
													<i class="fas fa-map-marker-alt"></i>G87P, Birmingham, UK
												</p>
											</div>
											<div class="btn-box">
												<a href="clinic-details.html">Visit Now</a>
											</div>
										</div>
									</div>
								</div>
								<div class="clinic-block-one">
									<div class="inner-box">
										<div class="pattern">
											<div class="pattern-1"
												style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-24.png);"></div>
											<div class="pattern-2"
												style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-25.png);"></div>
										</div>
										<figure class="image-box">
											<img
												src="${pageContext.request.contextPath}/resources/assets/images/clinic/clinic-6.png"
												alt="">
										</figure>
										<div class="content-box">
											<div class="like-box">
												<a href="clinic-details.html"><i class="far fa-heart"></i></a>
											</div>
											<ul class="name-box clearfix">
												<li class="name"><h3>
														<a href="clinic-details.html">Medical Center</a>
													</h3></li>
												<li><i class="icon-Trust-1"></i></li>
												<li></li>
											</ul>
											<span class="designation">Change your lifestyle</span>
											<div class="text">
												<p>Lorem ipsum dolor sit amet consectur adipisc elit sed
													eiusmod tempor incididunt labore dolore magna.</p>
											</div>
											<div class="rating-box clearfix">
												<ul class="rating clearfix">
													<li><i class="icon-Star"></i></li>
													<li><i class="icon-Star"></i></li>
													<li><i class="icon-Star"></i></li>
													<li><i class="icon-Star"></i></li>
													<li><i class="icon-Star"></i></li>
													<li><a href="clinic-details.html">(35)</a></li>
												</ul>
												<div class="link">
													<a href="clinic-details.html">24/7 Available</a>
												</div>
											</div>
											<div class="location-box">
												<p>
													<i class="fas fa-map-marker-alt"></i>G87P, Birmingham, UK
												</p>
											</div>
											<div class="btn-box">
												<a href="clinic-details.html">Visit Now</a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="clinic-grid-content grid-item">
								<div class="row clearfix">
									<div class="col-lg-6 col-md-6 col-sm-12 team-block">
										<div class="team-block-three">
											<div class="inner-box">
												<figure class="image-box">
													<img
														src="${pageContext.request.contextPath}/resources/assets/images/clinic/clinic-1.jpg"
														alt="">
													<a href="clinic-details.html"><i class="far fa-heart"></i></a>
												</figure>
												<div class="lower-content">
													<ul class="name-box clearfix">
														<li class="name"><h3>
																<a href="clinic-details.html">Memorial Hospital</a>
															</h3></li>
														<li><i class="icon-Trust-1"></i></li>
														<li></li>
													</ul>
													<span class="designation">It’s all about care</span>
													<div class="rating-box clearfix">
														<ul class="rating clearfix">
															<li><i class="icon-Star"></i></li>
															<li><i class="icon-Star"></i></li>
															<li><i class="icon-Star"></i></li>
															<li><i class="icon-Star"></i></li>
															<li><i class="icon-Star"></i></li>
															<li><a href="clinic-details.html">(32)</a></li>
														</ul>
													</div>
													<div class="location-box">
														<p>
															<i class="fas fa-map-marker-alt"></i>G87P, Birmingham, UK
														</p>
													</div>
													<div class="lower-box clearfix">
														<span class="text">24/7 Available</span> <a
															href="clinic-details.html">Book Now</a>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-sm-12 team-block">
										<div class="team-block-three">
											<div class="inner-box">
												<figure class="image-box">
													<img
														src="${pageContext.request.contextPath}/resources/assets/images/clinic/clinic-2.jpg"
														alt="">
													<a href="clinic-details.html"><i class="far fa-heart"></i></a>
												</figure>
												<div class="lower-content">
													<ul class="name-box clearfix">
														<li class="name"><h3>
																<a href="clinic-details.html">Potsdam Hospital</a>
															</h3></li>
														<li><i class="icon-Trust-1"></i></li>
														<li><i class="icon-Trust-2"></i></li>
													</ul>
													<span class="designation">Best healthcare center</span>
													<div class="rating-box clearfix">
														<ul class="rating clearfix">
															<li><i class="icon-Star"></i></li>
															<li><i class="icon-Star"></i></li>
															<li><i class="icon-Star"></i></li>
															<li><i class="icon-Star"></i></li>
															<li><i class="icon-Star"></i></li>
															<li><a href="clinic-details.html">(17)</a></li>
														</ul>
													</div>
													<div class="location-box">
														<p>
															<i class="fas fa-map-marker-alt"></i>G87P, Birmingham, UK
														</p>
													</div>
													<div class="lower-box clearfix">
														<span class="text">24/7 Available</span> <a
															href="clinic-details.html">Book Now</a>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-sm-12 team-block">
										<div class="team-block-three">
											<div class="inner-box">
												<figure class="image-box">
													<img
														src="${pageContext.request.contextPath}/resources/assets/images/clinic/clinic-3.jpg"
														alt="">
													<a href="clinic-details.html"><i class="far fa-heart"></i></a>
												</figure>
												<div class="lower-content">
													<ul class="name-box clearfix">
														<li class="name"><h3>
																<a href="clinic-details.html">Hepburn Medical</a>
															</h3></li>
														<li><i class="icon-Trust-1"></i></li>
														<li><i class="icon-Trust-2"></i></li>
													</ul>
													<span class="designation">Change your lifestyle</span>
													<div class="rating-box clearfix">
														<ul class="rating clearfix">
															<li><i class="icon-Star"></i></li>
															<li><i class="icon-Star"></i></li>
															<li><i class="icon-Star"></i></li>
															<li><i class="icon-Star"></i></li>
															<li><i class="icon-Star"></i></li>
															<li><a href="clinic-details.html">(25)</a></li>
														</ul>
													</div>
													<div class="location-box">
														<p>
															<i class="fas fa-map-marker-alt"></i>G87P, Birmingham, UK
														</p>
													</div>
													<div class="lower-box clearfix">
														<span class="text">24/7 Available</span> <a
															href="clinic-details.html">Book Now</a>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-sm-12 team-block">
										<div class="team-block-three">
											<div class="inner-box">
												<figure class="image-box">
													<img
														src="${pageContext.request.contextPath}/resources/assets/images/clinic/clinic-4.jpg"
														alt="">
													<a href="clinic-details.html"><i class="far fa-heart"></i></a>
												</figure>
												<div class="lower-content">
													<ul class="name-box clearfix">
														<li class="name"><h3>
																<a href="clinic-details.html">Queens Hospital</a>
															</h3></li>
														<li><i class="icon-Trust-1"></i></li>
														<li></li>
													</ul>
													<span class="designation">It’s all about care</span>
													<div class="rating-box clearfix">
														<ul class="rating clearfix">
															<li><i class="icon-Star"></i></li>
															<li><i class="icon-Star"></i></li>
															<li><i class="icon-Star"></i></li>
															<li><i class="icon-Star"></i></li>
															<li><i class="icon-Star"></i></li>
															<li><a href="clinic-details.html">(10)</a></li>
														</ul>
													</div>
													<div class="location-box">
														<p>
															<i class="fas fa-map-marker-alt"></i>G87P, Birmingham, UK
														</p>
													</div>
													<div class="lower-box clearfix">
														<span class="text">24/7 Available</span> <a
															href="clinic-details.html">Book Now</a>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-sm-12 team-block">
										<div class="team-block-three">
											<div class="inner-box">
												<figure class="image-box">
													<img
														src="${pageContext.request.contextPath}/resources/assets/images/clinic/clinic-5.jpg"
														alt="">
													<a href="clinic-details.html"><i class="far fa-heart"></i></a>
												</figure>
												<div class="lower-content">
													<ul class="name-box clearfix">
														<li class="name"><h3>
																<a href="clinic-details.html">Highland Hospital</a>
															</h3></li>
														<li></li>
														<li><i class="icon-Trust-2"></i></li>
													</ul>
													<span class="designation">Best healthcare center</span>
													<div class="rating-box clearfix">
														<ul class="rating clearfix">
															<li><i class="icon-Star"></i></li>
															<li><i class="icon-Star"></i></li>
															<li><i class="icon-Star"></i></li>
															<li><i class="icon-Star"></i></li>
															<li><i class="icon-Star"></i></li>
															<li><a href="clinic-details.html">(17)</a></li>
														</ul>
													</div>
													<div class="location-box">
														<p>
															<i class="fas fa-map-marker-alt"></i>G87P, Birmingham, UK
														</p>
													</div>
													<div class="lower-box clearfix">
														<span class="text">24/7 Available</span> <a
															href="clinic-details.html">Book Now</a>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-sm-12 team-block">
										<div class="team-block-three">
											<div class="inner-box">
												<figure class="image-box">
													<img
														src="${pageContext.request.contextPath}/resources/assets/images/clinic/clinic-6.jpg"
														alt="">
													<a href="clinic-details.html"><i class="far fa-heart"></i></a>
												</figure>
												<div class="lower-content">
													<ul class="name-box clearfix">
														<li class="name"><h3>
																<a href="clinic-details.html">Jacobi Medical</a>
															</h3></li>
														<li><i class="icon-Trust-1"></i></li>
														<li><i class="icon-Trust-2"></i></li>
													</ul>
													<span class="designation">Change your lifestyle</span>
													<div class="rating-box clearfix">
														<ul class="rating clearfix">
															<li><i class="icon-Star"></i></li>
															<li><i class="icon-Star"></i></li>
															<li><i class="icon-Star"></i></li>
															<li><i class="icon-Star"></i></li>
															<li><i class="icon-Star"></i></li>
															<li><a href="clinic-details.html">(30)</a></li>
														</ul>
													</div>
													<div class="location-box">
														<p>
															<i class="fas fa-map-marker-alt"></i>G87P, Birmingham, UK
														</p>
													</div>
													<div class="lower-box clearfix">
														<span class="text">24/7 Available</span> <a
															href="clinic-details.html">Book Now</a>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-sm-12 team-block">
										<div class="team-block-three">
											<div class="inner-box">
												<figure class="image-box">
													<img
														src="${pageContext.request.contextPath}/resources/assets/images/clinic/clinic-7.jpg"
														alt="">
													<a href="clinic-details.html"><i class="far fa-heart"></i></a>
												</figure>
												<div class="lower-content">
													<ul class="name-box clearfix">
														<li class="name"><h3>
																<a href="clinic-details.html">St. Mary's Hospital</a>
															</h3></li>
														<li><i class="icon-Trust-1"></i></li>
														<li><i class="icon-Trust-2"></i></li>
													</ul>
													<span class="designation">It’s all about care</span>
													<div class="rating-box clearfix">
														<ul class="rating clearfix">
															<li><i class="icon-Star"></i></li>
															<li><i class="icon-Star"></i></li>
															<li><i class="icon-Star"></i></li>
															<li><i class="icon-Star"></i></li>
															<li><i class="icon-Star"></i></li>
															<li><a href="clinic-details.html">(12)</a></li>
														</ul>
													</div>
													<div class="location-box">
														<p>
															<i class="fas fa-map-marker-alt"></i>G87P, Birmingham, UK
														</p>
													</div>
													<div class="lower-box clearfix">
														<span class="text">24/7 Available</span> <a
															href="clinic-details.html">Book Now</a>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-sm-12 team-block">
										<div class="team-block-three">
											<div class="inner-box">
												<figure class="image-box">
													<img
														src="${pageContext.request.contextPath}/resources/assets/images/clinic/clinic-8.jpg"
														alt="">
													<a href="clinic-details.html"><i class="far fa-heart"></i></a>
												</figure>
												<div class="lower-content">
													<ul class="name-box clearfix">
														<li class="name"><h3>
																<a href="clinic-details.html">Unity Hospital</a>
															</h3></li>
														<li><i class="icon-Trust-1"></i></li>
														<li><i class="icon-Trust-2"></i></li>
													</ul>
													<span class="designation">Best healthcare center</span>
													<div class="rating-box clearfix">
														<ul class="rating clearfix">
															<li><i class="icon-Star"></i></li>
															<li><i class="icon-Star"></i></li>
															<li><i class="icon-Star"></i></li>
															<li><i class="icon-Star"></i></li>
															<li><i class="icon-Star"></i></li>
															<li><a href="clinic-details.html">(05)</a></li>
														</ul>
													</div>
													<div class="location-box">
														<p>
															<i class="fas fa-map-marker-alt"></i>G87P, Birmingham, UK
														</p>
													</div>
													<div class="lower-box clearfix">
														<span class="text">24/7 Available</span> <a
															href="clinic-details.html">Book Now</a>
													</div>
												</div>
											</div>
										</div>
									</div>
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
					<div class="col-lg-4 col-md-12 col-sm-12 sidebar-side">
						<div class="map-inner ml-10">
							<div class="google-map" id="contact-google-map"
								data-map-lat="40.712776" data-map-lng="-74.005974"
								data-icon-path="${pageContext.request.contextPath}/resources/assets/images/icons/map-marker.png"
								data-map-title="Brooklyn, New York, United Kingdom"
								data-map-zoom="12"
								data-markers='{
                                    "marker-1": [40.712776, -74.005974, "<h4>Branch Office</h4><p>77/99 New York</p>","${pageContext.request.contextPath}/resources/assets/images/icons/map-marker.png"]
                                }'>

							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- clinic-section end -->
	</div>


	<!-- jequery plugins -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/product-filter.js"></script>

	<script>
		$(function() {

			postList();

		}); //end 

		//페이지 목록 조회
		function postList() {
			$.ajax({
				url : "postList",
				dataType : "json",
				success : function(datas) {
					$("#postContents").empty();
					$.each(datas, function(i, data) {
						$("<div id='"+data.postNo+"'>").append(
								$("<p>").html(data.contents)).appendTo(
								$("#postContents"));
					});
				}
			})
		} // 페이지목록 조회 end
	</script>

