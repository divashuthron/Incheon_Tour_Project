<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <meta charset="utf-8">
    <link href="https://fonts.googleapis.com/css?family=Stylish&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Stylish&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cute+Font&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com`/css?family=Gamja+Flower&display=swap" rel="stylesheet">
    <title>인천투어</title>
	<link href="Login.css" rel="stylesheet" type="text/css">
	  <script>
  function showPopup() { window.open("LoginFalse.html", "a", "width=400, height=300, left=100, top=50"); }
  </script>
  </head>
  <body>

    <header>
 	 <jsp:include page="Top.jsp" flush="false"/></header>
	<contents>
	<%
	String mbID = (String)session.getAttribute("mbID");
	String svID = (String)session.getAttribute("svID");
	
	if (svID != null) { //아이디 정보 저장 체크했었을 경우
	%>
    <div class = "wrapper">
    <div class = "wow">
	<div class = "loginImage"><img src = "IncheonTourImage/bigloginImage.jpg"></div>
		<form method = "post" action = "LoginProc.jsp">
		  	
				
  <div class="input-group">
    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
    <input id="email" type="text" class="form-control" name="id" placeholder="ID를 입력하세요." value = "<%=mbID %>">
  </div>
  <div class="input-group">
    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
    <input id="password" type="password" class="form-control" name="ps" placeholder="비밀번호">
  </div>
  		<input type = "checkbox" name = "saveInfo" class ="idpw" checked>아이디 저장
  		<button type="submit" class="btn btn-default btn-sm" value = "로그인"">로그인</button><br>
			<a href = "AddAcount.jsp">아직 회원이 아니신가요?</a>
			
</form>	
    </div></div>
    <% } else { //체크 안했을 경우
    %> 
    <div class = "wrapper">
    <div class = "wow">
	<div class = "loginImage"><img src = "IncheonTourImage/bigloginImage.jpg"></div>
		<form method = "post" action = "LoginProc.jsp">
		  	
				
  <div class="input-group">
    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
    <input id="email" type="text" class="form-control" name="id" placeholder="ID를 입력하세요.">
  </div>
  <div class="input-group">
    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
    <input id="password" type="password" class="form-control" name="ps" placeholder="비밀번호">
  </div>
  		<input type = "checkbox" name = "saveInfo" class ="idpw">아이디 저장
  		<button type="submit" class="btn btn-default btn-sm" value = "로그인">로그인</button><br>
			<a href = "AddAcount.jsp">아직 회원이 아니신가요?</a>
			
</form>	
    </div></div>
    <% } %>
	</contents>
<footer>
	 <jsp:include page="Bottom.jsp" flush="false"/>
    </footer>

  </body>
</html>