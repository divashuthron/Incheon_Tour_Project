<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import = "java.util.*, ICproject.*" %>
<jsp:useBean id="memMgr" class="ICproject.MemberManager"/>

<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>고객 정보 확인 결과</title>
</head>
<body>

<!-- 정보 조회 실패 시 실패했다는 경고창 출력 -->

<div class="container">
	<div class = "page-header">
  <h2>고객 정보 확인 결과</h2>
  <p>해당하는 고객의 정보는 다음과 같습니다.</p> 
  	</div>

<%
	String uname = request.getParameter("uname");
	AddAcountBean regBean = memMgr.getMember(uname);
%>
	<table class = "table table-striped">
		<thead>
			<tr>
				<td align = center><b>아이디</b></td>
				<td align = center><b>비밀번호</b></td>
				<td align = center><b>성명</b></td>
				<td align = center><b>성별</b></td>
				<td align = center><b>전화번호</b></td>
				<td align = center><b>이메일</b></td>
				<td align = center><b>필수 약관 동의 여부</b></td>
				<td align = center><b>선택 약관 동의 여부</b></td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td align = center><%= regBean.getID() %></td>
				<td align = center><%= regBean.getPS() %></td>
				<td align = center><%= regBean.getNA() %></td>
				<td align = center><% 
				String sex =  regBean.getSEX();
				if (sex.equals("M")) { %> <%= "남성" %> <% }
				else if (sex.equals("F")) { %> <%= "여성" %> <% }
				%> </td>
				<td align = center><%= "0" %><%= regBean.getTEL1() %>-<%= regBean.getTEL2() %>-<%= regBean.getTEL3() %></td>
				<td align = center><%= regBean.getEMAIL1() %>@<%= regBean.getEMAIL2() %></td>
				<td align = center><%
				if (Integer.parseInt(regBean.getNCTermsAgree()) == 1) { %> <%= "동의함" %> <% }
				else if (Integer.parseInt(regBean.getNCTermsAgree()) == 0) { %> <%= "동의하지 않음" %> <% }
				%> </td>
				<td align = center><%
				if (Integer.parseInt(regBean.getOPTermsAgree()) == 1) { %> <%= "동의함" %> <% }
				else { %> <%= "동의하지 않음" %> <% }
				%> </td>
			</tr>
	</tbody>
	</table>
	<button type = button class = "btn btn-info" onclick = "location.href = 'AdminPage.jsp'"> 초기 화면으로 </button>
</div>
</body>
</html>