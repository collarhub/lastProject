<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<title>테스트</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/book.css">
<style>
#center label {
	color: black;
	width: 170px;
	display: inline-block;
}

#center form {
	margin-left: 40px;
	margin-bottom: 20px;
}

#center input {
	margin: 5px;
	height: 30px;
}
</style>


<script type="text/javascript">
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#UploadedImg').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
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
				<a class="navbar-brand" href="index.jsp">책을 디비다</a>
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
						String id = (String) session.getAttribute("id");
						if (id != null && !id.equals("")) { //로그인 했을 경우
					%>
					<li><a href="blog.jsp?id=<%=id%>">블로그</a></li>
					<%
						}
					%>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<%
								if (id != null && !id.equals("")) { //로그인 했을 경우
							%>
							<li><a href="searchInput.do">회원검색</a></li>
							<li><a href="updateInput.do">회원정보수정</a></li>
							<li><a href="logoutInput.do">(<%=(String) session.getAttribute("id")%>)
									로그아웃
							</a></li>
							<%
								} else {
							%>
							<li><a href="loginInput.do">로그인</a></li>
							<li><a href="insertInput.do">회원가입</a></li>
							<%
								}
							%>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>

	<div id="center">
		<form action="insertInput.do" method="post" style="color: black">
		<h1>회원가입</h1>
			<hr>
			<h3>가입을 위하여 회원님의 정보를 정확히 입력해주세요.</h3>
			<label>아이디</label> <input type="text" name="member_id"
				onkeydown="inputIdChk()" value="${member_id }" autofocus required>
			&nbsp; <a href="idCheck.do">아이디 체크하러 가기</a> <br> <label>비밀번호</label>
			<input type="password" name="password" value="${member.password_id }"
				required><br> <label>닉네임</label><input type="text"
				name="nickname" value="${member.nickname }" required><br>
			<label>이메일</label><input type="text" name="email"
				placeholder="xxxxxx@gmail.com" value="${member.email }" required><br>
			<label>생년월일</label><input type="date" name="birth_date"
				value="${member.birth_date }" required><br> <label>전화번호</label><input
				type="text" name="phone" value="${member.phone }" required><br>
			<label>주소</label><input type="text" name="addr"
				value="${member.addr }" required><br> <label>사진</label><input
				type="file" name="photo" onchange="readURL(this);"><br>
			<img id="UploadedImg" src="default.jpg" width="85" height="111"><br>
			<br> <label>점수</label><input type="text" name="rank" value="0"
				disabled><br>
			<br> <input type="submit" value="회원가입"> <input
				type="reset" value="재입력"> ${error1 }
		</form>
	</div>


	<footer style="background-color: #000000; color: #ffffff">
		<div class="container">
			<br>
			<div class="row">
				<div class="col-sm-2" style="text-align: center;">
					<h5>Copyright &copy; 2017</h5>
					<h5>서정우</h5>
				</div>
				<div class="col-sm-4">
					<h4>대표자 소개</h4>
					<p>저는 서정우 입니다.</p>
				</div>
				<div class="col-sm-2">
					<h4 style="text-align: center;">책사러 가기</h4>
					<div class="list-group">
						<a href="#" class="list-group-item">인터파크</a> <a href="#"
							class="list-group-item">YES24</a> <a href="#"
							class="list-group-item">알라딘</a>
					</div>
				</div>
				<div class="col-sm-2">
					<h4 style="text-align: center;">SNS</h4>
					<div class="list-group">
						<a href="#" class="list-group-item">페이스북</a> <a href="#"
							class="list-group-item">유투브</a> <a href="#"
							class="list-group-item">네이버</a>
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

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>