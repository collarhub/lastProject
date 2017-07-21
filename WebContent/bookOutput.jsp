<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.book.vo.BookVO"%>
<%@page import="java.util.*"%>
<%
	ArrayList<BookVO> booklist = (ArrayList<BookVO>) request.getAttribute("result");
	String bysearch = request.getParameter("bysearch");
	System.out.println(bysearch);
	String keyword = request.getParameter("keyword");
	System.out.println(keyword);
	System.out.println(booklist);
	System.out.println(request.getParameter("page"));
	System.out.println(Integer.parseInt(request.getParameter("page")));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Round About - Start Bootstrap Template</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/round-about.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>

</script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet"/>
</head>

<body>

    <!-- Navigation -->
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
					<li><a href="bookInput.jsp">도서정보</a></li>
					<li><a href="review.jsp">리뷰</a>
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

    <!-- Page Content -->
    <div class="container">
		<br><br><br><br>

        <!-- Introduction Row -->
        <div class="row">
            <div class="col-lg-12">
                <form role="form" action="bookSelectProc.jsp" method="post">
                    </p><div class="form-group">
			<div class="col-xs-2">
			<select class="form-control" name="bysearch">
      				<option value="title" selected>Title</option>
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
                    </p>
		</form>
            </div>
        </div>

        <hr>
     

        <!-- Team Members Row -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">검색 결과</h2>
            </div>
        </div>
        
        <% if (booklist.size() != 0) {
        	System.out.println(booklist.size());
        	for(int i=0 ; i<=booklist.size()-1; i++){ 
        	System.out.println(i);%>
        
        <div class="row">
        <form role="form" action="bookRanking.jsp" method="post">
            <div class="col-md-1">
                <img class="img-responsive" src="<%= booklist.get(i).getImage() %>" alt="">
            </div>
            <div class="col-md-10">
                <h4><a href="<%= booklist.get(i).getLink() %>"><%= booklist.get(i).getTitle() %></a>
                    <small><%= booklist.get(i).getAuthor() %></small></h4>
                    <font color = "#707070">
                <ul class="list-inline">
    				<li><%= booklist.get(i).getPublisher() %></li> |
    				<li><%= booklist.get(i).getPubdate() %></li> |
    				<li><%= booklist.get(i).getDiscount() %>원</li> |
  				</ul></font>
                <p><%= booklist.get(i).getDescription() %>
            </div><input type="hidden" name="isbn" value="<%= booklist.get(i).getIsbn() %>">
            <div class="col-md-1">
            	<br><br><br><br><button type="submit" class="btn btn-primary btn-sm btn-circle">좋아요</button>
            </div>
          </form>
         </div>
         <hr>
         
         <% } } else { %>검색 결과가 없습니다.<% } %>
        <hr>
     
		<!-- Pagination -->
        <div class="row text-center">
        	<div class="col-lg-12">
        		<div id="paging"></div>
        	</div>
        	<div class="col-lg-3"></div>
            <div class="col-lg-6">
                <ul class="pagination">
                    <li class="sr-only">
                        <a href="bookSelectProc.jsp?bysearch=<%=request.getParameter("bysearch") %>&keyword=<%= request.getParameter("keyword") %>&page=<%= request.getParameter("page") %>" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span></a>
                    </li>
                    <li id="CurrentPage">
                        <a href="bookSelectProc.jsp?bysearch=<%=request.getParameter("bysearch") %>&keyword=<%= request.getParameter("keyword") %>&page=1">1</a>
                    </li>
                    <li id="CurrentPage">
                        <a href="bookSelectProc.jsp?bysearch=<%=request.getParameter("bysearch") %>&keyword=<%= request.getParameter("keyword") %>&page=2">2</a>
                    </li>
                    <li id="CurrentPage">
                        <a href="bookSelectProc.jsp?bysearch=<%=request.getParameter("bysearch") %>&keyword=<%= request.getParameter("keyword") %>&page=3">3</a>
                    </li>
                    <li id="CurrentPage">
                        <a href="bookSelectProc.jsp?bysearch=<%=request.getParameter("bysearch") %>&keyword=<%= request.getParameter("keyword") %>&page=4">4</a>
                    </li>
                    <li id="CurrentPage">
                        <a href="bookSelectProc.jsp?bysearch=<%=request.getParameter("bysearch") %>&keyword=<%= request.getParameter("keyword") %>&page=5">5</a>
                    </li>
                    <li id="CurrentPage">
                        <a href="bookSelectProc.jsp?bysearch=<%=request.getParameter("bysearch") %>&keyword=<%= request.getParameter("keyword") %>&page=6">6</a>
                    </li>
                    <li id="CurrentPage">
                        <a href="bookSelectProc.jsp?bysearch=<%=request.getParameter("bysearch") %>&keyword=<%= request.getParameter("keyword") %>&page=7">7</a>
                    </li>
                    <li id="CurrentPage">
                        <a href="bookSelectProc.jsp?bysearch=<%=request.getParameter("bysearch") %>&keyword=<%= request.getParameter("keyword") %>&page=8">8</a>
                    </li>
                    <li id="CurrentPage">
                        <a href="bookSelectProc.jsp?bysearch=<%=request.getParameter("bysearch") %>&keyword=<%= request.getParameter("keyword") %>&page=9">9</a>
                    </li>
                    <li id="CurrentPage">
                        <a href="bookSelectProc.jsp?bysearch=<%=request.getParameter("bysearch") %>&keyword=<%= request.getParameter("keyword") %>&page=10">10</a>
                    </li>
                    <li>
                        <a href="#" aria-label="Next"><span aria-hidden="false">&raquo;</span></a>
                    </li>
                </ul>
                
            </div>
            <div class="col-lg-3">
            <div class="well">
                <form action="bookSelectProc.jsp" class="pageNumberForm"  type="GET">
  				  <input type="text" name="page" class="pageNumber" min="1" max="1000" size="1" />페이지로 이동
  				  <input type="hidden" name="bysearch" value="<%=request.getParameter("bysearch") %>" />
  				  <input type="hidden" name="keyword" value="<%=request.getParameter("keyword") %>" />  
  				  <span class="input-group-gtn">
  				  <a href="bookSelectProc.do">
					<button type="submit" class="btn btn-primary">
					<span class="glyphicon glyphicon-search"></span>
					</button></a></span>
				</form>
				</div>​​​​​​​​​​​​​​​​​​​​​​​​​
            </div>
        </div>
      
        <!-- /.row -->

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; My Website 2017</p>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>