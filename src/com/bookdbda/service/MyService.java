package com.bookdbda.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import com.bookdbda.dao.MyDAO;
import com.bookdbda.vo.FavoriteListVO;
import com.bookdbda.vo.FollowListVO;
import com.bookdbda.vo.MemberVO;
import com.bookdbda.vo.ReviewListVO;
import com.bookdbda.vo.ReviewVO;
import com.bookdbda.vo.ReviewsListVO;

public class MyService {

	public MemberVO searchMember(String member_id) {
		MemberVO member = new MyDAO().searchMember(member_id);
		return member;
	}

	public FollowListVO searchFollowList(String member_id) {
		FollowListVO followList = new MyDAO().searchFollow(member_id);
		return followList;
	}
	
	public ReviewListVO searchReviewList(String member_id) {
		ReviewListVO reviewList = new MyDAO().searchReviewList(member_id);
		return reviewList;
	}

	public FavoriteListVO searchFavoriteList(String member_id) {
		FavoriteListVO favoriteList = new MyDAO().searchFavoriteList(member_id);
		return favoriteList;
	}

	public ReviewsListVO getReviewsList() {
		ReviewsListVO reviewsList = new MyDAO().getReviewsList();
		return reviewsList;
	}
	
	public ReviewsListVO getReviewsList(int pageno, int pagesize) {
		ReviewsListVO reviewsList = new MyDAO().getReviewsList(pageno, pagesize);
		return reviewsList;
	}
	
	public String searchBook(String book_id) {
		String clientId = "vD0fkj0A4tNlZ5Sr8EfX";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "biicc6PyY4";//애플리케이션 클라이언트 시크릿값";
        try {
            String enBook_id = URLEncoder.encode(book_id, "UTF-8");
            
            //String apiURL = "https://openapi.naver.com/v1/search/blog?query="+ text; // json 결과
            String apiURL = "https://openapi.naver.com/v1/search/book_adv.json?d_isbn=" + enBook_id;// json 결과
            //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream(), "UTF-8"));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            String result = response.toString();
            int start = result.indexOf("\"title\": \"") + 10;
            int end = result.indexOf("\"", result.indexOf("\"title\": \"") + 10);
            return result.substring(start, end);
        } catch (Exception e) {
            System.out.println(e);
        	return null;
        }
	}
	
	public String searchBook(String title, String pageno, String pagesize) {
        String clientId = "vD0fkj0A4tNlZ5Sr8EfX";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "biicc6PyY4";//애플리케이션 클라이언트 시크릿값";
        try {
            String enTitle = URLEncoder.encode(title, "UTF-8");
            int intPageno = Integer.parseInt(pageno);
            int intPagesize = Integer.parseInt(pagesize);
            int intStart = (intPageno - 1) * intPagesize + 1;
            String enStart = URLEncoder.encode(intStart + "", "UTF-8");
            String enPagesize = URLEncoder.encode(pagesize, "UTF-8");
            
            //String apiURL = "https://openapi.naver.com/v1/search/blog?query="+ text; // json 결과
            String apiURL = "https://openapi.naver.com/v1/search/book_adv.json?"
            				+ "start=" + enStart + "&"
            				+ "d_titl=" + enTitle + "&"
            				+ "display=" + enPagesize; // json 결과
            //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream(), "UTF-8"));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            //System.out.println(response.toString());
            return response.toString();
        } catch (Exception e) {
            //System.out.println(e);
        	return null;
        }
    }

	public static void main(String[] args) {
		//System.out.println(new MyService().searchBook("자바바", "1", "3"));
		System.out.println(new MyService().searchBook("8968481474 9788968481475"));
	}

	public String getNextReviewID() {
		String review_id = new MyDAO().getNextReviewID();
		return review_id;
	}

	public void insertReview(ReviewVO review) {
		new MyDAO().insertReview(review);
	}

	public ReviewVO getReview(String review_id) {
		ReviewVO review = new MyDAO().getReview(review_id);
		return review;
	}

	public void deleteReview(String review_id) {
		new MyDAO().deleteReview(review_id);
	}

	public void updateReview(ReviewVO review) {
		new MyDAO().updateReview(review);
	}

	public void addFollow(String member_id, String follower_id) {
		new MyDAO().addFollow(member_id, follower_id);
	}
}
