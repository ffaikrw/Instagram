<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<header class="d-flex justify-content-between">
		<h2><a href="/post/timeline" class="header-logo text-dark font-weight-bold">Instagram</a></h2>
		<div class="header-icon d-flex align-items-center">
			<h2><a href="/post/timeline" class="text-dark"><i class="bi bi-house-door-fill"></i></a></h2>
			<h2 class="ml-3"><a href="/post/create_view"  class="text-dark"><i class="bi bi-plus-circle"></i></a></h2>
			<h2 class="text-dark ml-3"><i class="bi bi-heart"></i></h2>
		<c:if test="${ not empty userId }" >
			<h5 class="ml-3 pt-1">${ userLoginId }</h5>
			<h5 class="ml-3 pt-1"><a href="/user/sign_out" class="text-dark">로그아웃</a></h5>
		</c:if>
		</div>
	</header>