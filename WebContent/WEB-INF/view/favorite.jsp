<%@page import="com.bookdbda.vo.*"%>
<%@page import="com.bookdbda.etc.*"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	FavoriteListVO favoriteList = (FavoriteListVO)request.getAttribute("favoriteList");
	String json = Converter.convertToJson(favoriteList);
%>
<%=json%>