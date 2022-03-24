<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>

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
	
	<div id="wrap" class="bg-light">
		
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		
		<section class="d-flex justify-content-center">
			
			<div class="create-box d-flex justify-content-center mb-5">
				<div class="create-box2">
					<h2 class="text-center my-4">새 게시물 만들기</h2>
					<textarea id="contentInput" class="form-control" rows="6"></textarea>
					<div class="d-flex justify-content-between align-items-center my-4">
						<a href="#" id="imageIcon"><i class="bi bi-camera camera-icon text-dark"></i></a>
						<input type="file" id="fileInput" class="d-none">
						<button id="uploadBtn" class="btn btn-primary">업로드</button>
					</div>
				</div>
			</div>
		
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
	
	<script>
	
		$(document).ready(function(){
			
			$("#uploadBtn").on("click", function(){
				
				let content = $("#contentInput").val();
				
				if (content == "") {
					alert("내용을 입력하세요.");
					return;
				}
				
				// 파일 유효성 검사
				// $("#fileInput")[0].files[0] => files는 배열
				if ($("#fileInput")[0].files.length == 0) { // 파일 선택이 되지 않아서 배열이 비어있는지
					alert("사진을 첨부해주세요.");
					return;
				}

				
				let formData = new FormData();
				formData.append("content", content);
				formData.append("file", $("#fileInput")[0].files[0]);
				
				$.ajax({
					
					type:"post"
					, url:"/post/create"
					, data:formData
					, enctype:"multipart/form-data"
					, processData:false
					, contentType:false
					, success:function(data){
						if (data.result == "success") {
							location.href="/post/timeline";
						} else {
							alert("업로드 실패");
						}
					}
					, error:function(){
						alert("업로드 통신 에러");
					}
					
				});
				
			});
			
			
			$("#imageIcon").on("click", function(){
				
				// fileInput 클릭된 효과
				$("#fileInput").click();
				
			});
			
		});
	
	</script>

</body>
</html>