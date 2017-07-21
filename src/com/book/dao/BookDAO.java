package com.book.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.book.vo.BookRankVO;

public class BookDAO {
	private static BookDAO dao = new BookDAO();
	private BookDAO(){}

	public static BookDAO getInstance() {
		return dao;
	}

	public Connection connect() {
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
		} catch (Exception ex) {
			System.out.println("���� �߻� : " + ex);
		}
		return conn;
	}

	public void close(Connection conn, PreparedStatement ps, ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (Exception ex) {
				System.out.println("���� �߻� : " + ex);				
			}
		}
		close(conn, ps);
	} // close

	public void close(Connection conn, PreparedStatement ps) {
		if (ps != null) {
			try {
				ps.close();
			} catch (Exception ex) {
				System.out.println("���� �߻� : " + ex);				
			}
		}

		if (conn != null) {
			try {
				conn.close();
			} catch (Exception ex) {
				System.out.println("���� �߻� : " + ex);				
			}
		}
	} // close

	public void bookrankInsert(BookRankVO bookrank) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		

		try {
			conn = connect();
			pstmt = conn.prepareStatement("insert into bookrank values(?,?,?)");
			pstmt.setString(1, bookrank.getIsbn());
			pstmt.setString(2, bookrank.getTitle());
			pstmt.setInt(3, bookrank.getGoodpoint());
			pstmt.executeUpdate();
			System.out.println("insert dao");
		} catch (Exception ex) {
			System.out.println("���� �߻� : " + ex);
		} finally {
			close(conn, pstmt);
		}
	}
	
	public void bookrankUpdate(BookRankVO bookrank) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = connect();
			pstmt = conn.prepareStatement("update bookrank set title=?, goodpoint=? where isbn=?");
			pstmt.setString(1, bookrank.getTitle());
			pstmt.setInt(2, bookrank.getGoodpoint()+1);
			pstmt.setString(3, bookrank.getIsbn());
			pstmt.executeUpdate();
			System.out.println("update dao");
		} catch (Exception ex) {
			System.out.println("���� �߻� : " + ex);
		} finally {
			close(conn, pstmt);
		}
	}

	
	public BookRankVO bookrankSearch(String isbn) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		BookRankVO bookrank = null;

		try {
			conn = connect();
			pstmt = conn.prepareStatement("select * from bookrank where isbn=?");
			pstmt.setString(1, isbn);
			pstmt.executeUpdate();
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bookrank = new BookRankVO(rs.getString(1),rs.getString(2),rs.getInt(3));
			}
			System.out.println("search dao");
		} catch (Exception ex) {
			System.out.println("���� �߻� : " + ex);
		} finally {
			close(conn, pstmt, rs);
		}

		return bookrank;
	}

	public ArrayList<BookRankVO> bookRankList() {
		ArrayList<BookRankVO> list = new ArrayList<BookRankVO>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		BookRankVO bookrank = null;

		try {
			conn = connect();
			pstmt = conn.prepareStatement("select * from bookrank order by goodpoint desc");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				bookrank = new BookRankVO(rs.getString(1),rs.getString(2),rs.getInt(3));
				list.add(bookrank);
			}
			System.out.println("list dao");
		} catch (Exception ex) {
			System.out.println("���� �߻� : " + ex);
		} finally {
			close(conn, pstmt, rs);
		}

		return list;
	}
}
