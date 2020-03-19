<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*, ICproject.*" %>
<% 
request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="memMgr" class="ICproject.MemberManager"/>
<jsp:useBean id="NB" class="ICproject.NoticeBean" scope="page"/>
<jsp:setProperty name="NB" property="NUM"/>

<%
	NoticeBean NTB = memMgr.getNotice(NB.getNUM());
	memMgr.increaseView(NB.getNUM());
%>


<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <meta charset="utf-8">
    <link href="https://fonts.googleapis.com/css?family=Stylish&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cute+Font&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com`/css?family=Gamja+Flower&display=swap" rel="stylesheet">
<title><%= NTB.getNNA() %></title>

<style>
  .mainFont{
              font-family: "Stylish","gothic";
              font-size: 80px;
             }
      header .container{height:70px;}
      .nav.navbar-nav.navbar-right{
                            font-family: 'Noto Sans KR', sans-serif;
                            margin-top: 15px;
                            font-size: 15px;
                           }
      .navbar-brand{font-family:"Stylish","gothic";}
      .wrapper{
              width:1200px;
              margin : 0 auto;
              font-family: 'Noto Sans KR', sans-serif;
              }
        .clear{clear:both;}

#wrapper { width:1300px;  margin-left: auto;
        margin-right: auto;}

   h2{margin-left:185px;}


   table.importenttable {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-left: 3px solid #369;
   margin : 20px 10px; margin-left:185px;
}
table.importenttable th {
    width: 147px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #153d73;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    border-top: 1px solid #ccc;
}
table.importenttable td {
    width: 349px;
    padding: 10px;
    vertical-align: top;
    border-top: 1px solid #ccc;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}

input{margin-bottom:200px; margin-left:185px;
      padding:10px;  background-color:#eff7f0;}

   #mlink{
             list-style-type:none;
             list-style-position:inside;
             text-align:center;
             margin-left: -45px;
             margin-right : -5px;

            }
      #mlink li{
                display:inline;
               }
      #mlink li:hover{opacity: 0.5;}
      footer {

            color: #f5f5f5;
            height : 150px;
            }
      footer.text-center{background-color: #2d2d30;}
      footer a {color: #f5f5f5;}
      footer a:hover {
                  color: #777;
                  text-decoration: none;
                  }


  </style>
  <script>
$(document).ready(function(){
// Initialize Tooltip
$('[data-toggle="tooltip"]').tooltip();
})

</script>
</head>

<body>
	<header>
   		<jsp:include page = "Top.jsp" flush = "false"/></header>

  <div id="wrapper">
  <header>
    <div class="centerbox">

  <img src="IncheonTourImage/Notice.jpg" alt="공지사항 설명박스"style="margin-left: auto; margin-right: auto; display: block;margin-top:200px;">
  <br>
  <br>
  <h2> 공지사항 </h2>
  <br>
  <br>
  <hr style="margin-bottom:50px;">


	</div>
    </header>

    <table class="importenttable">
        <tr>
            <th scope="row" >제목</th>
            <td colspan="3"><%= NTB.getNNA() %></td>
        </tr>
        <tr>
            <th scope="row">작성일</th>
            <td><%= NTB.getDATE() %></td>
            <th scope="row">작성자</th>
            <td><%= NTB.getNA() %></td>
        </tr>
        <tr>
            <th scope="row" rowspan="3">내용</th>
            <td rowspan="3" colspan="3" ><%= NTB.getCONTENT() %></td>
        </tr>
    </table>
    <button type = "button" onclick = "location.href = 'NoticeIndex.jsp'">이전으로</button>
	</div>
	<footer>
	<jsp:include page="Bottom.jsp" flush = "false"/></footer>
</body>
</html>