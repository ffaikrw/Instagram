<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<header class="d-flex justify-content-between">
		<h2><a href="/post/timeline" class="header-logo text-dark font-weight-bold">Instagram</a></h2>
		<div class="header-icon d-flex align-items-center">
			<h3><a href="/post/timeline" class="text-dark"><i class="bi bi-house-door-fill"></i></a></h3>
		<c:choose>
			<c:when test="${ not empty userId }" >
				<h3 class="ml-3"><a href="/post/create_view"  class="text-dark"><i class="bi bi-plus-circle"></i></a></h3>
				<h3 class="text-dark ml-3"><i class="bi bi-heart"></i></h3>
				<h5 class="ml-3 pt-1">
					<a href="#" data-toggle="modal" data-target="#loginIdModal" class="header-loginId mr-3 text-dark">
						${ userLoginId } 님
					</a>
				</h5>
			</c:when>
			<c:otherwise>
				<h5 class="ml-3 pt-1"><a href="/user/signin_view" class="text-dark">로그인/회원가입</a></h5>
			</c:otherwise>
		</c:choose>
		</div>
	</header>
	
	<!-- Modal -->
	<div class="modal fade" id="loginIdModal" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
			    <div class="modal-body text-center">
			    	<a href="/profile_view?userId=${ userId }" class="text-dark">프로필 보기</a>
			    </div>
			    <div class="logout-modal modal-body text-center">
			    	<a href="/user/sign_out" class="text-dark">로그아웃</a>
			    </div>
		    </div>
		</div>
	</div>