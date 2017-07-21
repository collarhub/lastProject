<%@page import="com.bookdbda.vo.*"%>
<%@page import="com.bookdbda.etc.*"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ReviewsListVO reviewsList = (ReviewsListVO)request.getAttribute("reviewsList");
	String json = Converter.convertToJson(reviewsList);
%>
<%=json%>