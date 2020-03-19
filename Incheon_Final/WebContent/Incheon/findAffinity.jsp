<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*, ICproject.*" %>
<jsp:useBean id = "memMgr" class="ICproject.MemberManager"/>

<html>
<head>
<meta charset="UTF-8">
<title>관광 추천받기</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
 <style>
 form{margin-top:100px;}
 </style>
</head>
<body>
<div class="wrapper">
<header>
<jsp:include page="Top.jsp" flush="false"/>
</header>
<nav>
<form method = "post" action = "findAffinityProc.jsp">
<% ArrayList<AffinityQuestionBean> AQ = memMgr.getAffinityQuestion(); 
	for (int i = 0; i <AQ.size(); i++) { %>
		<%= AQ.get(i).getQN() %>. <%= AQ.get(i).getQT() %><br>
		① <input type = "radio" name = "QA<%=i+1%>" value = "1"><%= AQ.get(i).getQA1() %><br>
		② <input type = "radio" name = "QA<%=i+1%>" value = "2"><%= AQ.get(i).getQA2() %><br>
		③ <input type = "radio" name = "QA<%=i+1%>" value = "3"><%= AQ.get(i).getQA3() %><br>
		④ <input type = "radio" name = "QA<%=i+1%>" value = "4"><%= AQ.get(i).getQA4() %><br><p>
	<% } %>

	<input type = "submit" value = "제출">
</form>
</div>
</nav>
<footer>
<jsp:include page="Bottom.jsp" flush="false"/>
</footer>

</body>
</html>