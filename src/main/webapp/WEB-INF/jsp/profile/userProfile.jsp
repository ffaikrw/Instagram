<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필</title>

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
			
		<section>
			
			<div class="userInfo d-flex align-items-center justify-content-center">
				<div class="profile-header ml-5 mt-3 text-center">
					<div class="userLoginId mb-2">${ userProfile.loginIdByUserId }</div>
					<div>게시물 <b>${ userProfile.postCountByUserId }</b></div>
				</div>
			</div>
			
			<div class="userPostList d-flex flex-wrap">
				<c:forEach var="post" items="${ userProfile.postListByUserId }">
					<div class="user-post-box bg-danger d-flex align-items-center">
					<fmt:formatDate var="createdDate" value="${ post.createdAt }" pattern="yyyy년 M월 d일 H시 m분" />
						<a href="#" data-toggle="modal" data-target="#postModal"
						data-post-id="${ post.id }"
						data-img-id="${ post.imagePath }"
						data-login-id="${ post.loginId }"
						data-content-id="${ post.content }"
						data-date-id="${ createdDate }"
						class="post-modal">
							<img src="${ post.imagePath }">
						</a>
					</div>
				</c:forEach>
			</div>
		
		</section>
			
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	
	</div>
	
	
	<!-- Modal -->
	<div class="modal fade" id="postModal" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
		    <div id="modalContent" class="modal-content">
			    <div class="modal-body p-0 m-0">
			    	<div class="post-img-modal bg-success">
			    		<img id="modalImg" width="798px">
			    	</div>
			    	<div class="post-content-modal mb-3">
			    		<!-- 게시글 내용 -->
			    		<div class="content-box ml-3 mt-3">
							<b id="modalLoginId"></b>
							<span id="modalPostContent" class="content"></span>
						</div>
						<!-- 작성 시간 -->
						<div class="upload-time mt-1 ml-3">
							<span id="modalDate" class="text-secondary"></span>
						</div>
						
						<hr class="col-11">
						
						<div class="d-flex justify-content-end mt-2 mb-3 ml-3">
							<div class="pt-2 pr-3">
								<a href="#" id="modalPostDetail" class="modalDetail text-dark">
									<i class="bi bi-emoji-smile text-dark"></i> <b class="modalDetailText">자세히 보기</b>
								</a>
							</div>
						</div>
			    	</div>
			    </div>
		    </div>
		</div>
	</div>
	
	
	
	<script>
	
		$(document).ready(function(){
			
			// 게시물 모달
			$(".post-modal").on("click", function(e){
				
				e.preventDefault();
				
				let postId = $(this).data("post-id");
				let imgId = $(this).data("img-id");
				
				
				$("#modalContent").data("post-id", postId);
				$("#modalFillHeart").data("post-id", postId);
				$("#modalHeart").data("post-id", postId);
				$("#modalImg").attr("src", imgId);
				$("#modalLoginId").text($(this).data("login-id"));
				$("#modalPostContent").text($(this).data("content-id"));
				$("#modalDate").text($(this).data("date-id"));
				$("#modalPostDetail").data("post-id", postId);
				
			});
			
			
			// 자세히 보기 링크
			$("#modalPostDetail").on("click", function(e){
				
				e.preventDefault();
				
				let postId = $(this).data("post-id");
				
				location.href = "/profile_detail_view?postId=" + postId;
				
			});
			
			
			
		});
	
	</script>
	
</body>
</html>