<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*, java.text.SimpleDateFormat" %>

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
<title>공지사항 작성</title>
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

             .textform{
                max-width: 500px;
                padding: 20px 12px 10px 20px;
                font: 18px Arial, Helvetica, sans-serif;
              margin-left:185px;

            }
             .textform label{
                display: block;
                margin: 0px 0px 20px 0px;
             }
             .textform label > span{
                width: 150px;
                font-weight: bold;
                float: left;
                padding-top: 8px;
                padding-right: 20px;
             }
             .textform span.required{
                color:red;
             }
             .textform .tel-number-field{
                width: 40px;
                text-align: center;
             }
             .textform input.input-field, .form-style-2 .select-field{
                width: 60%;
             }

             .textform input.input-field,
             .textform .tel-number-field,
             .textform .textarea-field,
              .textform .select-field{
                box-sizing: border-box;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                border: 1px solid #C2C2C2;
                box-shadow: 1px 1px 4px #EBEBEB;
                -moz-box-shadow: 1px 1px 4px #EBEBEB;
                -webkit-box-shadow: 1px 1px 4px #EBEBEB;
                border-radius: 3px;
                -webkit-border-radius: 3px;
                -moz-border-radius: 3px;
                padding: 7px;
                outline: none;
             }
             .textform .input-field:focus,
             .textform .tel-number-field:focus,
             .textform .textarea-field:focus,
             .textform .select-field:focus{
                border: 1px solid #0C0;
             }
             .textform .textarea-field{
               margin-top: 20px;
                height:300px;
                width: 1000px;
             }
             .textform input[type=submit],
             .textform input[type=button]{
                border: none;
                padding: 8px 15px 8px 15px;
                background: #FF8500;
                color: #fff;
                box-shadow: 1px 1px 4px #DADADA;
                -moz-box-shadow: 1px 1px 4px #DADADA;
                -webkit-box-shadow: 1px 1px 4px #DADADA;
                border-radius: 3px;
                -webkit-border-radius: 3px;
                -moz-border-radius: 3px;
             }
             .textform input[type=submit]:hover,
             .textform input[type=button]:hover{
                background: #EA7B00;
                color: #fff;
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
    
	<%  SimpleDateFormat time = new SimpleDateFormat("yyyy-MM-dd");
		Calendar nTime = Calendar.getInstance();
		String today = time.format(nTime.getTime());
	%>
	
	<div class="textform">
	<form method = "post" action = "AddNoticeProc.jsp">
		<label for="field1"><span>제목 <span class="required"></span></span><input type="text" class="input-field" name="NNA" /></label> 
		<label for="field2"><span>작성일 <span class="required"></span></span><input type="text" class="input-field" name="DATE" value = "<%= today %>"></label>
		<label for="field3"><span>작성자 <span class="required"></span></span><input type="text" class="input-field" name="NA" value = "관리자"/></label>
		<label for="field4"><span>글 내용 <span class="required"></span></span><textarea name="CONTENT" class="textarea-field" style="resize: none;"></textarea></label>
		<label><span> </span><input type="submit" value="작성완료" style="margin-bottom: 100px; margin-left: 900px;"/></label>
	</form>
	</div>
    </div>

	
</body>
</html>