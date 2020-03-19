<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>관리자용 페이지</title>
</head>
<body>

<div class="jumbotron text-center">
  		<h1>관리자 전용 페이지</h1>
  		<p>관리자만 접속 가능한 홈페이지입니다. 회원 정보, 공지사항 등을 관리하실 수 있습니다. </p> 
	</div>
	<div class = "container">
		<div class = "row">
			<div class = "col-sm-4">
				<h3><a href = "UserSelect.html"> 고객 정보 확인 </a></h3>
				<p>선택한 고객의 정보를 확인 할 수 있습니다. </p>
			</div>
			<div class = "col-sm-4">
				<h3><a href = "UserSelectAll.jsp"> 전체 고객 정보 확인 </a></h3>
				<p>모든 고객의 정보를 확인 할 수 있습니다. </p>
			</div>
			<div class = "col-sm-4">
				<h3><a href = "UserUpdate.html"> 고객 정보 수정 </a></h3>
				<p>선택한 고객의 정보를 수정 할 수 있습니다. </p>
			</div>
			<div class = "col-sm-4">
				<h3><a href = "AddNotice.jsp"> 공지사항 작성 </a></h3>
				<p>공지사항을 작성하고 배포할 수 있습니다. </p>
			</div>
			<div class = "col-sm-4">
				<h3><a href = "NoticeManagement.jsp"> 공지사항 관리 </a></h3>
				<p>작성된 공지사항을 수정하거나 삭제할 수 있습니다. </p>
			</div>
			<div class = "col-sm-4">
				<h3><a href = "#"> 여행정보 추가 </a></h3> <!-- 구현 필요 -->
				<p>여행정보를 추가하실 수 있습니다. </p>
			</div>
			<div class = "col-sm-4">
				<h3><a href = "#"> 여행정보 관리 </a></h3> <!-- 구현 필요 -->
				<p>여행정보를 수정하거나 삭제할 수 있습니다. </p>
			</div>
			<div class = "col-sm-4">
				<h3><a href = "#"> 이벤트 정보 발송 </a></h3> <!-- 구현 필요 -->
				<p>이벤트 정보 발송을 위한 고객의 찜 목록을 확인할 수 있습니다. </p>
			</div>
			<div class = "col-sm-4">
				<h3><a href = "#"> 고객의 찜 목록 삭제 </a></h3> <!-- 구현 필요 -->
				<p>여행 불가능한 관광지를 찜한 고객의 목록을 삭제할 수 있습니다. </p>
			</div>
		</div>
		<p>
		<footer>
			<button type = button class = "btn btn-warning" onclick = "location.href = 'Index.jsp'" style="float: right;"> 로그아웃 </button>
		</footer>
	</div>
</body>
</html>