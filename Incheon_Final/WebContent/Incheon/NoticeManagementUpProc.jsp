<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="memMgr" class="ICproject.MemberManager"/>
<jsp:useBean id="NB" class="ICproject.NoticeBean"/>
<jsp:setProperty name="NB" property = "*"/>

<%
	boolean flag = memMgr.NoticeUpdate(NB);

	if(flag) {
		session.setAttribute("upSC", "success");
		response.sendRedirect("AdminPage.jsp");
	} else {
		session.setAttribute("upFA", "fail");
		response.sendRedirect("AdminPage.jsp");
	}
%>