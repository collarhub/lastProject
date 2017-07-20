package com.book.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDAO {
	private static MemberDAO dao = new MemberDAO();

	public MemberDAO() {
	}

	public static MemberDAO getInstance() {
		return dao;
	}

	public Connection connect() {
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
		} catch (Exception ex) {
			System.out.println("오류 발생 : " + ex);
		}
		return conn;
	}

	public void close(Connection conn, PreparedStatement ps, ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (Exception ex) {
				System.out.println("오류 발생 : " + ex);
			}
		}
		close(conn, ps);
	} // close

	public void close(Connection conn, PreparedStatement ps) {
		if (ps != null) {
			try {
				ps.close();
			} catch (Exception ex) {
				System.out.println("오류 발생 : " + ex);
			}
		}

		if (conn != null) {
			try {
				conn.close();
			} catch (Exception ex) {
				System.out.println("오류 발생 : " + ex);
			}
		}
	} // close

	public void memberInsert(MemberVO member) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = connect();
			pstmt = conn.prepareStatement("insert into member values(?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1, member.getMember_id());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getNickname());
			pstmt.setString(4, member.getEmail());
			pstmt.setString(5, member.getBirth_date());
			pstmt.setString(6, member.getPhone());
			pstmt.setString(7, member.getAddr());
			pstmt.setString(8, member.getPhoto());
			pstmt.setString(9, member.getRank());
			pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("오류발생 : " + ex);
		} finally {
			close(conn, pstmt);
		}
	}

	public int memberLogin(String member_id, String password) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// boolean b =false;
		int loginResult = 0;
		try {
			conn = connect();
			pstmt = conn.prepareStatement("select member_id, password from member where member_id=?");
			pstmt.setString(1, member_id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (rs.getString("member_id").equals(member_id)) {
					loginResult = 1;
					if (rs.getString("password").equals(password)) {
						loginResult = 2;
					}
				} else
					loginResult = 0; // id틀리면 0 , 비번틀리면 1, 맞으면 2
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return loginResult;

	}

	public boolean memberIdCheck(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean b = false;
		try {
			conn = connect();
			pstmt = conn.prepareStatement("select member_id from member where member_id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				System.out.println("exist");
				b = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return b;
	}

	public void memberUpdate(MemberVO member) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		
		try {
			conn = connect();
			pstmt = conn.prepareStatement(
					"update member set  password=?, nickname=?, email=?, birth_date=?, phone=?, addr=?, photo=?, rank=? where member_id=?");

			pstmt.setString(1, member.getPassword());
			pstmt.setString(2, member.getNickname());
			pstmt.setString(3, member.getEmail());
			pstmt.setString(4, member.getBirth_date());
			pstmt.setString(5, member.getPhone());
			pstmt.setString(6, member.getAddr());
			pstmt.setString(7, member.getPhoto());
			pstmt.setString(8, member.getRank());
			pstmt.setString(9, member.getMember_id());
			pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("오류 발생 : " + ex);
		} finally {
			close(conn, pstmt);
		}
	}
	
	public ArrayList<MemberVO> memberSearch(String id) {
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVO member = null;
		
		try {
			conn = connect();
			pstmt = conn.prepareStatement("select * from member where member_id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				member = new MemberVO();
				member.setMember_id(rs.getString(1));
				member.setPassword(rs.getString(2));
				member.setNickname(rs.getString(3));
				member.setEmail(rs.getString(4));
				member.setBirth_date(rs.getString(5));
				member.setPhone(rs.getString(6));
				member.setAddr(rs.getString(7));
				member.setPhoto(rs.getString(8));
				member.setRank(rs.getString(9));
				list.add(member);
			}

		} catch (Exception ex) {
			System.out.println("오류 발생 : " + ex);
		} finally {
			close(conn, pstmt, rs);
		}

		return list;
	}

	public ArrayList<MemberVO> memberList() {
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		MemberVO member = null;

		try {
			conn = connect();
			pstmt = conn.prepareStatement("select * from member");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				member = new MemberVO();
				member.setMember_id(rs.getString(1));
				member.setPassword(rs.getString(2));
				member.setNickname(rs.getString(3));
				member.setEmail(rs.getString(4));
				member.setBirth_date(rs.getString(5));
				member.setPhone(rs.getString(6));
				member.setAddr(rs.getString(7));
				member.setPhoto(rs.getString(8));
				member.setRank(rs.getString(9));
				list.add(member);
			}

		} catch (Exception ex) {
			System.out.println("오류 발생 : " + ex);
		} finally {
			close(conn, pstmt, rs);
		}

		return list;
	}
	
	public ArrayList<MemberVO> memberRank(String rank){
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVO member = null;
		
		try {
			conn = connect();
			pstmt = conn.prepareStatement("select * from member order by ? asc");
			pstmt.setString(1, rank);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				member = new MemberVO();
				member.setMember_id(rs.getString(1));
				member.setPassword(rs.getString(2));
				member.setNickname(rs.getString(3));
				member.setEmail(rs.getString(4));
				member.setBirth_date(rs.getString(5));
				member.setPhone(rs.getString(6));
				member.setAddr(rs.getString(7));
				member.setPhoto(rs.getString(8));
				member.setRank(rs.getString(9));
				list.add(member);
			}

		} catch (Exception ex) {
			System.out.println("오류 발생 : " + ex);
		} finally {
			close(conn, pstmt, rs);
		}

		return list;
	}
	
	
	
}