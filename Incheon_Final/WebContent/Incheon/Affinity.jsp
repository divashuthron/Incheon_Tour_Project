<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.util.*, ICproject.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="memMgr" class="ICproject.MemberManager"/>

<html>
<head>
<meta charset="UTF-8">
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Gugi&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Cute+Font&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Stylish&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>관광 추천</title>
<style>
	.topMargin{margin-top:120px;margin-bottom:50px;}
	.name h1{margin-left:250px;margin-top:-1700px;margin-bottom:1700px; color : white; font-size : 140px;font-family: 'Jua', sans-serif;}
	.af h3{margin-left:380px;margin-top:-1130px;margin-bottom:500px;font-size:140px;font-family: 'Jua', sans-serif;}
	.recommend h1{color:white;font-family: 'Nanum Gothic', sans-serif;margin-left: 350px;margin-top:-300px;}
	.img{margin-left:350px;}
	.order{margin-left:350px;margin-top:30px;color:white;font-family: 'Nanum Gothic', sans-serif;font-size:20px;}
	.afName{margin-left:350px;margin-top:10px;color:white;font-family: 'Nanum Gothic', sans-serif;font-size:16px;}
	.thema{margin-left:350px;margin-top:10px;color:white;font-family: 'Nanum Gothic', sans-serif;font-size:16px;}
	.but{margin-left:350px;margin-top:10px;margin-bottom:160px;}
</style>
</head>
<body>
<div class ="wrapper">
<header>
<jsp:include page="Top.jsp" flush="false"/>
</header>
<nav>
<div class ="topMargin">
<% String mbID = (String)session.getAttribute("mbID");

	if (mbID != null) { //로그인 되어있을 경우
		AddAcountBean AF = memMgr.getAffinity(mbID);
		
		if (AF.getAffinity() != null) { //이미 호감도 설정을 마친 경우
			AddAcountBean ACB = memMgr.getMember(mbID);
			%>
			<img src = "IncheonTourImage/1200x2000affinityImage.jpg">
			<div class ="name"><h1><%=ACB.getNA()%></h1></div>
			<div class ="af"><h3><%=AF.getAffinity()%></h3></div>
			
				<div class = "recommend"><h1>추천 여행지</h1> <br></div>
				<%	
				ArrayList<TravelBean> tR = memMgr.getTravelAffnityList(AF.getAffinity());
				for (int i = 0; i <tR.size(); i++) {
			%>
				<div class="img"><img src="Travel/<%=tR.get(i).getIMAGE() %>"><br></div>
				<div class="order"><%=tR.get(i).getNO() %>번째 추천지<br></div>
				<div class="afName">관광지명 : <%=tR.get(i).getNAME() %><br></div>
				<div class="thema">관광테마 : <%=tR.get(i).getTYPE() %><br></div>
				<div class="but">
				<button type="button" class="btn btn-default"><a href="TravelInfoDetail.jsp?NO=<%=tR.get(i).getNO()%>">상세정보</a></button>
				<button type="button" class="btn btn-default"><a href="CartTravel.jsp?NO=<%=tR.get(i).getNO()%>">여행 찜하기</a></button>
			<%
				}
			%> <button type="button" class="btn btn-default"><a href = "findAffinity.jsp">관광지 추천 다시 받기</a></button></div> <%
					
		} else { //여행 호감도 설정이 안되어있을 경우
			AddAcountBean ACB = memMgr.getMember(mbID);
			%>
			<%=ACB.getNA()%>님, 본인에게 맞는 관광지를 찾고싶으신가요?<br>
			<a href = "findAffinity.jsp">관광지 추천 받으러 가기</a>
	<%	}
		
	} else { //로그인 되어있지 않은 경우
		%> 로그인 후 이용해주세요!<br>
		<a href = "Login.jsp">로그인 하기</a> <%
	}
%>
</div>
</nav>
<footer>
<jsp:include page="Bottom.jsp" flush="false"/>
</footer>
</div>
</body>
</html>