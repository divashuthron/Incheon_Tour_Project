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
<title>고객 정보 수정 작업</title>
</head>
<body>
<div class = "container">
	<div class = "page-header">
		<h1> 관리자 페이지 </h1>
		<p> 회원 정보를 수정하거나 조회할 수 있습니다. <p>
	</div>

<%
	String uname = request.getParameter("uname");
	AddAcountBean regBean = memMgr.getMember(uname);
%> 
	<form method = "post" action = "UserUpdateProc.jsp">
		<div class="form-group">
			<label for="text"> 아이디 </label> 
			<input type = "text" name = "ID" class = "form-control" value = "<%= regBean.getID() %>" disabled><p>
				
			<label for="text"> 비밀번호 </label> 
			<input type = "password" class = "form-control" value = "<%= regBean.getPS() %>" name = "PS"><p>
				
			<label for="text"> 이름 </label> 
			<input type = "text" class = "form-control" value = "<%= regBean.getNA() %>" name = "NA"><p>
				
			<label for="text"> 성별 </label> 
			<input type = "text" class = "form-control" value = "<% 
			if (regBean.getSEX().equals("M")) { out.println("남자"); }
			else if (regBean.getSEX().equals("F")) { out.println("여자"); }
			%>" name = "SEX"><p>
				
			<label for="text"> 전화번호 </label><br>
			<select name = "TEL1">
				<option value = "010"> 010 </option>
				<option value = "011"> 011 </option>
				<option value = "012"> 012 </option>
				<option value = "013"> 013 </option>
				<option value = "014"> 014 </option>
				<option value = "015"> 015 </option>
				<option value = "016"> 016 </option>
				<option value = "017"> 017 </option>
				<option value = "018"> 018 </option>
				<option value = "019"> 019 </option>
			</select> - 
			<input type = "text" name = "TEL2" Max = 4 size = 3 value = "<%= regBean.getTEL2() %>"> - 
			<input type = "text" name = "TEL3" Max = 4 size = 3 value = "<%= regBean.getTEL3() %>"><p>
				
			<label for="text"> 이메일 </label>
			<div class = "col-xs-2">
			<input type = "text" class = "form-control" value = "<%= regBean.getEMAIL1() %>" name = "EMAIL1">
			</div> @ 
					<select name="EMAIL2"> 
						<option value="naver.com" selected>네이버</option> 
						<option value="hanmail.net">한메일</option> 
						<option value="hotmail.com">핫메일</option> 
						<option value="nate.com">네이트</option> 
						<option value="yahoo.co.kr">야후 코리아</option> 
						<option value="empas.com">엠파스</option> 
						<option value="dreamwiz.com">드림위즈</option>
						<option value="gmail.com">지메일</option> 
						<option value="paran.com">파란</option> 
					</select><p><br><p>
				<input type = "submit" class = "btn btn-info" value = "수정 완료">
				</div>
			</form>
</div>
</body>
</html>