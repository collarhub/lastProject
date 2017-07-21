<%@page import="com.bookdbda.vo.*"%>
<%@page import="com.bookdbda.etc.*"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	FollowListVO followList = (FollowListVO)request.getAttribute("followList");
	String json = Converter.convertToJson(followList);
%>
<%=json%>