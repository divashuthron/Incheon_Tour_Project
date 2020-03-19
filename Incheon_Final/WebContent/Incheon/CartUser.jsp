<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*, ICproject.*" %>
    <jsp:useBean id="memMgr" class="ICproject.MemberManager"/>
    <% 
    String mbID = (String)session.getAttribute("mbID");
   	AddAcountBean ACB = memMgr.getMember(mbID);
    %>
<html>
<head>
<title>찜하기 목록</title>
<style>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
.marginTop{margin-top: 400px;}
.pageNumber{margin-left:600px;}
</style>
</head>
<body>
<div class = "wrapper">
<header>

<jsp:include page="Top.jsp" flush="false"/></header>
<contents>
<br><br><br><br>
<div class="container">
  <h2><%= ACB.getNA() %> 님의 찜하기 목록 </h2>

    
<% 	
	int pageNum = 1;
	int pv = 1;
	
	if (request.getParameter("pageNum") != null) {
		pageNum = Integer.parseInt(request.getParameter("pageNum"));
	}
	
	if (mbID != null) {
		%>
	 <table class="table">
	 <thead>
		<tr>
			<th> 여행지 사진 </th>
			<th> 여행지명 </th>
			<th> 여행지 연락처 </th>
			<th> 여행지 주소 </th>
			<th> 여행 날짜 </th>
			<th> 찜 취소 </th>
		</tr>
		</thead>
		<%
		ArrayList<CartBean> CB = memMgr.getCart(pageNum, mbID);
		for (int i = 0; i < CB.size(); i++) { %>
			<tbody>
			<tr>
				<td> <img src = "Travel/<%= CB.get(i).getTIMAGE() %>"class="img-rounded" alt="Cinque Terre"></td>
				<td> <%= CB.get(i).getTNAME() %></td>
				<td> <%= CB.get(i).getTTEL() %></td>
				<td> <%= CB.get(i).getTADDR() %></td>
				<td> <%= CB.get(i).getTDATE() %></td>
				<td> <a href = "CartDelete.jsp?CNO=<%=CB.get(i).getCNO()%>">찜 취소</a></td>
			</tr>
			</tbody>
	<%	} 
		%> </table></div> 
				<div class="pageNumber">
		<%
		
		if (pageNum != 1) { %>
			<a href="CartUser.jsp?pageNum=<%=pageNum-1%>"> 이전 </a>
			<a href="CartUser.jsp?pageNum=<%=pageNum-pv%>"><%=pageNum-pv%> </a>
		</ul>
	<%
		} 
	%> 

	<a href="CartUser.jsp?pageNum=<%=pageNum%>"><%=pageNum%></a>
      
    <%	
    	while(memMgr.CnextPage(pageNum + pv)) { 
    		%><a href="CartUser.jsp?pageNum=<%=pageNum+pv%>"><%=pageNum+pv%> </a><%
    		if (memMgr.CnextPage(pageNum + (++pv)) == false) { 
    		break;
    		}
    	} 
    
    if (memMgr.CnextPage(pageNum + 1)) { %>
	<a href="CartUser.jsp?pageNum=<%=pageNum + 1%>"> 다음 </a>
	<% }
	} else { %>
		로그인 후 이용해주세요!<br>
		<a href = "Login.jsp">로그인</a>
<%  } 
%>
</div>
</contents>
<footer>
<jsp:include page="Bottom.jsp" flush="false"/>
</footer>
</div>
</body>
</html>