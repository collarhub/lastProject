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
	</head>
	<body>
		<style type="text/css">
			.jumbotron{
				background-image:url('images/book.jpg');
				background-size:cover;
				text-shadow: black 0.2em 0.2em 0.2em;
				color: white;
			}
		</style>
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
					<li><a href="#">도서정보</a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">장르<span class ="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">소설</a></li>
								<li><a href="#">교육</a></li>
								<li><a href="#">문화</a></li>
								<li><a href="#">사회</a></li>
								<li><a href="#">정치</a></li>
							</ul>
						</li>
					</ul>
					<form class="navbar-form navbar-left">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="책을 검색해요">
					</div>
					<button type="submit" class="btn btn-default">검색</button>
					</form>
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
				<h1 class="text-center">책을 디비다 </h1>
				<p class="text-center">안녕하세요. 원하는 도서를 검색하고 리뷰를 확인하세요.</p>
				
				<form role="form" action="bookSelectProc.jsp" method="post">
                    <div class="form-group">
			<div class="col-xs-2">
			<select class="form-control" name="bysearch">
      				<option value="title">Title</option>
      				<option value="publisher">Publisher</option>
      				<option value="author">Author</option>
      				<option value="content">Content</option>
      				<option value="isbn">ISBN</option>
    			</select>
			</div>
			<div class="col-xs-9">
	                        <input type="text" name="keyword" class="form-control"></input>
			</div>
			<div class="col-xs-1">
				<span class="input-group-gtn">
				<button type="submit" name="page" value="1" class="btn btn-primary">
				<span class="glyphicon glyphicon-search"></span>
			</button></span>
			</div>
			</div>
                    </p><br><br>
		</form><br><br>
		
				<p class = "text-center"><a class="btn btn-primary btn-lg" href="review.html" role="button">리뷰 보러 가기</a> </p>
			</div>
			<div class="row">
				<div class="col-md-6" style="color:black">
					<h4>금주의 베스트 셀러 </h4>
					<p style="color:black">[교보문고]</p>
					<img src="best.jpg" width=500 height=160>
					<p><a class="btn btn-default"  href="http://book.naver.com/bestsell/bestseller_list.nhn?cp=kyobo" target="_blank">자세히 보기 </a></p>
				</div>
				<div class="col-md-3" style="color:black">
					<h4>베스트 리뷰자</h4>
					<p style="color:black">여기는 뭐하지</p>
					<p><a class="btn btn-default" href="#">자세히 보기 </a></p>
				</div>
				<div class="col-md-3" style="color:black">
					<h4>랭킹</h4>
					<p style="color:black">자신의 랭킹을 확인해 보세요!</p>
					<p><a class="btn btn-default" href="rankInput.do">자세히 보기 </a></p>
				</div>
			</div>
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