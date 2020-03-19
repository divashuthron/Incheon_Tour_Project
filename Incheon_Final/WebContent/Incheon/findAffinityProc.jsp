<!-- 
	QA1 QA2 QA3 QA4	의 value 값을 받아온 다음
	받아온 값을 통해 계산 후 데이터베이스에 사용자 ID를 기준으로 업데이트 실행

	QA1 >>
		1번이면 섬/바다, 레저 포인트 추가
		2번이면 체험, 섬/바다 포인트 추가
		3번이면 문화공간, 축제 포인트 추가
		4번이면 역사유적, 테마 포인트 추가
	QA2 >>
		1번이면 섬/바다, 테마, 체험 포인트 추가
		2번이면 레저, 섬/바다 포인트 추가
		3번이면 문화공간, 축제, 뷰티 포인트 추가
		4번이면 역사유적, 문화공간 포인트 추가
	QA3 >>
		1번이면 섬/바다, 문화공간 포인트 추가
		2번이면 축제, 레저, 테마, 체험 포인트 추가
		3번이면 문화공간, 역사유적 포인트 추가
		4번이면 뷰티 포인트 추가
	QA4 >>
		1번이면 레저, 체험 포인트 추가
		2번이면 뷰티, 문화공간 포인트 추가
		3번이면 레저, 축제, 테마 포인트 추가
		4번이면 역사유적, 섬/바다 포인트 추가
		
	수정하기 귀찮아서 쓰는 제대로 된 방법
	DB에서 Travel_Type 를 ArrayList로 받아옴
	받아온 ArrayList를 개별 변수화 하여 사용자가 입력한 값에 맞게 포인트를 추가함
	포인트 작업이 끝나면 MAX 값 비교
	MAX 값과 동일한 ArrayList의 Travel_Type 개별 변수를 UpdateUserAffinity 매개변수 MAX 값에 전달
	실행 완료
	
	귀찮아요 언제 다 뒤집어요 이제 그만 뒤집을래
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*, ICproject.*" %>
<jsp:useBean id = "memMgr" class="ICproject.MemberManager"/>

