<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <meta charset="utf-8">
    <link href="https://fonts.googleapis.com/css?family=Stylish&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cute+Font&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com`/css?family=Gamja+Flower&display=swap" rel="stylesheet">
<title>Insert title here</title>
<style>
		.mainFont{
				  font-family: "Stylish","gothic";
				  font-size: 80px;
				 }
		header .container{height:70px;}
		.nav.navbar-nav.navbar-right{
									 font-family: 'Noto Sans KR', sans-serif;
									 margin-top: 15px;
									 font-size: 15px;
									}
		.navbar-brand{font-family:"Stylish","gothic";}
		.wrapper{
			     width:1200px;
			     margin : 0 auto;
			     font-family: 'Noto Sans KR', sans-serif;
 			    }
  		.clear{clear:both;}
</style>
</head>
<body>
<div class = "wrapper">
	    <header>
	      <nav class="navbar navbar-default navbar-fixed-top">
	  <div class="container">
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand" href="Index.jsp"><img src="IncheonTourImage/miniIncheonCharacter.png">인천투어</a>
	    </div>
<% 	
    String check = (String)session.getAttribute("mbLogin");
	String mbName = (String)session.getAttribute("mbName");
	
	if (check == null) {
	%>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="NoticeIndex.jsp">공지사항</a></li>
        <li><a href="TravelInfo.jsp">관광정보</a></li>
        <li><a href="Affinity.jsp">관광추천</a></li>
        <li><a href="Login.jsp">로그인</a></li>
        <li><a href="AddAcount.jsp">회원가입</a></li>
      </ul>
    </div>
    <%
    } else {
    %>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="NoticeIndex.jsp">공지사항</a></li>
        <li><a href="TravelInfo.jsp">관광정보</a></li>
        <li><a href="Affinity.jsp">여행지추천</a></li>
        <li><a><%= mbName %> 님, 환영합니다.</a></li>
        <li><a href="CartUser.jsp">찜 목록</a></li>
        <li><a href="LogoutProc.jsp">로그아웃</a></li>
      </ul>
    </div>
    <%
    }
    %>
	  </div>
	</nav>

	    </header>
	    	</div>
</body>
</html>