package test;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.notNullValue;
import static org.junit.Assert.assertThat;

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

import dao.BoardDao;
import dto.Board;
import exception.NotWriterException;
import service.BoardService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/spring/jdbc-config.xml")
public class BoardDaoTest {
	private static Logger logger = LoggerFactory.getLogger(ServiceTest.class);
/*	@Autowired
	SqlSessionFactoryBean factory;
	@Autowired
	SqlSessionTemplate session;
*/
	@Autowired
	BoardDao bdao;
	@Autowired
	BoardService bservice;

	@Before
	public void init() {
		logger.trace("init method run");
	}
/*
	@Test
	public void getBeanTest() {
		assertThat(factory, is(notNullValue()));
		assertThat(session, is(notNullValue()));
		assertThat(bdao, is(notNullValue()));
	}*/

	@Test
	public void boardSelect() {
		logger.trace("test boardselect run");
		Board result = bdao.selectBoardByNo(100);
		assertThat(result, is(notNullValue()));
		logger.trace("test boardselect result : {}", result);

	}

	@Test
	public void boardInsertAndDelete() {
		
	}


	@Test
	public void updateTest() {
	
	}

	@Test
	public void boardSelectByPage() {
		logger.trace("test boardSelectByPage run");
		List<Board> result = bdao.selectBoardByPage(1);
		assertThat(result, is(notNullValue()));
		logger.trace("test boardSelectByPage result : {}", result);

	}

	@Test
	public void applyLikeTest() {
		logger.trace("test applyLikeTest run");
	//	bdao.applyLike(29, "test0", true);
//		logger.trace("test boardSelectByPage result : {}", result);

	}
	
	@Test
	public void selectLikeTest() {
	
	}
	
	
	@Test
	public void increaseRead() {
	
	}

	
	@Test
	public void serviceListSelectTest() {
		logger.trace("test serviceListSelectTest run");
		bservice.selectBoardList(1);
	}


	@Test
	public void serviceReadBoardTest() {
		logger.trace("test serviceReadBoardTest run");
		int boardNo = 100;
		assertThat(bservice.readBoard(boardNo).getBoardNo(), 
				is(bdao.selectBoardByNo(boardNo).getBoardNo()));
		
		
		
	}

	@Test
	public void servicepostBoardTest() {
		
	}

	@Test
	public void boardLike() {
	
	}

	@Test
	public void servicemodifyTest() {
	
	}
	
	@Test
	public void insertboardTest() {
	
	}
/*
	@Test
	public void deleteTest() throws NotWriterException {
		logger.trace("test deleteTest run");
		Board board = bdao.selectBoardByNo(28);
		bservice.deleteBoard("wrong", board.getBoardNo());
	}*/

	/*
	 * @After public void aftermethod() {
	 * 
	 * bdao.deleteBoard(99); }
	 */
}
