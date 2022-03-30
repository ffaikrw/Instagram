<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			
			<div class="userInfo d-flex align-items-center">
				<div class="userImageBox ml-3 mb-4">
					<i class="bi bi-circle-fill text-secondary userInfoImage"></i>
				</div>
				<div class="ml-5 mt-3">
					<p class="userLoginId">jhwn0202</p>
					<p>게시물 <b>9</b></p>
				</div>
			</div>
			
			<div class="userPostList d-flex flex-wrap">
				<div class="user-post-box bg-danger d-flex align-items-center">
					<img width="350px" height="350px">
				</div>
				<div class="user-post-box bg-primary">
					<img width="350px" height="350px">
				</div>
				<div class="user-post-box bg-info">
					
				</div>
				<div class="user-post-box bg-success">
					
				</div>
				<div class="user-post-box bg-warning">
					
				</div>
			</div>
		
		</section>
			
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	
	</div>
	
</body>
</html>