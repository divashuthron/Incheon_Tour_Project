<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>관리자용 페이지</title>
</head>
<body>


	<% String updateSC = (String)session.getAttribute("upSC");
	String updateFA = (String)session.getAttribute("upFA");

	if (updateSC != null) { %>
	<div class="alert alert-success alert-dismissible">
    	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    	<strong>작업 성공</strong> 작업을 성공적으로 마쳤습니다.
  	</div>
  	<jsp:include page = "AdminPageContent.jsp" flush = "false"/>
  	<%
	session.removeAttribute("upSC");
  	} 

	else if (updateFA != null) { %>
 	<div class="alert alert-danger alert-dismissible">
    	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    	<strong>작업 실패</strong> 오류가 발생하였습니다. 다시 작업해주십시오.
  	</div>
 	<jsp:include page = "AdminPageContent.jsp" flush = "false"/>
	<%
	session.removeAttribute("upFA");
  	} 
	
	else { %>
	<jsp:include page = "AdminPageContent.jsp" flush = "false"/>
	<% } %>

</body>
</html>