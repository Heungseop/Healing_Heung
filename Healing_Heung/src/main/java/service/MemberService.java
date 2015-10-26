package service;

import java.util.Map;

import dto.Member;
import exception.WrongLoginException;

public interface MemberService {
	
	
	public int join(Member member);

	public Member login(Member member) throws WrongLoginException;
	public Map<String,Object> newlogin(String id,String pass);

	public int modify(Member member);

	public int leave(String memberId);
	
	public boolean JoinIdCheck(String id);
	
	public String SearchId(Member member );
	
	public boolean SearchPass(Map<String,String> memberPassMap);
	
	
	public boolean modifyPassword(Map<String,String> memberUpdatePassMap);
	
}
