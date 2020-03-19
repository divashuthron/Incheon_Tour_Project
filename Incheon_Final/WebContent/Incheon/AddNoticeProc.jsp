<%-- 
	1. 글쓰기 정보 자바 빈즈에 설정
	2. 빈즈에 조회 수 0으로 설정
	3. 멤버 매니저로 넘겨서 데이터 베이스에 저장
	4. 관리자 페이지로 넘어오기
 --%>
 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*, ICproject.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="memMgr" class="ICproject.MemberManager"/>
<jsp:useBean id="NB" class="ICproject.NoticeBean"/>
<jsp:setProperty name="NB" property="*"/>

<%
	boolean ANB = memMgr.noticeInsert(NB);
	
	if (ANB) {
		response.sendRedirect("AdminPage.jsp");
		session.setAttribute("upSC", "success");
	} else {
		response.sendRedirect("AdminPage.jsp");
		session.setAttribute("upFA", "fail");
	}
%>