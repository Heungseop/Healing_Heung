package service;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.MemberDao;
import dto.Member;
import exception.WrongLoginException;

@Service
public class MemberServiceImpl implements MemberService {
	private static Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);

	@Autowired
	MemberDao mdao;

	@Transactional
	@Override
	public int join(Member member) {
		// TODO Auto-generated method stub

		int insertResult = mdao.insertMember(member);
		logger.trace("(service)join Method result : {}", insertResult);
		return insertResult;

	}

	@Transactional
	@Override
	public Member login(Member member) throws WrongLoginException {

		logger.trace("(service)login Method parameter member : {}", member);
		Member check = mdao.selectMemberById(member.getMemberId());
		if (check == null) {
			throw new WrongLoginException("아이디 혹은 비밀번호를 확인하세요.");
		}
		if (member.getMemberPassword().equals(check.getMemberPassword())) {
			return check;
		} else {
			throw new WrongLoginException("아이디 혹은 비밀번호를 확인하세요.");
		}
	}

	
	@Override
	public Map<String,Object> newlogin(String id, String pass) {
		Map<String,Object> loginMap =new HashMap<String,Object>();
		Member check = mdao.selectMemberById(id);
		if (check != null) {
			if (pass.equals(check.getMemberPassword())) {
				loginMap.put("login", "success");
				loginMap.put("member", check);
				return loginMap;
			} else {
				loginMap.put("login", "fail");
				return loginMap;
			}
		}
		loginMap.put("login", "fail");
		return loginMap;
	}

	@Transactional
	@Override
	public int modify(Member member) {

		int updateResult = -1;
		updateResult = mdao.updateMember(member);
		logger.trace("(service)modify Method parameter member : {}", member);
		return updateResult;
	}

	@Transactional
	@Override
	public int leave(String memberId) {
		int result = -1;
		result = mdao.deleteMember(memberId);
		return result;
	}
	@Transactional
	@Override
	public boolean JoinIdCheck(String id) {
		Member member =mdao.selectMemberById(id);
		if(member ==null){
			return true;
		}
		return false;
	}
	
	@Override
	public String SearchId(Member member) {
		String memberId = mdao.selectIdByMember(member);
		if(memberId !=null){
			return memberId;
		}else {
			return null;
		}
	}

	@Override
	public boolean SearchPass(Map<String,String> memberPassMap) {
		// TODO Auto-generated method stub
		String memberPass = mdao.selectPassByMember(memberPassMap);
		if(memberPass !=null){
			logger.trace("memberpassword {} ",memberPass);
			return true;
		}else {
			return false;
		}
	}
	@Transactional
	@Override
	public boolean modifyPassword(Map<String, String> memberUpdatePassMap) {
		int result =mdao.updatePassById(memberUpdatePassMap);
		if(result > 0){
			return true;
		}else{
			return false;
			
		}
	}

}
