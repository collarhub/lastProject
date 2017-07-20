package com.book.member;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

public class MemberValidator implements Validator{
	@Override
	public boolean supports(Class<?> arg0) {
		// TODO Auto-generated method stub
		return false;
	}
	
	@Override
	public void validate(Object target, Errors error) {
		MemberVO member = (MemberVO)target;
		if(member.getMember_id().isEmpty())	error.rejectValue("member_id", "required.member_id");
		if(member.getPassword().isEmpty()) 	error.rejectValue("password", "required.password");
		if(member.getNickname().isEmpty())	error.rejectValue("nickname", "required.nickname");
		if(member.getEmail().isEmpty())		error.rejectValue("email", "required.email");
		if(member.getBirth_date().isEmpty())	error.rejectValue("birt_date", "required.birth_date");
		if(member.getPhone().isEmpty())	error.rejectValue("phone", "required.phone");
		if(member.getAddr().isEmpty())	error.rejectValue("addr", "required.addr");
		if(member.getPhoto().isEmpty())	error.rejectValue("photo", "required.photo");
		
	}

}
