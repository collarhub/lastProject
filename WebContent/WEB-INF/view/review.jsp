<%@page import="com.bookdbda.vo.*"%>
<%@page import="com.bookdbda.etc.*"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ReviewListVO reviewList = (ReviewListVO)request.getAttribute("reviewList");
	String json = Converter.convertToJson(reviewList);
%>
<%=json%>