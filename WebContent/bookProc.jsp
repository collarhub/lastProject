<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="book" class="com.book.vo.BookVO"/>
<jsp:setProperty property="*" name="book"/>
 <%= book %>
<hr>
<jsp:getProperty property="title" name="book"/><br>
<jsp:getProperty property="link" name="book"/><br>
<jsp:getProperty property="image" name="book"/><br>
<jsp:getProperty property="author" name="book"/><br>
<jsp:getProperty property="price" name="book"/><br>
<jsp:getProperty property="discount" name="book"/><br>
<jsp:getProperty property="publisher" name="book"/><br>
<jsp:getProperty property="pubdate" name="book"/><br>
<jsp:getProperty property="isbn" name="book"/><br>
<jsp:getProperty property="description" name="book"/><br>