<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style>
tr:hover{
		color:blue;
		cursor:pointer;}
</style>

<div class="container">
	<div style="margin-top: 50px;">
		<h3 align = "center">전체 조회</h3>
		<hr>
	</div>
	<br>
	<div>
		<table class="table table-hover">
			<tr align="center">
				<th>번호</th>
				<th>과거진료기록</th>
				<th>자가진단표</th>
				<th>진료분야</th>
				<th>약배달</th>
				<th>등록일</th>
				<th>수정일</th>
			</tr>
			<c:forEach items="${list}" var="patients">
				<tr onclick="location.href='get?memberNo=${patients.memberNo}'">
					<td>${patients.memberNo }</td>
					<td>${patients.pastHx }</td>
					<td>${patients.preSelfAx }</td>
					<td>${patients.topic }</td>
					<td>${patients.medDelivery }</td>
					<td>${patients.regDate }</td>
					<td>${patients.editDate }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>
