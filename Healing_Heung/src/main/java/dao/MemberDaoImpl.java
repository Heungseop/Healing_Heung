package dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	private String namespace = "mybatis.dao.MemberMapper.";

	@Autowired
	SqlSessionTemplate session;
	
	private static Logger logger = LoggerFactory.getLogger(MemberDaoImpl.class);

	@Override
	public int insertMember(Member member) {
		String stmt = namespace + "insertMember";
		logger.trace("Dao insertMemeber method run");
		return session.update(stmt, member);
	}

	@Override
	public int updateMember(Member member) {
		String stmt = namespace + "updateMember";
		logger.trace("Dao updateMember method run");
		return session.update(stmt, member);
	}

	@Override
	public List<Member> selectAllMember() {
		String stmt = namespace + "selectAllMember";
		List<Member> memberList = session.selectList(stmt);
		logger.trace("Dao selectAllMember method run");
		return memberList;
	}

	@Override
	public Member selectMemberById(String id) {
		String stmt = namespace + "selectMemberById";
		Member member = session.selectOne(stmt, id);
		logger.trace("Dao selectMemberById method run");
		return member;
	}

	@Override
	public int deleteMember(String memberId) {
		String stmt = namespace + "deleteMember";
		logger.trace("Dao deleteMember method run");
		return session.update(stmt, memberId);
	}

	@Override
	public String selectIdByMember(Member member) {
		// TODO Auto-generated method stub
		String stmt = namespace + "selectIdByMember";
		logger.trace("Dao selectIdByMember method run");
		return session.selectOne(stmt, member);
	}

	@Override
	public String selectPassByMember(Map<String,String> memberPassMap) {
		// TODO Auto-generated method stub
		String stmt = namespace + "selectPassByMember";
		return session.selectOne(stmt, memberPassMap);

	}

	@Override
	public int updatePassById(Map<String,String> memberUpdatePassMap) {
		String stmt = namespace + "updatePassById";
		return session.update(stmt, memberUpdatePassMap);
	}


}
