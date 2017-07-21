package com.book.service;

import java.util.ArrayList;

import com.book.dao.BookDAO;
import com.book.vo.BookRankVO;

public class BookRankService {
	
	private static BookRankService service = new BookRankService();
	public BookDAO dao = BookDAO.getInstance();
	
	private BookRankService(){}

	public static BookRankService getInstance() {
		System.out.println("c");
		return service;
	}

	public BookRankVO bookrankSearch(String isbn) {
		BookRankVO bookrank = dao.bookrankSearch(isbn);
		return bookrank;
	}

	public void bookrankUpdate(BookRankVO bookrank) {
		System.out.println("update service");
		dao.bookrankUpdate(bookrank);
	}

	public ArrayList<BookRankVO> BookRankList() {
		ArrayList<BookRankVO> list = dao.bookRankList();
		System.out.println("list service");
		return list;
	}

	public void bookrankInsert(BookRankVO bookrank) {
		dao.bookrankInsert(bookrank);
		
	}
}
