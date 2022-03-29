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
			
			<c:forEach var="postDetail" items="${ postList }">
			<div class="d-flex justify-content-center pt-5">
			
				<!-- 게시물 -->
				<div class="post-box bg-white">
				
					<!-- 게시물 헤더: 게시물 작성자 정보, 삭제 버튼 -->
					<div class="post-header d-flex justify-content-between">
						<div class="d-flex align-items-center">
							<span class="post-header-img text-secondary mt-2 ml-3"><i class="bi bi-circle-fill"></i></span>
							<span class="post-header-loginId ml-2"><b>${ postDetail.post.loginId }</b></span>
						</div>
						<div class="d-flex align-items-center">
						<!-- 게시물 삭제 -->
						<c:if test="${ postDetail.post.userId eq userId }">
							<button data-post-id="${ postDetail.post.id }" class="delete-btn btn btn-sm btn-danger">삭제</button>
						</c:if>	
							<span class="more-icon text-dark mr-3"><i class="bi bi-three-dots-vertical"></i></span>
						</div>	
					</div>
					
					<!-- 사진 -->
					<img src="${ postDetail.post.imagePath }" class="img-box">
					
					<!-- 좋아요 -->
					<div class="like mt-1 ml-3">
						<a href="#" data-post-id="${ postDetail.post.id }" class="like-btn"><i class="bi bi-heart like-icon text-dark"></i></a>
						<a href="#" data-post-id="${ postDetail.post.id }" class="delete-like-btn"><i class="bi bi-heart-fill delete-like-icon text-danger"></i></a>
						<b class="like-count">좋아요 ${ postDetail.likeCount }개</b>
					</div>
					
					<!-- 게시물 내용 -->
					<div class="content-box ml-3 my-3">
						<b>${ postDetail.post.loginId }</b>
						<span>${ postDetail.post.content }</span>
					</div>
					
					<hr class="col-11">
					
					<!-- 댓글 내용 -->
					<div class="comment-box mt-1 ml-3">
					<c:forEach var="comment" items="${ postDetail.commentList }">
						<div>
							<b>${ comment.loginId }</b> <span>${ comment.comment }</span>
						</div>
					</c:forEach>
					</div>
					
					<!-- 작성 시간 -->
					<div class="upload-time mt-1 ml-3">
						<span class="text-secondary"><fmt:formatDate value="${ postDetail.post.createdAt }" pattern="yyyy년 M월 dd일 HH시 m분 s초" /></span>
					</div>
					
					<!-- 댓글 달기 -->
					<div class="d-flex mt-2 mb-3 ml-3">
						<span class="comment-icon pb-2"><i class="bi bi-chat"></i></span>
						<div class="input-group col-11">
							<input type="text" id="commentInput${ postDetail.post.id }" class="form-control" placeholder="댓글 달기">
							<button data-post-id="${ postDetail.post.id }" class="comment-btn btn btn-outline-secondary" type="button">작성</button>
						</div>
					</div>
				</div>
			</div>
			</c:forEach>
			
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	
	</div>
	
	
	<script>
	
		$(document).ready(function(){
			
			
			// 삭제 버튼
			$(".delete-btn").on("click", function(){
				
				let id = $(this).data("post-id");
				
				$.ajax({
					
					type:"get"
					, url:"/post/delete"
					, data:{"postId":id}
					, success:function(data) {
						
						if (data.result == "success") {
							alert("삭제되었습니다.");
							location.reload();
						} else {
							alert("삭제 실패");
						}
						
					}
					, error:function() {
						alert("삭제 통신 에러");
					}
					
				});
				
			});
			
			
			// 댓글 달기 버튼
			$(".comment-btn").on("click", function(){
				
				let postId = $(this).data("post-id");
				let comment = $("#commentInput" + postId).val().trim();
				
				if (comment == "") {
					alert("댓글을 입력하세요.");
					return;
				}
				
				$.ajax({
					
					type:"post"
					, url:"/post/comment/create"
					, data:{"postId":postId, "comment":comment}
					, success:function(data){
					
						if (data.result == "success") {
							location.reload();
						} else {
							alert("댓글 달기 실패");
						}
						
					}
					, error:function(){
						alert("댓글 달기 통신 에러");
					}
						
				});
				
			});
			
			
			// 좋아요 중복 확인

			
			
			// 좋아요 버튼
			$(".like-btn").on("click", function(e){
				
				e.preventDefault();
				
				let postId = $(this).data("post-id");
				
				$.ajax({
					
					type:"get"
					, url:"/post/like"
					, data:{"postId":postId}
					, success:function(data){
						
						if (data.result == "success") {
							alert("좋아요 성공");
							location.reload();
						} else {
							alert("좋아요 실패");
						}
						
					}
					, error:function(){
						alert("좋아요 통신 에러");
					}
					
				});
				
			});
			
			
			// 좋아요 취소 버튼
			$(".delete-like-btn").on("click", function(e){
				
				e.preventDefault();
				
				let postId = $(this).data("post-id");
				
				$.ajax({
					
					type:"get"
					, url:"/post/like_delete"
					, data:{"postId":postId}
					, success:function(data){
						
						if (data.result == "success") {
							alert("좋아요 취소 성공");
							location.reload();
						} else {
							alert("좋아요 취소 실패");
						}
						
					}
					, error:function(){
						alert("좋아요 통신 에러");
					}
					
				});
				
			});
			
			
		});
	
	</script>
	

</body>
</html>