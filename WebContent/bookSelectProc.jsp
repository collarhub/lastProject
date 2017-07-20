<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.book.vo.BookVO" %>
<%@ page import="com.book.service.NaverBookService" %>


<%
	System.out.println(request.getParameter("page"));
	NaverBookService naverservice = new NaverBookService();
	List<BookVO> a = new ArrayList<BookVO>();
	
	request.setCharacterEncoding("utf-8");
	String bysearch = request.getParameter("bysearch");
	System.out.println(bysearch);
	String keyword = request.getParameter("keyword");
	System.out.println(keyword);
	String pageNum = request.getParameter("page");
	System.out.println(pageNum);
	int pagenum = 10*Integer.parseInt(pageNum)-9;
	System.out.println(pagenum);
	
	/* if(request.getParameter("page")==null){
		request.setAttribute("page", 1);
		int pageNum = 1;
	}else{
		int pageNum = Integer.parseInt(request.getParameter("page"));
	}
	System.out.println(request.getParameter("page")); */
	
	
	if(bysearch.equals("title")){
		for(BookVO b : naverservice.searchBookbyTitle(keyword, 10, pagenum))
	        a.add(b);
	}else if(bysearch.equals("author")){
		for(BookVO b : naverservice.searchBookbyAuthor(keyword, 10, pagenum))
	    	a.add(b);
	}else if(bysearch.equals("publisher")){
		for(BookVO b : naverservice.searchBookbyPublisher(keyword, 10, pagenum))
	    	a.add(b);
	}else if(bysearch.equals("isbn")){
		for(BookVO b : naverservice.searchBookbyIsbn(keyword, 10, pagenum))
	    	a.add(b);
	}else if(bysearch.equals("content")){
		for(BookVO b : naverservice.searchBookbyContent(keyword, 10, pagenum))
	    	a.add(b);
	}
	
	request.setAttribute("result", a);
	
	System.out.println(a.size());
	System.out.println(a);
			
	/* if(a==null){
		request.setAttribute("error", "검색결과가 없습니다");
	}else{
		request.setAttribute("result", a);
		request.setAttribute("error", null);
	} */
	
	
	RequestDispatcher rd = request.getRequestDispatcher("bookOutput.jsp");
	rd.forward(request, response);
%>