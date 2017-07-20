package com.book.member;

import java.util.ArrayList;

public class MemberService {
	private static MemberService service = new MemberService();
	public MemberDAO dao = MemberDAO.getInstance();
	
	private MemberService(){}
	
	public static MemberService getInstance() {
		return service;
	}

	public void memberInsert(MemberVO member) {
		dao.memberInsert(member);
	}
	
	public int memberLogin(String member_id, String password){
		int result = dao.memberLogin(member_id, password);
		return result;
	}
		
	public boolean memberIdCheck(String id){
		boolean result = dao.memberIdCheck(id);
		return result;
	}
	
	public void memberUpdate(MemberVO member){
		dao.memberUpdate(member);
	}
	
	public ArrayList<MemberVO> memberSearch(String id) {
		ArrayList<MemberVO> list = dao.memberSearch(id);
		return list;
	}
	
	public ArrayList<MemberVO> memberList(){
		ArrayList<MemberVO> list = dao.memberList();
		return list;
	}
	
	public ArrayList<MemberVO> memberRank(String rank){
		ArrayList<MemberVO> list = dao.memberRank(rank);
		return list;
	}
}
