<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import = "java.util.*, ICproject.*" %>
<jsp:useBean id="memMgr" class="ICproject.MemberManager"/>

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
<title>공지사항</title>

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

   table.importenttable{
     margin-left:185px;
   }

   table.importenttable {
       border-collapse: collapse;
       text-align: left;
       line-height: 1.5;

   }
   table.importenttable thead th {
       padding: 10px;
       font-weight: bold;
       vertical-align: top;
       color: #369;
       border-bottom: 3px solid #036;
   }
   table.importenttable tbody th {
       width: 150px;
       padding: 10px;
       font-weight: bold;
       vertical-align: top;
       border-bottom: 1px solid #ccc;
       background: #f3f6f7;
   }
   table.importenttable td {
       width: 300px;
       padding: 10px;
       vertical-align: top;
       border-bottom: 1px solid #ccc;
   }
   #count{margin-left:185px; margin-top:20px; margin-bottom:200px;}

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

  <img src="IncheonTourImage/Notice.jpg"alt="공지사항 설명박스"style="margin-left: auto; margin-right: auto; display: block; margin-top:200px;">
    <hr>
  <br>
  <br>
   <h2> 공지사항 </h2>
  <br>
  <br>
  <hr>
	
	</div>
    </header>
    
	<% 
	int pageNum = 1;
	int pv = 1;
	
	if (request.getParameter("pageNum") != null) {
		pageNum = Integer.parseInt(request.getParameter("pageNum"));
	}
	%>
	
  <table class="importenttable">
    <thead>
    <tr>
        <th scope="cols">No.</th>
        <th scope="cols">제목</th>
        <th scope="cols">작성자</th>
        <th scope="cols">조회수</th>
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
</div>

<div id=count>
	<%
		if (pageNum != 1) { %>
			<a href="NoticeIndex.jsp?pageNum=<%=pageNum-1%>"> 이전 </a>
			<a href="NoticeIndex.jsp?pageNum=<%=pageNum-pv%>"><%=pageNum-pv%> </a>
	<%
		} 
	%> 
      <a href="NoticeIndex.jsp?pageNum=<%=pageNum%>"><%=pageNum%></a>
    <%	
    	while(memMgr.nextPage(pageNum + pv)) { 
    		%><a href="NoticeIndex.jsp?pageNum=<%=pageNum+pv%>"><%=pageNum+pv%> </a><%
    		if (memMgr.nextPage(pageNum + (++pv)) == false) { 
    		break;
    		}
    	} 
    
    if (memMgr.nextPage(pageNum + 1)) { %>
	<a href="NoticeIndex.jsp?pageNum=<%=pageNum + 1%>"> 다음 </a>
	<% } %>

</div>
<footer>
<jsp:include page="Bottom.jsp" flush = "false"/></footer>
</body>
</html>