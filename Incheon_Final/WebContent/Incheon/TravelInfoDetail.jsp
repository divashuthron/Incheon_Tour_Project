<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*, ICproject.*" %>
<% 
   request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="memMgr" class="ICproject.MemberManager"/>
<jsp:useBean id="TB" class="ICproject.TravelBean" scope="page"/>
<jsp:setProperty name="TB" property="NO"/>

<%
   TravelBean TTB = memMgr.getTravel(TB.getNO());
%>

<html>
<head>
<title>관광 정보</title>
<style>
    #img{
      
      
      float:left;
      
        padding-bottom:100px;
        padding-top:90px;
         padding-left:500px;
        
    }
    #getName{
      font-size:40px;
     
      
       
        
    }
    #table{
       float:left;
      margin-top:100px;
      font-size:20px;
        padding-left:80px;
        font-size:20px;
    }
    #a{
     background-color:skyblue;
     height:410px;
    }
    .clear{
    clear:both;
    }
</style>
</head>
<body>
<header>
    <jsp:include page="Top.jsp" flush="false"/>
</header>
<div id="a"><div id="img"><img src="Travel/<%= TTB.getIMAGE() %>"></div><div>

<div id="table">
<hr>
<div id="getName"> <%= TTB.getNAME() %></div>
<table>
   <tr>
      
      <td> </td>
      <td></td>
   </tr>
   <hr>
   <tr>
       
      <td> 타입 </td>
      <td> <%= TTB.getTYPE() %> </td>
      
   </tr>
   <tr>
       
      <td> 주소 </td>
      <td> <%= TTB.getADDRESS() %> </td>
   </tr>
   
   <tr>
       
      <td> 연락처 &nbsp </td>
      
      <td> <%= TTB.getTEL() %> </td>
   </tr>
   </table>
   </div><br>
   <div class="clear"></div>
 <div class = "wrapper">



    <div style=margin-bottom:100px;>
    <div style=font-size:40px;>내용</div>
       <div><%= TTB.getCONTENT() %> </div>
   
</div>
      <input type="button" value="이전 페이지로" onClick="location.href='TravelInfo.jsp'"><br>
      
    </div>
    <footer>
     <jsp:include page="Bottom.jsp" flush="false"/>
    </footer>
</body>
</html>