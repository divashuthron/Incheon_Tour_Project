<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*, ICproject.*" %>
<jsp:useBean id="memMgr" class="ICproject.MemberManager"/>
<jsp:useBean id="ADB" class="ICproject.AddAcountBean" scope="page"/>
<jsp:setProperty name="ADB" property = "*"/>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>회원가입 성공!</title>
	<style>
	div.panel.panel-success{width : 800px; height: 500px;margin-left : 540px;margin-top: 160px;}
	.loginFalse{margin-left:185px;}
	</style>
</head>
<body>
    <div class="panel panel-success">
    <div class="panel-heading">회원가입 성공!</div>
    <div class="panel-body">
    	<div class= "loginFalse">
		<img src = "IncheonTourImage/succes.gif"> 
		<div class = "strong"></div>
		<div class = "word">
		<%
	String NA = (String)session.getAttribute("UNA");
	out.println("<b>" + NA + "님, 인천투어의 회원이 되신것을 환영합니다!</b><p>");
	%>
		</div>
		<button type="button" class="btn btn-primary" onclick = "location.href = 'Login.jsp'">로그인</button>
		<button type="button" class="btn btn-primary" onclick = "location.href = 'Index.jsp'">메인페이지</button>
		</div>
	</div>

</body>
</html>