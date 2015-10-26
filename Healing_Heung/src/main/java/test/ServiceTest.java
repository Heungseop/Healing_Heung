package test;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.notNullValue;
import static org.junit.Assert.assertThat;

import java.util.Date;
import java.util.List;

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
import service.MemberService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/spring/jdbc-config.xml")
public class ServiceTest {
	private static Logger logger = LoggerFactory.getLogger(ServiceTest.class);
	@Autowired
	SqlSessionFactoryBean factory;
	@Autowired
	SqlSessionTemplate session;

	@Autowired
	MemberDao mdao;

	@Autowired
	MemberService mservice;

	@Test
	public void getBeanTest() {
		assertThat(factory, is(notNullValue()));
		assertThat(session, is(notNullValue()));
		assertThat(mdao, is(notNullValue()));
		assertThat(mservice, is(notNullValue()));
	}

	@Test
	public void selectTest11() {
		List<Member> selectList = mdao.selectAllMember();
		logger.trace("selectList {}:" + selectList);
	}

	@Test
	public void selectTest() {
		Member selected = mdao.selectMemberById("servisadffsadf");
		logger.trace("join test : {} ", selected);

	}

	@Test
	public void jointest() {
		int ran = (int) (Math.random() * 100);
		String temp ="service"+ran;
		Member member = new Member(temp, "pass", "servicename", new Date(), "test@test.com",
				"010-0000-0000");
		mservice.join(member);
		Member selected = mdao.selectMemberById(temp);
		logger.trace("join test : {} ", selected);

		mservice.leave(temp);
	}

}