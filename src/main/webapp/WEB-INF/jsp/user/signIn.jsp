<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<!-- jquery cdn -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<!-- bootstrap CDN link -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<!-- stylesheet -->
<link rel="stylesheet" href="/static/css/style.css" type="text/css">

</head>
<body>
	
	<div id="wrap">
		
		<header></header>
		
		<section class="d-flex justify-content-center align-items-center">
			<div class="join-box h-100">
				<div class="join-box2 d-flex justify-content-center">
					<div class="input-box">
						<h2 class="text-center my-4 font-weight-bold">로그인</h2>
						
						<form id="loginForm">
							<input type="text" id="loginId" class="form-control" placeholder="아이디">
							<input type="password" id="password" class="form-control mt-3" placeholder="비밀번호">
							
							<button type="submit" id="joinBtn" class="btn btn-primary btn-block my-4">로그인</button>
						</form>
						
					</div>
				</div>
				
				<div class="join-box2 my-3 py-3 d-flex justify-content-center align-items-center">
					계정이 없으신가요? <a href="/user/signup_view" class="font-weight-bold ml-1">회원가입</a>
				</div>
			</div>
		</section>
		
		<footer class="d-flex justify-content-center align-items-center">
			copyright 2022 Instagram
		</footer>
	
	</div>
	
	
	<script>
	
		$(document).ready(function(){
			
			$("#loginForm").on("submit", function(e){
				
				e.preventDefault();
				
				let loginId = $("#loginId").val().trim();
				let password = $("#password").val().trim();
				
				// 유효성 검사
				if (loginId == "") {
					alert("아이디를 입력하세요.");
					return;
				}
				
				if (password == "") {
					alert("비밀번호를 입력하세요.");
					return;
				}
				
				$.ajax({
					
					type:"post"
					, url:"/user/sign_in"
					, data:{"loginId":loginId, "password":password}
					, success:function(data){
						
						if (data.result == "success") {
							alert("로그인 성공");
						} else {
							alert("아이디 또는 비밀번호가 일치하지 않습니다.");
						}
						
					}
					, error:function(){
						alert("로그인 통신 에러");
					}
					
				});
					
			});
			
		});
	
	
	</script>

</body>
</html>