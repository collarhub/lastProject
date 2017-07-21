package com.bookdbda.dao;

import java.sql.*;
import java.util.ArrayList;

import com.bookdbda.vo.*;

public class MyDAO {
	public Connection connect() {
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	public MemberVO searchMember(String member_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVO member = null;

		try {
			conn = connect();
			pstmt = conn.prepareStatement("select * from member where member_id = ?");
			pstmt.setString(1, member_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				member = new MemberVO(rs.getString(1), rs.getString(2), rs.getString(3),
						rs.getString(4), rs.getDate(5), rs.getString(6),
						rs.getString(7), rs.getString(8), rs.getInt(9));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return member;
	}

	public FollowListVO searchFollow(String member_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		FollowListVO followList = null;
		ArrayList<FollowVO> followArrayList = new ArrayList<>();

		try {
			conn = connect();
			pstmt = conn.prepareStatement("select * from follow where member_id = ?");
			pstmt.setString(1, member_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				followArrayList.add(new FollowVO(rs.getString(1), rs.getString(2)));
			}
			followList = new FollowListVO(followArrayList);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return followList;
	}
	
	public ReviewListVO searchReviewList(String member_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ReviewListVO reviewList = null;
		ArrayList<ReviewVO> reviewArrayList = new ArrayList<>();

		try {
			conn = connect();
			pstmt = conn.prepareStatement("select * from review where member_id = ?");
			pstmt.setString(1, member_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				reviewArrayList.add(new ReviewVO(rs.getString(1), rs.getString(2)
												,rs.getString(3), rs.getDate(4)
												,rs.getInt(5), rs.getString(6)
												,rs.getString(7), rs.getInt(8)));
			}
			reviewList = new ReviewListVO(reviewArrayList);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return reviewList;
	}

	public FavoriteListVO searchFavoriteList(String member_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		FavoriteListVO favoriteList = null;
		ArrayList<FavoriteVO> favoriteArrayList = new ArrayList<>();

		try {
			conn = connect();
			pstmt = conn.prepareStatement("select * from follow where member_id = ?");
			pstmt.setString(1, member_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				favoriteArrayList.add(new FavoriteVO(rs.getString(1), rs.getString(2)));
			}
			favoriteList = new FavoriteListVO(favoriteArrayList);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return favoriteList;
	}

	public ReviewsListVO getReviewsList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ReviewsListVO reviewsList = null;
		ReviewListVO reviewList = null;
		ArrayList<ReviewVO> reviewArrayList = new ArrayList<>();

		try {
			conn = connect();
			pstmt = conn.prepareStatement("select * from review");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				reviewArrayList.add(new ReviewVO(rs.getString(1), rs.getString(2)
						,rs.getString(3), rs.getDate(4)
						,rs.getInt(5), rs.getString(6)
						,rs.getString(7), rs.getInt(8)));
			}
			reviewList = new ReviewListVO(reviewArrayList);
			reviewsList = new ReviewsListVO(0, 0, reviewArrayList.size(), reviewList);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return reviewsList;
	}
	
	public ReviewsListVO getReviewsList(int pageno, int pagesize) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ReviewsListVO reviewsList = null;
		ReviewListVO reviewList = null;
		ArrayList<ReviewVO> reviewArrayList = new ArrayList<>();
		int startIndex = (pageno-1) * pagesize;
		int endIndex = startIndex+pagesize-1;
		int totalCount = 0;

		try {
			conn = connect();
			pstmt = conn.prepareStatement("select count(*) from review");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalCount = rs.getInt(1);
				if (startIndex > totalCount - 1 || startIndex < 0 || pagesize < 1) {
					//reviewArrayList = new ArrayList<ReviewVO>();
				} else  {
					if (endIndex > totalCount - 1){
						endIndex = totalCount - 1;
					}
					pstmt = conn.prepareStatement("select to_char(nreview_id) review_id, title, member_id, "
												+ "regist_date, click, book_id, content, "
												+ "score from "
												+ "(select rownum rn, to_number(review_id) nreview_id, title, "
												+ "member_id, regist_date, click, book_id, "
												+ "content, score "
												+ "from review order by nreview_id desc) "
												+ "where rn >= ? and rn <= ?");
					pstmt.setString(1, "" + (startIndex + 1));
					pstmt.setString(2, "" + (endIndex + 1));
					rs = pstmt.executeQuery();
					while(rs.next()) {
						reviewArrayList.add(new ReviewVO(rs.getString(1), rs.getString(2)
														,rs.getString(3), rs.getDate(4)
														,rs.getInt(5), rs.getString(6)
														,rs.getString(7), rs.getInt(8)));
					}
					reviewList = new ReviewListVO(reviewArrayList);
					reviewsList = new ReviewsListVO(pageno, pagesize, totalCount, reviewList);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return reviewsList;
	}

	public String getNextReviewID() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String review_id = null;

		try {
			conn = connect();
			pstmt = conn.prepareStatement("select to_char(max(to_number(review_id)) + 1) from review");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				review_id = rs.getString(1);
			}
			if(review_id == null) {
				review_id = "1";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return review_id;
	}

	public void insertReview(ReviewVO review) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String review_id = null;

		try {
			conn = connect();
			pstmt = conn.prepareStatement("insert into review values (?, ?, ?, ?, "
																	+ "?, ?, ?, ?)");
			pstmt.setString(1, review.getReview_id());
			pstmt.setString(2, review.getTitle());
			pstmt.setString(3, review.getMember_id());
			pstmt.setDate(4, review.getRegist_date());
			pstmt.setInt(5, review.getClick());
			pstmt.setString(6, review.getBook_id());
			pstmt.setString(7, review.getContent());
			pstmt.setInt(8, review.getScore());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public ReviewVO getReview(String review_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ReviewVO review = null;

		try {
			conn = connect();
			pstmt = conn.prepareStatement("select * from review where review_id = ?");
			pstmt.setString(1, review_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				review = new ReviewVO(rs.getString(1), rs.getString(2), rs.getString(3),
									rs.getDate(4), rs.getInt(5), rs.getString(6),
									rs.getString(7), rs.getInt(8));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return review;
	}

	public void deleteReview(String review_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = connect();
			pstmt = conn.prepareStatement("delete from review where review_id = ?");
			pstmt.setString(1, review_id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public void updateReview(ReviewVO review) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String review_id = null;

		try {
			conn = connect();
			pstmt = conn.prepareStatement("update review set title = ?, "
														+ "member_id = ?, "
														+ "regist_date = ?, "
														+ "click = ?, "
														+ "book_id = ?, "
														+ "content = ?, "
														+ "score = ? "
														+ "where review_id = ?");
			pstmt.setString(1, review.getTitle());
			pstmt.setString(2, review.getMember_id());
			pstmt.setDate(3, review.getRegist_date());
			pstmt.setInt(4, review.getClick());
			pstmt.setString(5, review.getBook_id());
			pstmt.setString(6, review.getContent());
			pstmt.setInt(7, review.getScore());
			pstmt.setString(8, review.getReview_id());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
