<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

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
					
						<h2 class="text-center my-4 font-weight-bold">회원가입</h2>
						
						<input type="text" id="loginId" class="form-control" placeholder="아이디">
						<div id="duplicateId" class="d-none">
							<small class="text-danger">사용할 수 없는 아이디입니다.</small>
						</div>
						<div id="availableId" class="d-none">
							<small class="text-success">사용 가능한 아이디입니다.</small>
						</div>
						<input type="password" id="password" class="form-control mt-3" placeholder="비밀번호">
						<input type="password" id="passwordConfirm" class="form-control mt-3" placeholder="비밀번호 확인">
						<div id="notMatchPassword" class="d-none">
							<small class="text-danger">비밀번호가 일치하지 않습니다.</small>
						</div>
						<div id="matchPassword" class="d-none">
							<small class="text-success">비밀번호가 일치합니다.</small>
						</div>
						<input type="text" id="name" class="form-control mt-3" placeholder="이름">
						<input type="text" id="email" class="form-control mt-3" placeholder="이메일">
						
						<button id="joinBtn" class="btn btn-primary btn-block my-4">회원가입</button>
					</div>
				</div>
				
				<div class="join-box2 my-3 py-3 d-flex justify-content-center align-items-center">
					계정이 있으신가요? <a href="/user/signin_view" class="ml-1 font-weight-bold">로그인</a>
				</div>
			</div>
		</section>
		
		<footer class="d-flex justify-content-center align-items-center">
			copyright 2022 Instagram
		</footer>
	
	</div>
	
	
	<script>
	
		$(document).ready(function(){

			// 아이디가 중복된 상태인지 확인하는 변수
			var isDuplicate = true;
			
			// 비밀번호가 일치하는지 확인하는 변수
			var isNotMatch = true;

			
			// 아이디 중복체크
			$("#loginId").focusout(function(){
				
				let loginId = $("#loginId").val().trim();
				
				if (loginId == "") {
					return;
				}

				$.ajax({
					
					type:"get"
					, url:"/user/is_duplicate"
					, data:{"loginId":loginId}
					, success:function(data){
						
						$("#duplicateId").addClass("d-none");
						$("#availableId").addClass("d-none");
						
						if(data.is_duplicate) {
							$("#duplicateId").removeClass("d-none");
						} else {
							$("#availableId").removeClass("d-none");
						}
						
						isDuplicate = data.is_duplicate;
						
					}
					, error:function(){
						alert("중복확인 통신 에러");
					}
					
				});
				
			});
			
			
			// 아이디 중복확인 초기화
			$("#loginId").on("input", function(){
				
				// 중복확인 변수값 초기화
				isDuplicate = true;
				
				// 중복관련 텍스트 숨기기
				$("#duplicateId").addClass("d-none");
				$("#availableId").addClass("d-none");
				
			});
			
			
			// 비밀번호 일치 여부
			$("#passwordConfirm").focusout(function(){
				
				let password = $("#password").val().trim();
				let passwordConfirm = $("#passwordConfirm").val().trim();
				
				if (password == "") {
					return;
				}
				
				$("#notMatchPassword").addClass("d-none");
				$("#matchPassword").addClass("d-none");
				
				if (password == passwordConfirm) {
					isNotMatch = false;
					$("#matchPassword").removeClass("d-none");
				} else {
					isNotMatch = true;
					$("#notMatchPassword").removeClass("d-none");
				}
				
			});
			
			
			// 비밀번호 일치 여부 초기화
			$("#passwordConfirm").on("input", function(){
				
				isNotMatch = true;
				
				$("#notMatchPassword").addClass("d-none");
				$("#matchPassword").addClass("d-none");
				
			});
			
			
			// 회원가입 버튼
			$("#joinBtn").on("click", function(){
				
				let loginId = $("#loginId").val().trim();
				let password = $("#password").val().trim();
				let passwordConfirm = $("#passwordConfirm").val().trim();
				let name = $("#name").val().trim();
				let email = $("#email").val().trim();
				
				// 유효성 확인
				if (loginId == "") {
					alert("아이디를 입력하세요.");
					return;
				}
				
				if (isDuplicate) {
					return;
				}
				
				if (password == "") {
					alert("비밀번호를 입력하세요.");
					return;
				}
				
				if (isNotMatch) {
					$("#notMatchPassword").removeClass("d-none");
					return;
				}
				
				if (name == "") {
					alert("이름을 입력하세요.");
					return;
				}
				
				if (email == "") {
					alert("이메일을 입력하세요.");
					return;
				}
				
				$.ajax({
					
					type:"post",
					url:"/user/sign_up",
					data:{"loginId":loginId, "password":password, "name":name, "email":email},
					success: function(data){
						
						if(data.result == "success") {
							location.href="/user/signin_view";
						} else {
							alert("회원가입 실패");
						}
						
					},
					error: function(){
						alert("회원가입 통신 에러");
					}
					
				});
				
			});
			
		});
	
	</script>
	
</body>
</html>