<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width", initial-scale="1">
		<title>테스트</title>
		<link rel="stylesheet" href="css/bootstrap.css">
		<link rel="stylesheet" href="css/book.css">
		<style>
    	
   		 #id { font-size:12pt;  }    
		</style>
	</head>
	<body>
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
					<span class="sr-only"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="index.jsp">책을 디비다</a>
			</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="index.jsp">소개<span class="sr-only"></span></a></li>
					<li><a href="bookInput.jsp">도서검색</a></li>
					<li><a href="bookrankList.do">도서순위</a></li>	
					</ul>
					
					<ul class="nav navbar-nav navbar-right">
						<%
								String id = (String)session.getAttribute("id");
								if(id!=null && !id.equals("")){		//로그인 했을 경우
							%>
						<li><a href="index.html?id=<%=id%>">블로그</a></li><%}%>
						
						<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">접속하기<span class ="caret"></span></a>
						<ul class="dropdown-menu">
									<%
								//String id = (String)session.getAttribute("id");
								if(id!=null && !id.equals("")){		//로그인 했을 경우
							%>
									<li><a href="searchInput.do">회원검색</a></li>
	 								<li><a href="updateInput.do">회원정보수정</a></li>
									<li><a href="logoutInput.do">(<%=(String)session.getAttribute("id") %>)  로그아웃</a></li>
							<%}else{%>								
									<li><a href="loginInput.do">로그인</a></li>
									<li><a href="insertInput.do">회원가입</a></li>
							<%} %>
						</ul>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		<div class="container">
		<div class="jumbotron">
		<h2>책에 관한 명언</h2>
		<p>다음을 읽으면 책을 읽어야 하는 이유를 알 수 있습니다. 마음의 양식인 책을 많이 읽고, 원하시는 책은 도서검색 페이지를 이용하시면 됩니다.</p>
		</div>
		<p><h4>신용호 :</h4></p>
			<blockquote><h5>사람은 책을 만들고 책은 사람을 만든다.</h5></blockquote>
		<p><h4>스마일즈 :</h4></p>
			<blockquote><h5>사람의 품격을 그가 읽는 책으로서 판단할 수 있는 것은 마치 그가 교제하는 벗으로 판단되는 것과 같다.</h5></blockquote>
		<p><h4>벤자민 플랭클린 :</h4></p>
			<blockquote><h5>독서는 정신적으로 충실한 사람을 만든다. 사색은 사려깊은 사람을 만든다. 그리고 논술은 확실한 사람을 만든다.</h5></blockquote>
		<p><h4>프랭클린 :</h4></p>
			<blockquote><h5>과학 서적은 새로운 것을 읽고, 문학 서적은 오래된 작품을 읽어라.</h5></blockquote>
		<p><h4>벤자민 프랭클린 :</h4></p>
			<blockquote><h5>독서는 인간을 정신적으로 충실하고 명상으로써 심오하게 해줄 뿐만 아니라 영리한 두뇌를 만들어 준다.</h5></blockquote>
		<p><h4>G. 바슐라르 :</h4></p>
			<blockquote><h5>책은 꿈꾸는 걸 가르쳐 주는 진짜 선생이다.</h5></blockquote>
		<p><h4>키케로 :</h4></p>
			<blockquote><h5>책은 청년에게는 음식이 되고 노인에게는 오락이 된다. 부자일 때는 지식이 되고, 고통스러울 때면 위안이 된다.</h5></blockquote>
		<p><h4>키케로 :</h4></p>
			<blockquote><h5>방에 서적이 없는 것은 몸에 영혼이 없는 것과 같다.</h5></blockquote>
		<p><h4>칼라일 :</h4></p>
			<blockquote><h5>책 속에 모든 과거의 영혼이 잠잔다.
      	<br>오늘의 참다운 대학은 도서관이다.</h5></blockquote>
		<p><h4>리턴 :</h4></p>
			<blockquote><h5>법은 죽지만, 책은 죽지 않는다.</h5></blockquote>
		<p><h4>소크라테스 :</h4></p>
			<blockquote><h5>책은 정신의 음식이다.</h5></blockquote>
		<p><h4>앤드류 매튜스 :</h4></p>
			<blockquote><h5>아이디어를 듬뿍 주고 영감을 불러일으키는 책을 읽어라.</h5></blockquote>
		<p><h4>러스킨 :</h4></p>
			<blockquote><h5>책은 한번 읽히면 그 구실을 다하는 것이 아니다. 
		<br>재독하고 애독하며, 다시 손에 떼어 놓을 수 없는 애착을 느끼는 데서 그지없는 가치를 발견할 것이다.</h5></blockquote>
		<p><h4>베이컨 :</h4></p>
			<blockquote><h5>책은 늘 살아, 자기의 씨앗을 인간의 마음속에 심으며, 다가올 새로운 시대에 끝없이 행위나 의견을 불러일으킨다.</h5></blockquote>
		<p><h4>베이컨 :</h4></p>
			<blockquote><h5>독서는 완성된 사람을 만들고, 담론은 재치있는 사람을 만들고 필기는 정확한 사람을 만든다.</h5></blockquote>
		<p><h4>베이컨 :</h4></p>
			<blockquote><h5>지식은 곧 힘이다.</h5></blockquote>
		<p><h4>J. 에디슨 :</h4></p>
			<blockquote><h5>책은 위대한 천재가 인류에게 남겨 주는 유산이며, 아직 태어나지 않은 자손들에게 주는선물로서 한 세대에서 다른 세대로 전달된다.</h5></blockquote>
		<p><h4>에머슨 :</h4></p>
			<blockquote><h5>같은 책을 읽었다는 것은, 사람들 사이를 이어 주는 끈이다.</h5></blockquote>
		<p><h4>키케로 :</h4></p>
			<blockquote><h5>책이 없는 집은 문이 없는 주택과 같고 책이 없는 방은 혼이 빠진 육체와도 같다.</h5></blockquote>
		<p><h4>몽테스키외 :</h4></p>
			<blockquote><h5>독서를 즐기는 것은 권태로운 시간을 환희의 시간으로 바꾸는 일이다.
			<br>한 시간 정도 독서를 하면 어떠한 고통도 진정이 된다.</h5></blockquote>
		<p><h4>시이져 :</h4></p>
			<blockquote><h5>약으로써 병을 고치는 것과 마찬가지로 독서로써 마음을 다스린다.</h5></blockquote>
		<p><h4>데카르트 :</h4></p>
			<blockquote><h5>좋은 책을 읽는 것은 과거의 뛰어난 사람들과 대화를 나누는 것과 같다.</h5></blockquote>
		<p><h4>볼테르 :</h4></p>
			<blockquote><h5>이 세계는 거의 몇권의 책으로 지배되어 왔다.</h5></blockquote>
		<p><h4>생피에르 :</h4></p>
			<blockquote><h5>좋은 책은 좋은 친구와 같다.</h5></blockquote>
		<p><h4>체스터필드 :</h4></p>
			<blockquote><h5>가장 훌륭한 벗은 가장 좋은 책이다.</h5></blockquote>
		<p><h4>쇼펜하우어 :</h4></p>
			<blockquote><h5>독서란 자신의 머리가 남의 머리로 생각하는 것이다.</h5></blockquote>
		<p><h4>모옴 :</h4></p>
			<blockquote><h5>독서의 즐거움은 관능을 만족시키는 데 있는 게 아니라 지성을 만족시키는 데 있다.</h5></blockquote>
		<p><h4>몽테뉴 :</h4></p>
			<blockquote><h5>독서만큼 값이 싸면서도 오랫동안 즐거움을 누릴 수있는 것은 없다.</h5></blockquote>
		<p><h4>세네카 :</h4></p>
			<blockquote><h5>마음만을 즐겁게 하는 평범한 책들은 지천으로 깔려 있다. 따라서 의심할 바 없이 정신을 살찌우게 하는 책만을 읽어야 한다.</h5></blockquote>
		<p><h4>소크라테스 :</h4></p>
			<blockquote><h5>독서는 정신의 음악이다.</h5></blockquote>

		</div>
		<footer style="background-color:#000000; color:#ffffff">
			<div class="container">
				<br>
				<div class="row">
					<div class="col-sm-2" style="text-align:center;"><h5>Copyright &copy; 2017</h5><h5>서정우</h5></div>
					<div class="col-sm-4"><h4>대표자 소개</h4><p>저는 서정우 입니다. 도서 홈페이지 도서 홈페이지 도서 홈페이지  </p></div>
					<div class="col-sm-2"><h4 style="text-align:center;">책사러 가기</h4>
						<div class = "list-group">
							<a href="#" class="list-group-item">인터파크</a>
							<a href="#" class="list-group-item">YES24</a>
							<a href="#" class="list-group-item">알라딘</a>
						</div>
					</div>
					<div class="col-sm-2"><h4 style="text-align:center;">SNS</h4>
						<div class = "list-group">
							<a href="#" class="list-group-item">페이스북</a>
							<a href="#" class="list-group-item">유투브</a>
							<a href="#" class="list-group-item">네이버</a>
						</div>
					</div>
					<div class="col-sm-2"><h4 style="text-align:center;"><span class="glyphicon glyphicon-ok"></span>&nbsp;by 서정우</h4>
					</div>
				</div>
			</div>
		</footer>

		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="js/bootstrap.js"></script>
	</body>
</html>