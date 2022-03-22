<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Timeline</title>

	<!-- jquery cdn -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	
	<!-- bootstrap CDN link -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	
	<!-- stylesheet -->
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">

</head>
<body>
	
	<div id="wrap">
	
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		
		<section class="post-section pb-5">
			
			<div class="d-flex justify-content-center pt-5">
				<div class="post-box bg-white">
					<div class="post-header d-flex justify-content-between">
						<div class="d-flex align-items-center">
							<span class="post-header-img text-secondary ml-3"><i class="bi bi-circle-fill"></i></span>
							<h5 class="ml-2 mt-1">ffaikrw</h5>
						</div>
						<div class="d-flex align-items-center">
							<span class="more-icon text-dark mr-3"><i class="bi bi-three-dots-vertical"></i></span>
						</div>	
					</div>
					<div class="img-box bg-info"></div>
					<div class="like ml-3">
						<span class="like-btn"><i class="bi bi-heart"></i></span>
						<b class="like-count">좋아요 10개</b>
					</div>
					<div class="comment-box ml-3">
						<div class="mt-1">
							<b>jhwn0202</b> <span>댓글1</span>
						</div>
						<div class="mt-1">
							<b>cccc</b> <span>댓글2</span>
						</div>
					</div>
					<div class="upload-time mt-1 ml-3">
						<span class="text-secondary">2022년 3월 22일 오후 5시 11분</span>
					</div>
					<div class="d-flex mt-2 mb-3 ml-3">
						<span class="comment-icon pb-2"><i class="bi bi-chat"></i></span>
						<div class="input-group col-11">
							<input type="text" class="form-control" placeholder="댓글 달기">
							<button class="btn btn-outline-secondary" type="button">작성</button>
						</div>
					</div>
				</div>
			</div>
			
			<div class="d-flex justify-content-center pt-5">
				<div class="post-box bg-white">
					<div class="post-header d-flex justify-content-between">
						<div class="d-flex align-items-center">
							<span class="post-header-img text-secondary ml-3"><i class="bi bi-circle-fill"></i></span>
							<h5 class="ml-2 mt-1">jhwn0202</h5>
						</div>
						<div class="d-flex align-items-center">
							<span class="more-icon text-dark mr-3"><i class="bi bi-three-dots-vertical"></i></span>
						</div>	
					</div>
					<div class="img-box bg-success"></div>
					<div class="like ml-3">
						<span class="like-btn"><i class="bi bi-heart"></i></span>
						<b class="like-count">좋아요 10개</b>
					</div>
					<div class="comment-box ml-3">
						<div class="mt-1">
							<b>jhwn0202</b> <span>댓글1</span>
						</div>
						<div class="mt-1">
							<b>cccc</b> <span>댓글2</span>
						</div>
					</div>
					<div class="upload-time mt-1 ml-3">
						<span class="text-secondary">2022년 3월 22일 오후 5시 11분</span>
					</div>
					<div class="d-flex mt-2 mb-3 ml-3">
						<span class="comment-icon pb-2"><i class="bi bi-chat"></i></span>
						<div class="input-group col-11">
							<input type="text" class="form-control" placeholder="댓글 달기">
							<button class="btn btn-outline-secondary" type="button">작성</button>
						</div>
					</div>
				</div>
			</div>
			
			<div class="d-flex justify-content-center pt-5">
				<div class="post-box bg-white">
					<div class="post-header d-flex justify-content-between">
						<div class="d-flex align-items-center">
							<span class="post-header-img text-secondary ml-3"><i class="bi bi-circle-fill"></i></span>
							<h5 class="ml-2 mt-1">cccc</h5>
						</div>
						<div class="d-flex align-items-center">
							<span class="more-icon text-dark mr-3"><i class="bi bi-three-dots-vertical"></i></span>
						</div>	
					</div>
					<div class="img-box bg-warning"></div>
					<div class="like ml-3">
						<span class="like-btn"><i class="bi bi-heart"></i></span>
						<b class="like-count">좋아요 10개</b>
					</div>
					<div class="comment-box ml-3">
						<div class="mt-1">
							<b>jhwn0202</b> <span>댓글1</span>
						</div>
						<div class="mt-1">
							<b>cccc</b> <span>댓글2</span>
						</div>
					</div>
					<div class="upload-time mt-1 ml-3">
						<span class="text-secondary">2022년 3월 22일 오후 5시 11분</span>
					</div>
					<div class="d-flex mt-2 mb-3 ml-3">
						<span class="comment-icon pb-2"><i class="bi bi-chat"></i></span>
						<div class="input-group col-11">
							<input type="text" class="form-control" placeholder="댓글 달기">
							<button class="btn btn-outline-secondary" type="button">작성</button>
						</div>
					</div>
				</div>
			</div>
			
			
			
			
		
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	
	
	</div>
	

</body>
</html>