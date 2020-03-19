<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import = "java.util.*, ICproject.*" %>
<jsp:useBean id="memMgr" class="ICproject.MemberManager"/>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <meta charset="utf-8">
    <link href="https://fonts.googleapis.com/css?family=Stylish&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cute+Font&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com`/css?family=Gamja+Flower&display=swap" rel="stylesheet">
    <title>인천투어</title>
    <link href="Index.css" rel="stylesheet" type="text/css">
</head>
	<body>

	 <header>
	 <jsp:include page="Top.jsp" flush="false"/></header>
	    <contents>
	     <div class="container-fluid bg-1 text-center">
	      <br><br><br><br><br><br><br><br><br><br><br><br>
	      <img src="IncheonTourImage/mainChar.gif" alt="symbol"><br>

	      <p class ="mainFont">인천투어</p>
	        </div>
	        	<div class = "wrapper">
	      <article class = "season">
	      <div class="container-fluid text-center bg-grey">
	        <br><br><br><br><br><br><br>
	        <div class ="radiousBox">
	          <br>
	        <h2>인천의 사계절 놓치지 마세요!</h2><br><br><br>
	        <div class = "seasonTop">
	        <div class="row text-center">
	          <div class="col-sm-4">
	            <div class="thumbnail">
	              <a href="#miniapril">
	              <img src="IncheonTourImage/miniapril.png" class="img-circle" alt="minapril">
	              <div class = "wol">
	              <div class ="fontChange">
	              <p>4월:아는사람들만 안다는</p>
	              </div>
	              <p><strong>벚꽃인천</strong></p>
	              </div>
	               </a>
	            </div>
	          </div>
	          <div class="col-sm-4">
	            <div class="thumbnail">
	              <a href="#miniaugust">
	              <img src="IncheonTourImage/august.jpg" class="img-circle" alt="miniaugust">
	              <div class = "wol">
	              <div class ="fontChange">
	              <p>8월:여름밤,신나게 놀아보자!</p>
	              </div>
	              <p><strong>펜타포트 락 페스티벌</strong></p>
	            </div>
	             </a>
	            </div>
	          </div>
	        </div>
	      </div>
	          <div class="container-fluid text-center bg-grey">
	            <div class = "seasonBottom">
	            <div class="row text-center">
	              <div class="col-sm-4">
	                <div class="thumbnail">
	                  <a href="#minioctober">
	                  <img src="IncheonTourImage/minioctober.png" class="img-circle" alt="minioctober">
	                  <div class = "wol">
	                  <div class ="fontChange">
	                  <p>10월:붉게 물든 인천</p>
	                  </div>
	                  <p><strong>추억에 잠긴 가을</strong></p>
	                </div>
	                </a>
	              </div>
	              </div>
	              <div class="col-sm-4">
	                <div class="thumbnail">
	                <a href="#minijanuary">
	                  <img src="IncheonTourImage/minijanuary.png" class="img-circle" alt="minijanuary">
	                  <div class = "wol">
	                  <div class ="fontChange">
	                  <p>1월:겨울여행추천</p>
	                  </div>
	                  <p><strong>강화도 빙어낚시 체험</strong></p>
	                </div>
	                </a>
	                </div>
	              </div>
	     		 </div>
	            </div>
	            <div class="clear"></div>
	    </div>
	  </div>
	  </article>
	    <article class ="gongji">
	      <ul id = "gongjisahang">
	      	  <li class = "gongjiTitle"><strong><a href = "NoticeIndex.jsp">공지사항</a></strong></li>
	      	  <% 
				ArrayList<NoticeBean> nResult = memMgr.getNoticeList(1); 
				for (int i = 0; i < nResult.size(); i++) {
				%>
	          <li><a href="NoticeContent.jsp?NUM=<%= nResult.get(i).getNUM() %>"><%= nResult.get(i).getNNA() %></a></li>
	          <% 
	          } 
	          %>
	      </ul>
	</article>
	<article>
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
	  <!-- Indicators -->
	  <ol class="carousel-indicators">
	    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
	    <li data-target="#myCarousel" data-slide-to="1"></li>
	    <li data-target="#myCarousel" data-slide-to="2"></li>
	  </ol>
	  <article class = "bbs">
	  <!-- Wrapper for slides -->
	  <div class="carousel-inner" role="listbox">
	    <div class="item active">
	      <img src="IncheonTourImage/BBS1.png" alt="BBS1">
	      <div class="carousel-caption">
	      </div>
	    </div>

	    <div class="item">
	      <img src="IncheonTourImage/BBS2.png" alt="BBS2">
	      <div class="carousel-caption">
	      </div>
	    </div>

	    <div class="item">
	      <img src="IncheonTourImage/BBS3.png" alt="BBS3">
	      <div class="carousel-caption">
	      </div>
	    </div>
	  </div>
	</article>
	  <!-- Left and right controls -->
	  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
	    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	    <span class="sr-only">Previous</span>
	  </a>
	  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
	    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	    <span class="sr-only">Next</span>
	    	    <div class="clear"></div>
	  </a>
	</div>
	</article>
	<div class="clear"></div>
	  <article class = "nemo">
	    <div class="container-fluid text-center bg-grey">
	      <div class="row text-center">
	        <div class="col-sm-3">
	          <div class="thumbnail">
	          	<a href="#hwangsando">
	            	<img src="IncheonTourImage/hwangsando.png" alt="hwangsando">
	            	<p>돛단배 모양의 어판장,<br>바다 낚시터가 있는 강화 황산도</p>
	            </a>
	          </div>
	        </div>
	        <div class="col-sm-3">
	          <div class="thumbnail">
	          	<a href="#sogeumgil">
	            	<img src="IncheonTourImage/sogeumgil.png" alt="sogeumgil">
	            	<p>김장철이면 생각나는 서민들의<br> 애환이 담긴 소금길을 걷다.</p>
	            </a>
	          </div>
	        </div>
	        <div class="col-sm-3">
	          <div class="thumbnail">
	          	<a href="#jjajangmyun">
	            	<img src="IncheonTourImage/jjajangmyun.png" alt="jjajangmyun">
	           		<p>짜장면박물관 짜장면의 시초 공화춘</p>
	           	</a>
	          </div>
	        </div>
	        <div class="col-sm-3">
	          <div class="thumbnail">
	            <a href="#activity">
	            <img src="IncheonTourImage/activity.png" alt="activity">
	            <p>2019 가을 ver. 인천 액티비티4</p>
	            </a>
	          </div>
	        </div>
	      </div>
	    </div>
	    <div class="container-fluid text-center bg-grey">
	      <div class="row text-center">
	        <div class="col-sm-3">
	          <div class="thumbnail">
	          	<a href="onsen">
	            <img src="IncheonTourImage/onsen.png"  alt="onsen">
	            <p>찬바람 불 때 떠나자! 가까운 인천온천 <br>여행, 석모도 미네랄 온천</p>
	            </a>
	          </div>
	        </div>
	        <div class="col-sm-3">
	          <div class="thumbnail">
	          	<a href="snack">
	            <img src="IncheonTourImage/snack.png"  alt="snack">
	            <p>50년을 흐르는 맛-인천의 옛날과자점들</p>
	            </a>
	          </div>
	        </div>
	        <div class="col-sm-3">
	          <div class="thumbnail">
	          	<a href="dreampark">
	            <img src="IncheonTourImage/dreampark.png" alt="dreampark">
	            <p>핑크뮬리와 코스모스의 천국 인천 드림파크</p>
	            </a>
	          </div>
	        </div>
	        <div class="col-sm-3">
	          <div class="thumbnail">
	          	<a href="#sorae">
	            <img src="IncheonTourImage/sorae.png" alt="sorae">
	            <p>맛있는 인천나들이 장소,<br> 소래포구 포차거리</p>
	          	</a>
	          </div>
	        </div>
	      </div>
	    </div>
	    <div class="clear"></div>
	  </article>

    </contents>
    <footer> <jsp:include page="Bottom.jsp" flush="false"/></footer>
  </body>
</html>

