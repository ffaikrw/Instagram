<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 상세화면</title>

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
		
			<!-- 게시물 헤더 -->
			<div class="userInfo d-flex align-items-center justify-content-center">
				<div class="profile-header ml-5 mt-3 text-center">
					<div class="userLoginId mb-2">
						<a href="/profile_view?userId=${ userPost.postDetail.post.userId }" class="userPostDetail-header text-dark font-weight-bold">
							${ userPost.postDetail.post.loginId }
						</a>
					</div>
				</div>
			</div>
		
			<!-- 게시물 -->
			<div class="d-flex justify-content-center">
				<div>
					<!-- 사진 -->
					<img src="${ userPost.postDetail.post.imagePath }" width="1000px">
					
					<div class="bg-white pb-3">
						<div class="d-flex justify-content-between">
							<!-- 좋아요 -->
							<div class="like mt-1 ml-3">
							<c:choose>
								<c:when test="${ userPost.postDetail.userLikeDuplicate }">
									<a href="#" data-post-id="${ userPost.postDetail.post.id }" class="delete-like-btn">
										<i class="bi bi-heart-fill delete-like-icon text-danger"></i>
									</a>
								</c:when>
								<c:otherwise>
									<a href="#" data-post-id="${ userPost.postDetail.post.id }" class="like-btn">
										<i class="bi bi-heart like-icon text-dark"></i>
									</a>
								</c:otherwise>
							</c:choose>
								<b class="like-count">좋아요 ${ userPost.postDetail.likeCount }개</b>
							</div>
							
							<!-- 게시물 삭제 -->
							<div class="d-flex align-items-center mt-1">
							<c:if test="${ userPost.postDetail.post.userId eq userId }">
								<a href="#" data-toggle="modal" data-target="#moreModal" data-post-id="${ userPost.postDetail.post.id }" class="more-icon mr-3 text-dark">
									<i class="trash-bin-icon bi bi-trash-fill"></i>
								</a>
							</c:if>
							</div>
						</div>
						
						<!-- 게시물 내용 -->
						<div class="content-box ml-3 mt-3">
							<b><a href="/profile_view?userId=${ userPost.postDetail.post.userId }" class="content-loginId text-dark">
								${ userPost.postDetail.post.loginId }
							</a></b>
							<span class="content">${ userPost.postDetail.post.content }</span>
						</div>
						
						<!-- 작성 시간 -->
						<div class="upload-time mt-1 ml-3">
							<span class="text-secondary"><fmt:formatDate value="${ userPost.postDetail.post.createdAt }" pattern="yyyy년 M월 d일 H시 m분" /></span>
						</div>
						
						<hr class="col-11">
						
						<!-- 댓글 내용 -->
						<div class="comment-box mt-1 ml-3">
						<c:forEach var="comment" items="${ userPost.postDetail.commentList }">
							<div>
								<b>
									<a href="/profile_view?userId=${ comment.userId }" class="text-dark">
										${ comment.loginId }
									</a>
								</b>
								<span>${ comment.comment }</span>
							</div>
						</c:forEach>
						</div>
						
						<!-- 댓글 달기 -->
						<div class="d-flex mt-2 mb-3 ml-3">
							<span class="comment-icon pb-2"><i class="bi bi-chat"></i></span>
							<div class="input-group col-11">
								<input type="text" id="commentInput${ userPost.postDetail.post.id }" class="form-control" placeholder="댓글 달기">
								<button data-post-id="${ userPost.postDetail.post.id }" class="comment-btn btn btn-outline-secondary" type="button">작성</button>
							</div>
						</div>
					</div>
					
				</div>
			</div>
		
		</section>	
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="moreModal" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
			    <div class="modal-body text-center">
			    	<a href="#" id="deleteBtn" class="text-dark">삭제하기</a>
			    </div>
		    </div>
		</div>
	</div>
	
	<!-- Modal2 -->
	<div class="modal fade" id="moreModal2" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
			    <div class="modal-body text-center">
			    	<a href="#" id="userProfileBtn" class="text-dark">프로필 보기</a>
			    </div>
		    </div>
		</div>
	</div>
	
	
	<script>
	
		$(document).ready(function(){
			
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
			
			
			// 좋아요
			$(".like-btn").on("click", function(e){
				
				e.preventDefault();
				
				let postId = $(this).data("post-id");
				
				$.ajax({
					
					type:"get"
					, url:"/post/like"
					, data:{"postId":postId}
					, success:function(data){
						
						if (data.result == "success") {
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