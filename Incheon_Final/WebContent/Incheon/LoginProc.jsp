<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*, ICproject.*" %>
<jsp:useBean id="memMgr" class="ICproject.MemberManager"/>
<%
	String ID = request.getParameter("id");
	String PS = request.getParameter("ps");
	String SI = request.getParameter("saveInfo");
	
	boolean loginCheck = memMgr.loginCheck(ID, PS);
	AddAcountBean ADB = memMgr.getMember(ID);

	if (loginCheck && SI != null) {
		//아이디, 패스워드가 맞으면서 정보 저장을 체크했을 경우
		session.setAttribute("mbLogin", "Success");
		session.setAttribute("mbID", ID);
		session.setAttribute("svID", SI);
		session.setAttribute("mbName", ADB.getNA());
		response.sendRedirect("Index.jsp");
	}
	else if (loginCheck && SI == null) { 
		//아이디, 패스워드가 맞으면서 정보 저장을 체크하지 않았을경우
		session.removeAttribute("mbID");
		session.removeAttribute("svID");
		session.setAttribute("mbID", ID);
		session.setAttribute("mbLogin", "Success");
		session.setAttribute("mbName", ADB.getNA());
		response.sendRedirect("Index.jsp");
	}
	
	else if (ID.equals("Admin") && PS.equals("Admin")) {
		//관리자 전용 로그인
		response.sendRedirect("AdminPage.jsp");
	}
	
	else {
		response.sendRedirect("LoginFalse.jsp");
	}
%>