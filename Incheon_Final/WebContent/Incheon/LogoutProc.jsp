<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃 중..</title>
</head>
<body>

<%
	String svID = (String)session.getAttribute("svID");
	
	if (svID != null) { //아이디 정보 저장이 되어있을 경우
		session.removeAttribute("mbLogin");
		session.removeAttribute("mbName");
	} else { //아이디 정보 저장을 선택하지 않았을 경우
		session.removeAttribute("mbLogin");
		session.removeAttribute("mbName");
		session.removeAttribute("mbID");
		session.removeAttribute("svID");
	}
	response.sendRedirect("Index.jsp");
%>

</body>
</html>