<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*, ICproject.*" %>
    <jsp:useBean id="memMgr" class="ICproject.MemberManager"/>
    <jsp:useBean id="CB" class="ICproject.CartBean"/>
    <jsp:setProperty name="CB" property="CNO"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜 취소</title>
</head>
<body>

<% 
	boolean delCheck = memMgr.DeleteCart(CB.getCNO());

	if (delCheck) {
		response.sendRedirect("CartUser.jsp");
	} else {
		%> 삭제에 실패하였습니다. 다시 시도해주세요.<br>
		<a href = "CartUser.jsp">돌아가기</a> <%
	}
%>

</body>
</html>