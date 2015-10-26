package test;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.notNullValue;
import static org.junit.Assert.assertThat;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import dao.MemberDao;
import dto.Member;
import exception.WrongLoginException;
import service.MemberService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/spring/jdbc-config.xml")
public class MyBatisTest {
	private static Logger logger = LoggerFactory.getLogger(MyBatisTest.class);
	@Autowired
	SqlSessionFactoryBean factory;
	@Autowired
	SqlSessionTemplate session;

	@Autowired
	MemberDao mdao;

	@Autowired
	MemberService mservice;

	/*
	 * @Before public void init() { logger.trace("before method run"); if
	 * (mdao.selectMemberById("service") != null) mservice.leave("service"); int
	 * result = mdao.insertMember( new Member("service", "pass", "servicename",
	 * new Date(), "test@test.com", "010-0000-0000")); logger.trace(
	 * "init result : {}", result); }
	 */
	@Test
	public void getBeanTest() {
		assertThat(factory, is(notNullValue()));
		assertThat(session, is(notNullValue()));
		assertThat(mdao, is(notNullValue()));
		assertThat(mservice, is(notNullValue()));
	}

	@Test
	public void joinAndLeaveTest() {
		Member member = new Member("service", "pass", "servicename", new Date(), "test@test.com", "010-0000-0000");
		mservice.join(member);
		Member selected = mdao.selectMemberById("service");
		logger.trace("join test : {} ", selected);
		mservice.leave("service");
	}

	@Test
	public void loginTest() {
		logger.trace("loginTest method run");
		Member member = new Member("service", "pass", "servicename", new Date(), "test@test.com", "010-0000-0000");
		mservice.join(member);

		Member nmember = new Member();
		nmember.setMemberId("wrong");
		nmember.setMemberPassword("pass");

		logger.trace("loginTest method run2");
		Member logined;
		try {
			logined = mservice.login(nmember);
			logger.trace("login test : {} ", logined);
			logger.trace("loginTest method run3");
		} catch (WrongLoginException e) {
			logger.trace("loginException 정상동작 : {}", e.getMessage());
			e.printStackTrace();
		} finally {
			mservice.leave("service");
			logger.trace("finally of loginTest method");
		}
	}

	@Test
	public void ModifyTest() {
		Member member = new Member("service", "pass", "servicename", new Date(), "test@test.com", "010-0000-0000");
		mservice.join(member);

		member.setMemberName("modify Name");
		member.setMemberPassword("Modify pass");
		logger.trace("modify test : {} ", member);

		mservice.leave("service");
	}

	@Test
	public void selectUserTest1() {
		Member member = mdao.selectMemberById("service");
		logger.trace("셀렉트 완료 : {}", member);
	}
	/*
	 * @Test public void selectUserTest1() { Member member =
	 * mdao.selectMemberById("service"); logger.trace("셀렉트 완료 : {}", member); }
	 * 
	 * @Test public void selectAll() { List<Member> memberList =
	 * mdao.selectAllMember(); logger.trace("셀렉트 완료 : {}", memberList); }
	 */

	/*
	 * @After public void deleteMember() { mservice.leave("service");
	 * logger.trace("After Method Run"); }
	 */

}
