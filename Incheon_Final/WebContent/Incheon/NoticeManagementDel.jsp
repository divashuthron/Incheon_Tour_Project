<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import = "java.util.*, ICproject.*" %>
<jsp:useBean id="memMgr" class="ICproject.MemberManager"/>
<jsp:useBean id="NB" class="ICproject.NoticeBean"/>
<jsp:setProperty name="NB" property = "NUM"/>

<% 
    boolean flag = memMgr.DeliteNotice(NB.getNUM()); 
	
    if(flag) {
		session.setAttribute("upSC", "success");
		response.sendRedirect("AdminPage.jsp");
    } else {
		session.setAttribute("upFA", "fail");
		response.sendRedirect("AdminPage.jsp");
    }
%>