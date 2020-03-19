<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*, ICproject.*" %>
    <% request.setCharacterEncoding("UTF-8"); %>
    
<jsp:useBean id = "memMgr" class="ICproject.MemberManager"/>
<jsp:useBean id="TB" class="ICproject.TravelBean" scope="page"/>
<jsp:setProperty name="TB" property="NO"/>

<% TravelBean TTB = memMgr.getTravel(TB.getNO()); %>
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
 	.marginTop{margin-top: 100px;}
 	div.container {width:1000px;}
</style>
<body>
<header>
    <jsp:include page="Top.jsp" flush="false"/>
</header>
<div class ="wrapper">
	<div class = "marginTop">
<nav>
<div class="container">
<% 
	String mbID = (String)session.getAttribute("mbID"); 
	System.out.println(mbID);
	if (mbID != null) { %>
  <h2>관광지 찜하기</h2>
  <p>찜하고 싶은 관광지의 정보를 확인하신 후 가고 싶은 선택해 주세요. </p>            
  <table class="table table-condensed">
    <tbody>
          <tr>
        <th>관광지</th>
        <td><img src="Travel/<%= TTB.getIMAGE() %>" class="img-rounded" alt="Cinque Terre"><br></td>
      </tr>
      <tr>
        <th>이름</th>
        <td><%= TTB.getNAME() %></td>
      </tr>
      <tr>
        <th>전화번호</th>
        <td><%= TTB.getTEL() %></td>
      </tr>
      <tr>
        <th>주소</th>
        <td><%= TTB.getADDRESS() %></td>
      </tr>
      <tr>
        <th>찜하고 싶은 날짜</th>
        <td><form method = "post" action = "CartTravelProc.jsp">
		<select name = "YEAR">
		<% for(int i = 2019; i <= 2023; i++) { %>
			<option value = "<%= i %>"><%= i %>년</option>
		<% } %>
		</select>
		<select name = "MONTH">
		<% for(int i = 1; i <= 12; i++) { %>
			<option value = "<%= i %>"><%= i %>월</option>
		<% } %>
		</select>
		<select name = "DAY">
		<% for(int i = 1; i <= 31; i++) { %>
			<option value = "<%= i %>"><%= i %>일</option>
		<% } %>
		</select>
		<input type = "hidden" name = "UID" value = "<%= mbID %>">
		<input type = "hidden" name = "TNO" value = "<%= TTB.getNO() %>">
		<input type = "submit" value = "찜하기">
	</form></td>
      </tr>
    </tbody>
  </table>
</div>
	<% } else { %>
		로그인 후 이용해주세요!<br>
		<a href = "Login.jsp">로그인</a>
	<% } 
%>
</div>
</nav>
</div>
<footer>
    <jsp:include page="Bottom.jsp" flush="false"/>
</footer>
</body>
</html>


