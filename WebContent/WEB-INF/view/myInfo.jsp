<%@page import="com.bookdbda.vo.*"%>
<%@page import="com.bookdbda.etc.*"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberVO member = (MemberVO)request.getAttribute("member");
	String json = Converter.convertToJson(member);
%>
<%=json%>