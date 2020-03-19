<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import = "java.util.*, ICproject.*" %>
<jsp:useBean id="memMgr" class="ICproject.MemberManager"/>

<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>
	<h2> 공지사항 </h2>
	<% 
	int pageNum = 1;
	
	if (request.getParameter("pageNum") != null) {
		pageNum = Integer.parseInt(request.getParameter("pageNum"));
	}
	%>
	
	<table>
		<thead>
			<tr>
				<td> No. </td>
				<td> 제목 </td>
				<td> 작성자 </td>
				<td> 조회수 </td>
			</tr>
		</thead>
		<tbody>
<% 
	ArrayList<NoticeBean> nResult = memMgr.getNoticeList(pageNum); 
	for (int i = 0; i < nResult.size(); i++) {
%>
			<tr>
				<td> <%= nResult.get(i).getNUM() %></td>
				<td> <a href = "NoticeContent.jsp?NUM=<%= nResult.get(i).getNUM() %>"> <%= nResult.get(i).getNNA() %> </a> </td>
				<td> <%= nResult.get(i).getNA() %> </td>
				<td> <%= nResult.get(i).getVIEW() %> </td>
			</tr>
<%
	}
%>
		</tbody>
	</table>
	<%
		if (pageNum != 1) { %>
			<a href="NoticeIndex.jsp?pageNum=<%=pageNum-1%>"> 이전 </a>
	<%
		} 
	%> 
		<a href="NoticeIndex.jsp?pageNum=1">1</a>
		<a href="NoticeIndex.jsp?pageNum=2">2</a>
		<a href="NoticeIndex.jsp?pageNum=3">3</a>
		<a href="NoticeIndex.jsp?pageNum=4">4</a>
		<a href="NoticeIndex.jsp?pageNum=5">5</a>
	<%if(memMgr.nextPage(pageNum + 1)) {
	%>
			<a href="NoticeIndex.jsp?pageNum=<%=pageNum+1%>"> 다음 </a>
	<%
		}
	%>
</body>
</html>

<!-- 
	1. 현재 페이지는 1번 페이지이다.
	2. 1번 페이지는 이전이 나타나지 않는다.
	3. 1번 페이지는 다음이 나타난다.
	4. 1번 페이지는 10개만 표시한다.
	5. 2번 페이지로 넘어가면 페이지 숫자가 +1 된다. {<a href = "#?NUM=NUM+1">}
	6. 페이지 숫자가 +1이 되면 다음 10개의 글 목록이 나타난다. {NUM * 10}
	7. 페이지 숫자가 2 이상이 되면 이전이 나타난다.
	8. 글 목록이 더 이상 불러와지지 않을 경우 {!rs.next()} 다음이 나타나지 않는다.
 -->