<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="memMgr" class="ICproject.MemberManager"/>
<jsp:useBean id="regBean" class="ICproject.AddAcountBean"/>
<jsp:setProperty name="regBean" property="*" />

<%
	boolean flag = memMgr.memberUpdate(regBean);

	if(flag) {
		session.setAttribute("upSC", "success");
		response.sendRedirect("AdminPage.jsp");
	} else {
		session.setAttribute("upFA", "fail");
		response.sendRedirect("AdminPage.jsp");
	}
%>