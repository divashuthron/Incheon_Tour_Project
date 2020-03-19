<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*, ICproject.*" %>
    <% request.setCharacterEncoding("UTF-8"); %>
    
<jsp:useBean id = "memMgr" class="ICproject.MemberManager"/>
<jsp:useBean id="CB" class="ICproject.CartBean" scope="page"/>
<jsp:setProperty name="CB" property="*"/>
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>여행 찜하기</title>
<style>
	.wrapper{
			     width:1200px;
			     margin : 0 auto;
			     font-family: 'Noto Sans KR', sans-serif;
 			    }
	div.panel.panel-success{width : 800px; height: 500px;margin-top: 160px;margin-left : 200px;}
	div.panel.panel-danger{width : 800px; height: 500px;margin-top: 160px;margin-left : 200px;}
</style>
<body>
<div class = "wrapper">
<% 
	String TDATE = 	request.getParameter("YEAR") + "-" +
					request.getParameter("MONTH") + "-" +
					request.getParameter("DAY");

	boolean check = memMgr.checkCart(CB.getTNO(), CB.getUID(), TDATE); 
	if (check) {
		TravelBean TTB = memMgr.getTravel(CB.getTNO());
		CB.setTDATE(TDATE);
		CB.setTNAME(TTB.getNAME());
		CB.setTTEL(TTB.getTEL());
		CB.setTADDR(TTB.getADDRESS());
		CB.setTIMAGE(TTB.getIMAGE());
		
		boolean inCheck = memMgr.InsertCartTravel(CB);
		
		if (inCheck) { %>
	  <div class="panel panel-success">
  	  <div class="panel-heading">성공</div>
    	<div class="panel-body">
		<img src = "IncheonTourImage/succes.gif"> 
		<div class = "strong"></div>
		<div class = "word">
		찜하기에 성공하였습니다!<br>
		<button type="button" class="btn btn-primary" onclick = "location.href = 'CartUser.jsp'">찜한 관광 보러가기</button>
		</div>
		</div>	
		</div>
	<% } else { %>
		 <div class="panel panel-danger">
    	<div class="panel-heading">실패</div>
    	<div class="panel-body">
		<img src = "IncheonTourImage/loginFalse.gif"> 
		<div class = "strong"></div>
		<div class = "word">찜할 수 없습니다. 다시 시도해주세요.</div>
		<button type="button" class="btn btn-primary" onclick = "location.href = 'TravelInfo.jsp'">여행상품으로 돌아가기</button>
		</div>
		</div>

	<% }
	} else { %> 
			 <div class="panel panel-danger">
    	<div class="panel-heading">실패</div>
    	<div class="panel-body">
		<img src = "IncheonTourImage/loginFalse.gif"> 
		<div class = "strong"></div>
		<div class = "word">이미 해당 날짜로 찜한 관광상품 입니다!</div>
		<button type="button" class="btn btn-primary" onclick = "location.href = 'TravelInfo.jsp'">여행상품으로 돌아가기</button>
		</div>
		</div>
<%	} 
%>
</div>
</body>
</html>