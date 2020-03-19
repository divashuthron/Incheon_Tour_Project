<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*, ICproject.*" %>
<jsp:useBean id = "memMgr" class="ICproject.MemberManager"/>

<html>
<head>
<meta charset="UTF-8">
<title>관광 정보</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
    #travel{
      float:left;
     margin-left:50px;
    }
    #getName{
   
   
     font-size:25px;
     margin-bottom:50px;
    
    }
      #getType{
      float:right;
    }
      #sangse{
      margin-top:50px;
    font-size:15px;
     float:right;
    }
      #jjim{
       margin-top:50px;
font-size:15px;
 float:right;
    }
    
    #main{
     margin-top:200px;
     margin-left:-50px;
    }
    .clear{
    clear:both;
    }
    #travel2{
       width:415px; height: 400px;
       padding-right:25px;   
      margin:50px;
      
   
    }
    .pageNumber{margin-left: 600px;margin-bottom : 100px;}
</style>
</head>
<body>
<div class="wrapper">

    <header>
   <jsp:include page="Top.jsp" flush="false"/>
    </header>
    <div id="main"><img src="IncheonTourImage/tourBanner.jpg"></div>

<%
   int pageNum = 1;
   int pv = 1;

   if (request.getParameter("pageNum") != null) {
      pageNum = Integer.parseInt(request.getParameter("pageNum"));
   }
   ArrayList<TravelBean> vResult = memMgr.getTravelList(pageNum);
   for (int i = 0; i <vResult.size(); i++) {
%>
   <div id="travel">
   
   <div id="travel2"><img src="Travel/<%=vResult.get(i).getIMAGE() %>"><br>
   <div id="getName"><%=vResult.get(i).getNAME() %><br></div>
    <div id="getType"><%=vResult.get(i).getTYPE() %><br></div>
   
   <a href="TravelInfoDetail.jsp?NO=<%=vResult.get(i).getNO()%>"class="btn btn-info" role="button">상세정보</a>
   <a href="CartTravel.jsp?NO=<%=vResult.get(i).getNO()%>"class="btn btn-info" role="button">여행 찜하기</a></div> 
   
   <div class="clear"></div>
   </div>

<% 
   }
%>
<div class="clear"></div>
<div class = "pageNumber">
<%
      if (pageNum != 1) { %>
         <a href="TravelInfo.jsp?pageNum=<%=pageNum-1%>"> 이전 </a>
         <a href="TravelInfo.jsp?pageNum=<%=pageNum-pv%>"><%=pageNum-pv%> </a>
   <%
      } 
   %> 
      <a href="TravelInfo.jsp?pageNum=<%=pageNum%>"><%=pageNum%></a>
    <%   
       while(memMgr.TnextPage(pageNum + pv)) { 
          %><a href="TravelInfo.jsp?pageNum=<%=pageNum+pv%>"><%=pageNum+pv%> </a><%
          if (memMgr.TnextPage(pageNum + (++pv)) == false) { 
          break;
          }
       } 
    
    if (memMgr.TnextPage(pageNum + 1)) { %>
   <a href="TravelInfo.jsp?pageNum=<%=pageNum + 1%>"> 다음 </a>
   <% } %>
   </div>
   <div class="clear"></div>

    </div>
    <footer>
     <jsp:include page="Bottom.jsp" flush="false"/>
    </footer>
</body>
</html>