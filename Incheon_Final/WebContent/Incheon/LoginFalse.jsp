<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>로그인 실패</title>
	<style>
	div.panel.panel-danger{width : 800px; height: 500px;margin-left : 540px;margin-top: 160px;}
	.loginFalse{margin-left:185px;}
	</style>
</head>
<body>
    <div class="panel panel-danger">
    <div class="panel-heading">로그인에 실패하였습니다!</div>
    <div class="panel-body">
    	<div class= "loginFalse">
		<img src = "IncheonTourImage/loginFalse.gif"> 
		<div class = "strong"></div>
		<div class = "word">아이디와 비밀번호를 확인해 주세요.</div>
		<button type="button" class="btn btn-primary" onclick = "location.href = 'Login.jsp'">로그인</button>
		<button type="button" class="btn btn-primary" onclick = "location.href = 'Index.jsp'">메인페이지</button>
		</div>
	</div>

</body>
</html>