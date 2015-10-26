package dao;

import java.util.List;
import java.util.Map;

import dto.Member;

public interface MemberDao {
	public int insertMember(Member member);

	public List<Member> selectAllMember();

	public Member selectMemberById(String id);

	public int updateMember(Member member);
	
	public int updatePassById(Map<String,String> memberUpdatePassMap);

	public int deleteMember(String memberId);

	public String selectIdByMember(Member member);
	
	public String selectPassByMember(Map<String,String> memberPassMap);
	
}
