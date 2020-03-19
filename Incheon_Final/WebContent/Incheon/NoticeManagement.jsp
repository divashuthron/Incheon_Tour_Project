<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, ICproject.*" %>
<jsp:useBean id = "memMgr" class="ICproject.MemberManager"/>

<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>공지사항 관리</title>
</head>
<body>

<!-- 정보 조회 실패 시 실패했다는 경고창 출력 -->
<div class="container">
  <h2>공지사항 관리</h2>
  <p>공지사항을 수정하거나 삭제하려면 각 공지사항의 우측 버튼을 눌러 작업하십시오.</p>  

<%
	int pageNum = 1;
	int pv = 1;

	if (request.getParameter("pageNum") != null) {
		pageNum = Integer.parseInt(request.getParameter("pageNum"));
	}
%>
	<table class = "table table-striped">
		<thead>
			<tr>
				<td align = "center"><b>No.</b></td>
				<td align = "center"><b>제목</b></td>
				<td align = "center"><b>작성자</b></td>
				<td align = "center"><b>조회수</b></td>
				<td align = "center"><b>수정</b></td>
				<td align = "center"><b>삭제</b></td>
			</tr>
		</thead>
		<tbody>
<%
	ArrayList<NoticeBean> vResult = memMgr.getNoticeList(pageNum);
	for (int i = 0; i <vResult.size(); i++) {
%>
			<tr>
				<td align = center><%= vResult.get(i).getNUM() %></td>
				<td align = center><%= vResult.get(i).getNNA() %></td>
				<td align = center><%= vResult.get(i).getNA() %></td>
				<td align = center><%= vResult.get(i).getVIEW() %></td>
				<td align = center><form method = "post" action = "NoticeManagementUp.jsp"><input type = "submit" value = "수정">
				<input type = "hidden" name = "NUM" value = "<%= vResult.get(i).getNUM() %>"></form></td>
				<td align = center><form method = "post" action = "NoticeManagementDel.jsp"><input type = "submit" value = "삭제">
				<input type = "hidden" name = "NUM" value = "<%= vResult.get(i).getNUM() %>"></form></td>
			</tr>
<%
	}
%>
		</tbody>
	</table>
	<%
		if (pageNum != 1) { %>
			<a href="NoticeManagement.jsp?pageNum=<%=pageNum-1%>"> 이전 </a>
			<a href="NoticeManagement.jsp?pageNum=<%=pageNum-pv%>"><%=pageNum-pv%> </a>
	<%
		} 
	%> 
      <a href="NoticeManagement.jsp?pageNum=<%=pageNum%>"><%=pageNum%></a>
    <%	
    	while(memMgr.nextPage(pageNum + pv)) { 
    		%><a href="NoticeManagement.jsp?pageNum=<%=pageNum+pv%>"><%=pageNum+pv%> </a><%
    		if (memMgr.nextPage(pageNum + (++pv)) == false) { 
    		break;
    		}
    	} 
    
    if (memMgr.nextPage(pageNum + 1)) { %>
	<a href="NoticeManagement.jsp?pageNum=<%=pageNum + 1%>"> 다음 </a>
	<% } %>
	<p>
	<button type = button class = "btn btn-info" onclick = "location.href = 'AdminPage.jsp'"> 초기 화면으로 </button>
</div>
</body>
</html>