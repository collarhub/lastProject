<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="jpaginate/style.css" />
<link rel="stylesheet" type="text/css" href="waitme/waitMe.css" />
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.0/themes/humanity/jquery-ui.css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.0.js"></script>
<script src="https://www.jsviews.com/download/jsrender.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<script src="waitme/waitMe.js"></script>
<script src="jpaginate/jquery.paginate.js"></script>
<script src="js/bootstrap.min.js"></script>
<style>
input:disabled, textarea:disabled {
	background: white;
}
</style>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapsed" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.html">책을 디비다</a>
			</div>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="index.jsp">소개<span
							class="sr-only"></span></a></li>
					<li><a href="#">도서정보</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">장르<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">소설</a></li>
							<li><a href="#">교육</a></li>
							<li><a href="#">문화</a></li>
							<li><a href="#">사회</a></li>
							<li><a href="#">정치</a></li>
						</ul></li>
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
		<div class="row">
			<div class="col-sm-12 col-md-12 col-lg-12">
				<h2 class="ui-widget ui-header">리뷰</h2>
				<div id="output" style="text-align: center; width: 630px;">
					<form action="reviewUpdate.do?review_id=${ review.review_id }" method="post" id="inputForm">
						<table id="review_table" style="border: solid 1px black;">
							<tr style="background-color: #cb842e; color: white;">
								<td style="width: 60px;">제목</td>
								<td style="background-color: white; color: black;"><input
									type="text" style="width: 100%" id="title" name="title" disabled value="${ review.title }"></td>
							</tr>
							<tr style="background-color: #cb842e; color: white;">
								<td style="width: 60px;">책제목</td>
								<td style="background-color: white; color: black;">
									<input type="text" style="width: 100%" id="inputTitle"
									name="book_title" disabled value="${ book_title }"></td>
							</tr>
							<tr style="background-color: #cb842e; color: white;">
								<td style="width: 60px;">내용</td>
								<td style="background-color: white; color: black;"><textarea
										rows="15" cols="80" style="resize: none;" name="content" disabled>${ review.content }</textarea></td>
							</tr>
						</table>
						<a href="review.jsp"
							class="add ui-button ui-button ui-state-default ui-button-text-only"
							role="button" id="btnNewReview"> <span class="ui-button-text">목록</span></a>

						<input type="submit" role="button" id="btnNewReview"
							class="add ui-button ui-button ui-state-default ui-button-text-only"
							value="수정"> <input type="hidden" name="member_id"
							id="member_id" value="a">
					</form>
				</div>
			</div>
		</div>
	</div>

	<footer style="background-color: #000000; color: #ffffff; width: 100%">
		<div class="container">
			<br>
			<div class="row">
				<div class="col-sm-2" style="text-align:center;"><h5>Copyright &copy; 2017</h5><h5>서정우</h5></div>
					<div class="col-sm-4"><h4>대표자 소개</h4><p>저는 서정우 입니다. </p></div>
					<div class="col-sm-2"><h4 style="text-align:center;">책사러 가기</h4>
					<div class="list-group">
						<a href="#" class="list-group-item">인터파크</a>
							<a href="#" class="list-group-item">YES24</a>
							<a href="#" class="list-group-item">알라딘</a>
					</div>
				</div>
				<div class="col-sm-2">
					<h4 style="text-align: center;">SNS</h4>
					<div class="list-group">
						<a href="#" class="list-group-item">페이스북</a>
							<a href="#" class="list-group-item">유투브</a>
							<a href="#" class="list-group-item">네이버</a>
					</div>
				</div>
				<div class="col-sm-2">
					<h4 style="text-align: center;">
						<span class="glyphicon glyphicon-ok"></span>&nbsp;by 서정우
					</h4>
				</div>
			</div>
		</div>
	</footer>
	
	<script src="js/bootstrap.min.js"></script>
</body>
</html>