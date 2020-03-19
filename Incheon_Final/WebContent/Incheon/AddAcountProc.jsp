<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*, ICproject.*" %>
<% 
request.setCharacterEncoding("UTF-8");
%>
    
<jsp:useBean id="memMgr" class="ICproject.MemberManager"/>
<jsp:useBean id="ADB" class="ICproject.AddAcountBean" scope="page"/>
<jsp:setProperty name="ADB" property = "*"/>

<html>
<head>
<title>회원가입 확인</title>
</head>
<body>
<!-- 

추가해야 할 것 : 아이디 중복체크, 빈 공간이 있으면 경고메시지 출력, Email 가독성 강화, Email 직접 입력,
				TEL값을 숫자로만 입력받게 설정 (경고메시지 출력 or 강제 숫자입력화),

-->
<%
	String NA = request.getParameter("NA");
	session.setAttribute("UNA", NA);
	
	boolean ADC = memMgr.memberInsert(ADB);
	
	if (ADC) {
		response.sendRedirect("AddAcountSuccess.jsp");
	} else {
		response.sendRedirect("AddAcountFalse.jsp");}
	%>
</body>
</html>