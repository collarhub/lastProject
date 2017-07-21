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
			#center label{
			color:black;
			width:170px;
			display:inline-block;}
			#center form{
			margin-left:40px;
			margin-bottom:20px;
			}
			#center input{
			margin:5px;
			height:30px;}
			
		</style>
	</head>
	<body>
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapsed" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
					<span class="sr-only"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="index.jsp">책을 디비다</a>
			</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="index.jspl">소개<span class="sr-only"></span></a></li>
					<li><a href="#">도서정보</a></li>
					<li><a href="review.jsp">리뷰</a>
						<li class="dropdown">
							<a href="bookInput.jsp" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">장르<span class ="caret"></span></a>
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
						<li><a href="blog.jsp?id=<%=id%>">블로그</a></li><%}%>
						<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">접속하기<span class ="caret"></span></a>
						<ul class="dropdown-menu">
									<%
								
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
		
		<div id="center">
			<form action="searchInputDetail.do" method="post" style = "color:black">
				<h1>회원검색</h1><hr>
				<h3>아이디를 통하여 보고싶은 '책을 디비다' 회원을 검색해주세요.<br><br></h3>
				<label>아이디</label>  <input type="text" name="member_id" autofocus value="${member.member_id }">
				<input type="submit" value="검색">${error } ${error1 } ${error2 }<br><br>
				<p style="color:black">※ 회원 전체를 검색하실 수 있습니다.</p>
			</form>
			
				<form action="searchInput.do" method="post" style="color:black">
				<input type="submit" value="전체검색"><br>
				</form>
				
			
		</div>		
		
		<footer style="background-color:#000000; color:#ffffff">
			<div class="container">
				<br>
				<div class="row">
					<div class="col-sm-2" style="text-align:center;"><h5>Copyright &copy; 2017</h5><h5>서정우</h5></div>
					<div class="col-sm-4"><h4>대표자 소개</h4><p>저는 서정우 입니다. </p></div>
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