<%
	int length = memMgr.TravelTypeLength();
	String mbID = (String)session.getAttribute("mbID");
	
	boolean upSC;

	float MS = 0;
	float LS = 0;
	float EP = 0;
	float BT = 0;
	float CP = 0;
	float PS = 0;
	float HM = 0;
	float TM = 0;

	int QA1 = Integer.parseInt(request.getParameter("QA1"));
	int QA2 = Integer.parseInt(request.getParameter("QA2"));
	int QA3 = Integer.parseInt(request.getParameter("QA3"));
	int QA4 = Integer.parseInt(request.getParameter("QA4"));
	
	/*-------------사용자가 전달한 값을 포인트화------------------ */
	
	if (QA1 == 1) {
		MS += 1.3;
		LS += 1.1;
	} else if (QA1 == 2) {
		EP += 1.3;
		MS += 1.1;
	} else if (QA1 == 3) {
		CP += 1.3;
		PS += 1.1;
	} else if (QA1 == 4) {
		HM += 1.3;
		TM += 1.1;
	}
	
	if (QA2 == 1) {
		MS += 1.3;
		TM += 1.1;
	} else if (QA2 == 2) {
		LS += 1.3;
		MS += 1.1;
	} else if (QA2 == 3) {
		CP += 1.3;
		PS += 1.1;
		BT += 1.0;
	} else if (QA2 == 4) {
		HM += 1.3;
		CP += 1.1;
	}
	
	if (QA3 == 1) {
		MS += 1.3;
		CP += 1.1;
	} else if (QA3 == 2) {
		PS += 1.3;
		LS += 1.1;
		TM += 1.1;
		EP += 1.0;
	} else if (QA3 == 3) {
		CP += 1.3;
		HM += 1.1;
	} else if (QA3 == 4) {
		BT += 1.3;
	}

	if (QA4 == 1) {
		LS += 1.3;
		EP += 1.1;
	} else if (QA4 == 2) {
		BT += 1.3;
		CP += 1.1;
	} else if (QA4 == 3) {
		LS += 1.3;
		PS += 1.1;
		TM += 1.0;
	} else if (QA4 == 4) {
		HM += 1.3;
		MS += 1.1;
	}
	
	/*-------------포인트화한 값 비교해서 MAX값 찾기------------------ */
	
	float MAX = MS;
	
	MAX = MAX > LS ? MAX : LS;
	MAX = MAX > EP ? MAX : EP;
	MAX = MAX > BT ? MAX : BT;
	MAX = MAX > CP ? MAX : CP;
	MAX = MAX > PS ? MAX : PS;
	MAX = MAX > HM ? MAX : HM;
	MAX = MAX > TM ? MAX : TM;
	
	System.out.println("MS" + MS + " LS" + LS + " EP" + EP + " BT" + BT +
			 " CP" + CP + " PS" + PS + " HM" + HM + " TM" + TM + " MAX" + MAX);
	
	/*-------------포인트화한 값 비교해서 MAX값 찾기------------------ */
	
	if (MAX == MS) {
		upSC = memMgr.UpdateUserAffinity("섬/바다", mbID);
		
		if (upSC) {
			response.sendRedirect("Affinity.jsp");
		} else {
			%> 문제가 발생하였습니다. 관리자에게 문의하세요. <br>
			<a href = "index.jsp">메인으로</a><%
			System.out.println("업데이트 실패");
		}
	} else if (MAX == LS) {
		upSC = memMgr.UpdateUserAffinity("레저", mbID);
		
		if (upSC) {
			response.sendRedirect("Affinity.jsp");
		} else {
			%> 문제가 발생하였습니다. 관리자에게 문의하세요. <br>
			<a href = "index.jsp">메인으로</a><%
			System.out.println("업데이트 실패");
		}
	} else if (MAX == EP) {
		upSC = memMgr.UpdateUserAffinity("체험", mbID);
		
		if (upSC) {
			response.sendRedirect("Affinity.jsp");
		} else {
			%> 문제가 발생하였습니다. 관리자에게 문의하세요. <br>
			<a href = "index.jsp">메인으로</a><%
			System.out.println("업데이트 실패");
		}
	} else if (MAX == BT) {
		upSC = memMgr.UpdateUserAffinity("뷰티", mbID);
		
		if (upSC) {
			response.sendRedirect("Affinity.jsp");
		} else {
			%> 문제가 발생하였습니다. 관리자에게 문의하세요. <br>
			<a href = "index.jsp">메인으로</a><%
			System.out.println("업데이트 실패");
		}
	} else if (MAX == CP) {
		upSC = memMgr.UpdateUserAffinity("문화공간", mbID);
		
		if (upSC) {
			response.sendRedirect("Affinity.jsp");
		} else {
			%> 문제가 발생하였습니다. 관리자에게 문의하세요. <br>
			<a href = "index.jsp">메인으로</a><%
			System.out.println("업데이트 실패");
		}
	} else if (MAX == PS) {
		upSC = memMgr.UpdateUserAffinity("축제", mbID);
		
		if (upSC) {
			response.sendRedirect("Affinity.jsp");
		} else {
			%> 문제가 발생하였습니다. 관리자에게 문의하세요. <br>
			<a href = "index.jsp">메인으로</a><%
			System.out.println("업데이트 실패");
		}
	} else if (MAX == HM) {
		upSC = memMgr.UpdateUserAffinity("역사유적", mbID);
		
		if (upSC) {
			response.sendRedirect("Affinity.jsp");
		} else {
			%> 문제가 발생하였습니다. 관리자에게 문의하세요. <br>
			<a href = "index.jsp">메인으로</a><%
			System.out.println("업데이트 실패");
		}
	} else if (MAX == TM) {
		upSC = memMgr.UpdateUserAffinity("테마", mbID);
		
		if (upSC) {
			response.sendRedirect("Affinity.jsp");
		} else {
			%> 문제가 발생하였습니다. 관리자에게 문의하세요. <br>
			<a href = "index.jsp">메인으로</a><%
			System.out.println("업데이트 실패");
		}
	} else {
		%> 문제가 발생하였습니다. 관리자에게 문의하세요. <br>
		<a href = "index.jsp">메인으로</a><%
		System.out.println("맥스값 찾기 실패");
	}
%>	