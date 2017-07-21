package com.book.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.book.service.BookRankService;
import com.book.vo.BookRankVO;

@Controller
public class BookRankController {

	@RequestMapping(value="bookrankUpdate.do", method=RequestMethod.POST)
	public String execute(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException {

		System.out.println("z");
		request.setCharacterEncoding("utf-8");

		String isbn = request.getParameter("isbn");
		String title = request.getParameter("title");
		BookRankService service = BookRankService.getInstance();
		BookRankVO bookrank = service.bookrankSearch(isbn);
		
		if(bookrank == null){
			bookrank = new BookRankVO(isbn, title, 1);
			service.bookrankInsert(bookrank);
		} else {
			service.bookrankUpdate(bookrank);
		}

		request.setAttribute("title", title);
		System.out.println(isbn);
		System.out.println(title);
		return "bookRankUpdateOutput";
	}
	
	
	@RequestMapping("bookrankList.do")
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("y");
		BookRankService service = BookRankService.getInstance();
		ArrayList<BookRankVO> list = service.BookRankList();

		request.setAttribute("list", list);
		return "bookRankListOutput";
		
	}
}
