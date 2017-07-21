<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<style>
body {
	position: relative;
}

#top {
	min-height: 300px;
}

#left {
	background: url('image/img2.jpg') no-repeat;
	background-size: 100% 100%;
	bottom: 0px;
	top: 0px;
	left: 0px;
	right: 0px;
	position: fixed;
	text-align: center;
}

#right {
	background-color: white;
}

div.col-sm-9 div {
	font-size: 28px;
}

nav {
	z-index: 1;
}

footer {
	z-index: 1;
	position: fixed;
	bottom: 0px;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.0.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
			  $.extend({getUrlVars: function(){
			    var vars = [], hash;
			    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
			    for(var i = 0; i < hashes.length; i++)
			    {
			      hash = hashes[i].split('=');
			      vars.push(hash[0]);
			      vars[hash[0]] = hash[1];
			    }
			    return vars;
			  },
			  getUrlVar: function(name){
			    return $.getUrlVars()[name];
			  }
			 });
			  
		var member_id = $.getUrlVar("id");
		for(var i=0; i<10000000; i++){

		}

		$("#myInfo").html("<h1>My Info</h1>");
		$("#follow").html("<h1>Follower</h1>");
		$("#myBoard").html("");
		$("#favorite").html("");
		$.get({
			url : "myInfo.do",
			data : {
				member_id : member_id
			},
			success : function(data) {
				str = "<h1>My Info</h1>"
					+ "member_id : " + data.member_id
					+ "<br>password : " + data.password
					+ "<br>nickname : " + data.nickname
					+ "<br>email : " + data.email
					+ "<br>birth_date : " + data.birth_date
					+ "<br>phone : " + data.phone
					+ "<br>addr : " + data.addr
					+ "<br>photo : " + data.photo
					+ "<br>rank : " + data.rank
					+ "<hr>";
				$("#myInfo").html(str);
				$("#myBoard").html("");
				$("#favorite").html("");
			}
		});
		$.get({
			url : "follow.do",
			data : {
				member_id : member_id
			},
			success : function(data) {
				str0 = "<h1>Follower</h1>", s0 = "";
				data.followList.forEach(function(item, index) {
					s0 = "member_id : " + item.member_id
							+ "<br>follower_id : <a href=\"blog.jsp?id=" + item.follower_id + "\">" + item.follower_id + "</a>"
							+ "<br>";
					str0 = str0 + s0;
				});
				str0 = str0 + "<hr>";
				$("#follow").html(str0);
				$("#myBoard").html("");
				$("#favorite").html("");
			}
		});
		$("#btn-about").click(function() {
			$.get({
				url : "myInfo.do",
				data : {
					member_id : member_id
				},
				success : function(data) {
					str1 = "<h1>My Info</h1>"
						+ "member_id : " + data.member_id
						+ "<br>password : " + data.password
						+ "<br>nickname : " + data.nickname
						+ "<br>email : " + data.email
						+ "<br>birth_date : " + data.birth_date
						+ "<br>phone : " + data.phone
						+ "<br>addr : " + data.addr
						+ "<br>photo : " + data.photo
						+ "<br>rank : " + data.rank
						+ "<hr>";
					$("#myInfo").html(str1);
					$("#myBoard").html("");
					$("#favorite").html("");
				}
			});
			$.get({
				url : "follow.do",
				data : {
					member_id : member_id
				},
				success : function(data) {
					str2 = "<h1>Follower</h1>", s1 = "";
					data.followList.forEach(function(item, index) {
						s1 = "member_id : " + item.member_id
						+ "<br>follower_id : <a href=\"blog.jsp?id=" + item.follower_id + "\">" + item.follower_id + "</a>"
								+ "<br>";
						str2 = str2 + s1;
					});
					str2 = str2 + "<hr>";
					$("#follow").html(str2);
					$("#myBoard").html("");
					$("#favorite").html("");
				}
			});
		});
		$("#btn-review").click(function() {
			$.get({
				url : "review.do",
				data : {
					member_id : member_id
				},
				success : function(data) {
					str3 = "<h1>Review</h1>", s2 = "";
					data.reviewList.forEach(function(item, index) {
						s2 = "review_id : " + item.review_id
							+ "<br>title : " + item.title
							+ "<br>member_id : " + item.member_id
							+ "<br>regist_date : " + item.regist_date
							+ "<br>click : " + item.click
							+ "<br>book_id : " + item.book_id
							+ "<br>content : " + item.content
							+ "<br>score : " + item.score
							+ "<br>";
						str3 = str3 + s2;
					});
					str3 = str3 + "<hr>"
					$("#myInfo").html("");
					$("#follow").html("");
					$("#myBoard").html(str3);
					$("#favorite").html("");
				}
			});
		});
		$("#btn-favorite").click(function() {
			$.get({
				url : "favorite.do",
				data : {
					member_id : member_id
				},
				success : function(data) {
					str4 = "<h1>Favorite</h1>", s3 = "";
					data.favoriteList.forEach(function(item, index) {
						s3 = "member_id : " + item.member_id
								+ "<br>book_id : " + item.book_id
								+ "<br>";
						str4 = str4 + s3;
					});
					str4 = str4 + "<hr>"
					$("#myInfo").html("");
					$("#follow").html("");
					$("#myBoard").html("");
					$("#favorite").html(str4);
				}
			});
		});
		$("#btn-follow").click(function() {
			$.get({
				url : "addFollow.do",
				data : {
					member_id : member_id,
					follower_id : "<%=session.getAttribute("id")%>"
				},
				success : function(data1) {
				}
			});
			location.reload(true);
		});
	});
</script>
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
					<li class="active"><a href="index.jsp">소개<span class="sr-only"></span></a></li>
					<li><a href="bookInput.jsp">도서정보</a></li>
					<li><a href="review.jsp">리뷰</a>
					<li><a href="bookrankList.do">도서 순위</a></li>
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

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-6 col-lg-4" id="top">
				<div class="col-sm-3 col-md-6 col-lg-4" id="left">

				</div>
			</div>
			<div class="col-sm-9 col-md-6 col-lg-8" id="right">
				<div class="col-sm-10 col-md-10 col-lg-10">
				<a type="button" class="btn btn-default" id="btn-about">about</a>
				<a type="button" class="btn btn-default" id="btn-review">my board</a>
				<a type="button" class="btn btn-default" id="btn-favorite">favorite</a>
				</div>
				<div class="col-sm-2 col-md-2 col-lg-2">
				<a type="button" class="btn btn-primary" id="btn-follow" style="right: 0px">fallow</a>
				</div>
				<p id="myInfo"></p>
				<p id="follow"></p>
				<p id="myBoard"></p>
				<p id="favorite"></p>
				<div style="height: 500px"></div>
			</div>
		</div>
	</div>
	
	<footer style="background-color:#000000; color:#ffffff; width: 100%">
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
		
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>