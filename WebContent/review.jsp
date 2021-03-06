<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>16-final</title>
<link rel="stylesheet" type="text/css" href="jpaginate/style.css" />
<link rel="stylesheet" type="text/css" href="waitme/waitMe.css" />
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.0/themes/humanity/jquery-ui.css" />
<link href="css/bootstrap.min.css" rel="stylesheet">
<style>
	body { }
    input.text { margin-bottom:12px; width:95%; padding: .4em; }
    
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.0.js"></script>
<script src="https://www.jsviews.com/download/jsrender.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<script src="waitme/waitMe.js"></script>
<script src="jpaginate/jquery.paginate.js"></script>
<script type="text/javascript">
$(document).ready(function() {

	// 1. 공통 변수, 옵션
	var param = { pageno:1, pagesize:10 };
	var totalPage = 0;

	var pageOption = {
		count : 1,
		start : 1,
		display : 10,
		border : true,
		border_color : "#333333",
		text_color : "#ffffff",
		background_color : "#cb842e",	
		border_hover_color : "#333333",
		text_hover_color  : "#000000",
		background_hover_color : "#cb842e", 
		images : false,
		mouse : "press",
		onChange : function(page) {
			param.pageno = page;
			viewReviewList();
		}
	};
	
	// 2. 공통 함수
	var viewReviewList = function() {
		$.get("viewReviewList.do", param, function(data) {
			if(data != null) {
				$("#reviewlist").empty();
				var tmpl = $.templates("#tmpl_review");
				var str = tmpl.render(data.reviewList.reviewList);
				$("#reviewlist").html(str);

				totalPage = Math.floor((data.totalCount - 1) / param.pagesize) + 1;
			}
			else {
				totalPage = 1;
			}
			pageOption.count = totalPage;
			pageOption.start = param.pageno;
			$("#paging").paginate(pageOption);
		});
	};

				var ajaxLoading = function(isLoading) {
					if (isLoading == false) {
						$("body").waitMe("hide");
					} else {
						$("body").waitMe({
							effect : "ios",
							text : "처리중입니다.",
							bg : 'rgba(255,255,255,0.7)',
							color : '#000',
							source : 'waitme/img.svg',
						});
					}
				};

				// 3. 이벤트 처리
				$(document).ajaxStart(function() {
					ajaxLoading(true);
				}).ajaxStop(function() {
					ajaxLoading(false);
				});

				// 4. 화면 초기화 코드
				viewReviewList();

			});
</script>
<script id="tmpl_review" type="text/x-jsrender">
	<tr>
		<td>{{:review_id}}</td>
		<td>{{:book_id}}</td>
		<td><a href="reviewRead.do?review_id={{:review_id}}">{{:title}}</a></td>
		<td>{{:member_id}}</td>
		<td>{{:regist_date}}</td>
		<td>{{:click}}</td>
		<td>{{:score}}</td>
		<td>
			<a href="reviewUpdate.do?review_id={{:review_id}}" role="button" 
				class="update ui-button ui-button ui-state-default ui-button-text-only">
				<span class="ui-button-text">수정</span>
			</button>
			<a href="reviewDelete.do?review_id={{:review_id}}" role="button" 
				class="delete ui-button ui-button ui-state-default ui-button-text-only">
				<span class="ui-button-text">삭제</span>
			</button>		
		</td>
	</tr>
</script>
<style>
footer {
	position: fixed;
	bottom: 0px;
}
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

	<div class="container">
		<div class="row">
			<div class="col-sm-12 col-md-12 col-lg-12">
				<h2 class="ui-widget ui-header">리뷰 게시판</h2>
				<button role="button" id="btnNewReview"
					class="add ui-button ui-button ui-state-default ui-button-text-only">
					<a href="write.jsp"><span class="ui-button-text">글쓰기</span></a>
				</button>
				<div id="output" style="text-align: center; width: 830px; height:1000px">
					<table id="review_table" style="border: solid 1px black;">
						<thead>
							<tr style="background-color: #cb842e; color: white; ">
								<th style="width: 80px; text-align:center;">번호</th>
								<th style="width: 150px; text-align:center;">책제목</th>
								<th style="width: 250px; text-align:center;">제목</th>
								<th style="width: 90px; text-align:center;">작성자</th>
								<th style="width: 100px; text-align:center;">등록일</th>
								<th style="width: 60px; text-align:center;">조회수</th>
								<th style="width: 60px; text-align:center;">추천</th>
								<th style="width: 120px; text-align:center;">기능</th>
							</tr>
						</thead>
						<tbody id="reviewlist">

						</tbody>
					</table>
					<div id="paging"></div>
				</div>
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
	
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
	<script src="js/bootstrap.min.js"></script>
</body>
</html>