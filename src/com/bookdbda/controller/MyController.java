package com.bookdbda.controller;

import java.sql.Date;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bookdbda.service.*;
import com.bookdbda.vo.*;

@Controller
public class MyController {
	@RequestMapping("myInfo.do")
	public ModelAndView myInfo(@RequestParam String member_id) {
		ModelAndView mav = new ModelAndView();
		MemberVO member = new MyService().searchMember(member_id);
		mav.addObject("member", member);
		mav.setViewName("myInfo");
		return mav;
	}
	@RequestMapping("follow.do")
	public ModelAndView follow(@RequestParam String member_id) {
		ModelAndView mav = new ModelAndView();
		FollowListVO followList = new MyService().searchFollowList(member_id);
		mav.addObject("followList", followList);
		mav.setViewName("follow");
		return mav;
	}
	@RequestMapping("review.do")
	public ModelAndView review(@RequestParam String member_id) {
		ModelAndView mav = new ModelAndView();
		ReviewListVO reviewList = new MyService().searchReviewList(member_id);
		mav.addObject("reviewList", reviewList);
		mav.setViewName("review");
		return mav;
	}
	@RequestMapping("favorite.do")
	public ModelAndView favorite(@RequestParam String member_id) {
		ModelAndView mav = new ModelAndView();
		FavoriteListVO favoriteList = new MyService().searchFavoriteList(member_id);
		mav.addObject("favoriteList", favoriteList);
		mav.setViewName("favorite");
		return mav;
	}
	@RequestMapping("viewReviewList.do")
	public ModelAndView reviewList(@RequestParam String pageno, @RequestParam String pagesize) {
		ModelAndView mav = new ModelAndView();
		int intPageno = 0;		
		int intPagesize = 3; 		
		
		try { intPageno = Integer.parseInt(pageno);  } catch(Exception e) { }
		try { intPagesize = Integer.parseInt(pagesize);  } catch(Exception e) { }

		ReviewsListVO reviewsList = null;
		if (intPageno == 0) {
			reviewsList = new MyService().getReviewsList();
		} else {
			reviewsList = new MyService().getReviewsList(intPageno, intPagesize);
		}
		mav.addObject("reviewsList", reviewsList);
		mav.setViewName("reviews");
		return mav;
	}
	@RequestMapping("bookSearch.do")
	public ModelAndView bookSearch(@RequestParam String title, @RequestParam String pageno, @RequestParam String pagesize) {
		ModelAndView mav = new ModelAndView();
		String result = new MyService().searchBook(title, pageno, pagesize);
		mav.addObject("result", result);
		mav.setViewName("bookSearch");
		return mav;
	}
	@RequestMapping(value = "write.do", method = RequestMethod.POST)
	public String write(@RequestParam String title, @RequestParam String book_id,
								@RequestParam String content, @RequestParam String member_id) {
		String review_id = new MyService().getNextReviewID();
		Date regist_date = new java.sql.Date(new java.util.Date().getTime());
		int click = 0, score = 0;
		ReviewVO review = new ReviewVO(review_id, title, member_id, regist_date, click, book_id, content, score);
		new MyService().insertReview(review);
		return "write";
	}
	@RequestMapping(value = "write2.do", method = RequestMethod.POST)
	public String write2(@RequestParam String title, @RequestParam String book_id,
								@RequestParam String content, @RequestParam String member_id,
								@RequestParam String review_id, @RequestParam String click, @RequestParam String score) {
		Date regist_date = new java.sql.Date(new java.util.Date().getTime());
		ReviewVO review = new ReviewVO(review_id, title, member_id, regist_date, Integer.parseInt(click), book_id, content, Integer.parseInt(score));
		new MyService().updateReview(review);
		return "write";
	}
	@RequestMapping("reviewRead.do")
	public ModelAndView reviewRead(@RequestParam String review_id) {
		ModelAndView mav = new ModelAndView();
		ReviewVO review = new MyService().getReview(review_id);
		String book_title = new MyService().searchBook(review.getBook_id());
		mav.addObject("review", review);
		mav.addObject("book_title", book_title);
		mav.setViewName("reviewread");
		return mav;
	}
	@RequestMapping("reviewDelete.do")
	public String reviewDelete(@RequestParam String review_id) {
		new MyService().deleteReview(review_id);
		return "reviewdelete";
	}
	@RequestMapping("reviewUpdate.do")
	public ModelAndView reviewUpdate(@RequestParam String review_id) {
		ModelAndView mav = new ModelAndView();
		ReviewVO review = new MyService().getReview(review_id);
		String book_title = new MyService().searchBook(review.getBook_id());
		mav.addObject("review", review);
		mav.addObject("book_title", book_title);
		mav.setViewName("reviewupdate");
		return mav;
	}
}
