<%@page import="com.bookdbda.vo.ReviewVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="jpaginate/style.css" />
<link rel="stylesheet" type="text/css" href="waitme/waitMe.css" />
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.0/themes/humanity/jquery-ui.css" />
<link href="css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.0.js"></script>
<script src="https://www.jsviews.com/download/jsrender.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<script src="waitme/waitMe.js"></script>
<script src="jpaginate/jquery.paginate.js"></script>
<style>
footer {
	position: fixed;
	bottom: 0px;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$("#input_dialog").dialog({
			autoOpen: false,
			modal : true
		});
		
		var detached;
		
		var totalPage = 0;
		
		var param = { pageno:1, pagesize:3 };
		
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
					viewResultList();
				}
			};
		
		var viewResultList = function() {
			$.get("bookSearch.do", {pageno:param.pageno, pagesize:param.pagesize, title:$("#bookTitle").val()}, function(data) {
				if(data.total != 0) {
					$("#resultList").empty();
					var tmpl = $.templates("#tmpl_result");
					var str =  tmpl.render(data.items);
					str = str.replace(/<b>/g, "");
					str = str.replace(/<\/b>/g, "");
					$("#resultList").html(str);
					totalPage = Math.floor((data.total-1)/ param.pagesize) + 1;
				}
				else {
					totalPage = 1;
				}
				pageOption.count = totalPage;
				pageOption.start = param.pageno;
				$("#input_dialog #paging").paginate(pageOption);
			});
		};	
		
		$("#btnSearch").click(function(e) {
			viewResultList();
			e.preventDefault();
		})
		
		var ajaxLoading = function(isLoading){
			if (isLoading == false) {
				$("body").waitMe("hide");
			} else {
				$("body").waitMe({
					effect: "ios",
					text: "처리중입니다.",
					bg: 'rgba(255,255,255,0.7)',
					color: '#000',
					source: 'waitme/img.svg',
				});			
			}
		};
		
		$(document).ajaxStart(function() {
			ajaxLoading(true);
		}).ajaxStop(function() {
			ajaxLoading(false);
		});
		
		var insert = function(isbn, title) {
			var param = $("form#f_contact").serialize();
			$("#isbnMain").val(isbn);
			$("#inputTitle").val(title);
			$("#input_dialog").dialog("close");
		};

		var cancelInput = function() {
			$("#input_dialog").dialog("close");
		};
		
		var initializeInputForm = function() {
			$("form#f_contact")[0].reset();
		};
		
		$("#resultList").on("click", ".book", function() {
			var isbn = $(this).data("isbn");
			var title = $(this).data("title");
			insert(isbn, title);
		});
		
		$("#btnBookSearch").click(function() {
			initializeInputForm();
			$("#input_dialog").dialog({
				modal : true,
				buttons : {
					"입력" : insert,
					"취소" : cancelInput
				}
			});
			$("#input_dialog").dialog("open");
			if($("#inputTitle").val() != "") {
				$("#bookTitle").val($("#inputTitle").val());
				viewResultList();
			}
		});
		
		$("#inputForm").on("click", "#btnNewReview", function(e) {
			if($("#title").val() == "" || $("#isbnMain").val() == "") {
				alert("글의 제목과 책 제목을 입력해주세요");
				e.preventDefault();
			}
			else {
				$("#isbnMain").removeAttr("disabled");
			}
		})
	});
</script>
<script id="tmpl_result" type="text/x-jsrender">
	<div><button class="book" data-title="{{:title}}" data-isbn="{{:isbn}}"><img src="{{:image}}"/></button></div>
</script>
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
					<li class="active"><a href="index.html">소개<span
							class="sr-only"></span></a></li>
					<li><a href="bookinfo.html">도서정보</a></li>
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
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">로그인</a></li>
							<li><a href="#">회원가입</a></li>
						</ul></li>
			</div>
		</div>
	</nav>

	<div class="container">
		<div class="row">
			<div class="col-sm-12 col-md-12 col-lg-12">
				<h2 class="ui-widget ui-header">글쓰기</h2>
				<div id="output" style="text-align: center; width: 630px;">
					<form action="write2.do" method="post" id="inputForm">
					<table id="review_table" style="border: solid 1px black;">
						<tr style="background-color: #cb842e; color: white;">
							<td style="width: 60px;">제목</td>
							<td style="background-color: white; color: black;"><input
								type="text" style="width: 100%" id="title" name="title" value="${ review.title }"></td>
						</tr>
						<tr style="background-color: #cb842e; color: white;">
							<td style="width: 60px;">책제목</td>
							<td style="background-color: white; color: black;">
							ISBN : <input type="text" name="book_id" id="isbnMain" value="${ review.book_id }" disabled="disabled">
							<input
								type="text" style="width: 85%" id="inputTitle" name="book_title" value="${ book_title }">
								<div role="button"
									class="ui-button ui-button ui-state-default ui-button-text-only"
									id="btnBookSearch"
									style="width: 10%">검색</div></td>
						</tr>
						<tr style="background-color: #cb842e; color: white;">
							<td style="width: 60px;">내용</td>
							<td style="background-color: white; color: black;"><textarea
									rows="15" cols="80" style="resize: none;" name="content">${ review.content }</textarea></td>
						</tr>
					</table>
					<a href="review.html" class="add ui-button ui-button ui-state-default ui-button-text-only" role="button">
					<span class="ui-button-text">취소</span></a>

					<input type="submit" role="button" id="btnNewReview"
						class="add ui-button ui-button ui-state-default ui-button-text-only" value="저장">
					<input type="hidden" name="member_id" id="member_id" value="a">
					<input type="hidden" name="review_id" id="review_id" value="${ review.review_id }">
					<input type="hidden" name="click" id="click" value="${ review.click }">
					<input type="hidden" name="score" id="score" value="${ review.score }">
					</form>
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

	<div id="input_dialog" title="책 제목 검색">
		<form id="f_contact">
			<input type="text" id="bookTitle">
			<button role="button"
				class="ui-button ui-button ui-state-default ui-button-text-only"
				id="btnSearch">검색</button>
		</form>
		<div id="resultList"></div>
		<div id="paging"></div>
	</div>

	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
	<!-- <script src="js/bootstrap.min.js"></script> -->
</body>
</html>