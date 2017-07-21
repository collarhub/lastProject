package com.book.member;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MemberController {

	@RequestMapping(value="insertInput.do", method=RequestMethod.GET)
	public String memberInput(){
		return "memberInsertInput";
	}	
	
	@RequestMapping(value = "insertInput.do", method = RequestMethod.POST)
	public String insertInput(@ModelAttribute("member") MemberVO member) {
		
	//유효성 
		MemberService service = MemberService.getInstance();
		/*	String id = member.getMember_id();
		boolean rs = service.memberIdCheck(id);
		System.out.println(rs);
		
		if(rs==true){
			request.setAttribute("error", "아이디가 이미 존재합니다.");
			return "memberInsertInput";
		}
		else{*/
			service.memberInsert(member);
			return "memberInsertOutput";
	//	}	
		
	}
			
	
	@RequestMapping(value="idCheck.do", method=RequestMethod.GET)
	public String idCheck(){
		return "idCheckInput";
	}	
	
	@RequestMapping(value = "idCheck.do", method = RequestMethod.POST)
	public String idCheck(String member_id, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
	//유효성 
			
		MemberService service = MemberService.getInstance();
		boolean rs = service.memberIdCheck(member_id);
		if(member_id==""){
			request.setAttribute("error1", "아이디는 공백일 수 없습니다.");
			return "idCheckInput";
		}
		else{
			if(rs==true){
				request.setAttribute("error", "!! 아이디가 이미 존재합니다.  다른 아이디를 사용해주세요.");
				return "idCheckInput";
			}
			else{
				session.setAttribute("member_id", member_id);
				return "idCheckOutput";
			}	
		}
	
		
	}
	
	
	@RequestMapping(value="loginInput.do", method=RequestMethod.GET)
	public String loginInput(){
		return "memberLoginInput";
	}		
	
	@RequestMapping(value="loginInput.do", method=RequestMethod.POST)
	public String loginInput(String member_id, String password, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		MemberService service = MemberService.getInstance();
		int result = service.memberLogin(member_id, password);
		System.out.println(result);
		if(result==2){
			session.setAttribute("id", member_id);
			//String sess=(String)session.getAttribute("id");
			session.setMaxInactiveInterval(60*30);
			return "memberLoginOutput";
		}
		if(result==1){
			request.setAttribute("error1", "비밀번호를 확인해주세요");
			return "memberLoginInput";
		}
		else{
			request.setAttribute("error2", "아이디와 비밀번호를 확인해주세요");
			return "memberLoginInput";
		}
		
	}
	
	
	@RequestMapping(value="updateInput.do", method=RequestMethod.GET)
	public String updateInput(){
		return "memberUpdateInput";
	}	
	
	@RequestMapping(value = "updateInput.do", method = RequestMethod.POST)
	public String updateInput(@ModelAttribute("member") MemberVO member, BindingResult result) {
		System.out.println(member);
	
		MemberService service = MemberService.getInstance();
		service.memberUpdate(member);			
					
		return "memberUpdateOutput";
				
		
	}
	
	
	@RequestMapping(value="logoutInput.do", method=RequestMethod.GET)
	public String logoutInput(){
		return "memberLogoutInput";
	}	
	
	@RequestMapping(value = "logoutInput.do", method = RequestMethod.POST)
	public String logoutInput(HttpSession session) {
		
		return "memberLogoutOutput";
				
	}
	
@RequestMapping(value="searchInputDetail.do", method=RequestMethod.GET)
	public String searchInputDetail(){
		return "memberSearchInput";
	}	
	
	@RequestMapping(value = "searchInputDetail.do", method = RequestMethod.POST)
	public String searchInputDetail(String member_id, HttpServletRequest request, HttpServletResponse response) {
		
		MemberService service = MemberService.getInstance();
		ArrayList<MemberVO> list = service.memberSearch(member_id);
		request.setAttribute("list", list);
		System.out.println(list);
		
		return "memberSearchOutput";
				
	}
	
	
	@RequestMapping(value="searchInput.do", method=RequestMethod.GET)
	public String searchInput(){
		
		return "memberSearchInput";
	}	
	
	@RequestMapping(value = "searchInput.do", method = RequestMethod.POST)
	public String searchInput(HttpServletRequest request, HttpServletResponse response) {
		
		MemberService service = MemberService.getInstance();
		ArrayList<MemberVO> list = service.memberList();
		request.setAttribute("list", list);

		return "memberSearchOutput";
				
	}
	
	@RequestMapping(value="rankInput.do", method=RequestMethod.GET)
	public String rankInput(HttpServletRequest request, HttpServletResponse response){
		
		MemberService service = MemberService.getInstance();
		ArrayList<MemberVO> list = service.memberRank();
		request.setAttribute("ranklist", list);
		return "memberRankInput";
	}	
	
	
	/*@RequestMapping(value="rankInput.do", method=RequestMethod.POST)
	public String rankInput(HttpServletRequest request, HttpServletResponse response){
		
		

		return "memberRankInput";
	}	*/
	

}
