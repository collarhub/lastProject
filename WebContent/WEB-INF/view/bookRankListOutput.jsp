<%@page import="com.book.vo.BookRankVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html>
<head>
<title>도서 순위</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
th{
text-align:center;}
</style>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
  <div class="jumbotron">
    <h1>도서순위</h1> 
    <p>'책을디비자' 내 추천을 받은 책들입니다.</p> 
  </div>
<%  ArrayList<BookRankVO> list = (ArrayList<BookRankVO>) request.getAttribute("list"); 
    if(!list.isEmpty()) {  %>
    <div class="table-responsive">
	   <table class="table table-bordered table-hover" border="1">
	   		<tr><th>제목</th><th>추천수</th></tr>
			
			<%   for(int i=0; i<list.size(); i++){   
			       BookRankVO bookrank = list.get(i);   %>
			       
			        <tr><td><%=bookrank.getTitle() %></td>
			            <td><%=bookrank.getGoodpoint() %></td>
			       </tr>
			       
			<%   }
       }else{
    	   out.print("<h3>등록된 도서순위가 없습니다.</h3>");
       }
	%>
	  </table></div></div>
</body>
</html>