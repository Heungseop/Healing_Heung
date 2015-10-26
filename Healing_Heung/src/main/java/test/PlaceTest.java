package test;


import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import dao.ImageUrlDao;
import dao.PlaceDao;
import dto.ImageUrl;
import dto.Place;
import service.PlaceService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/spring/jdbc-config.xml")
public class PlaceTest {
	private static Logger logger = LoggerFactory.getLogger(PlaceTest.class);

	@Autowired
	PlaceDao pdao;
	
	@Autowired
	ImageUrlDao Idao;

	@Autowired
	PlaceService pservice;
	
	

	@Test
	public void inserttest() {
		ImageUrl img =new ImageUrl("asdf",5,"asdf");
		int result = Idao.insertImageUrl(img);
		if(result ==1){

		}
	

	}
	
	@Test
	public void selecttest(){
		
	}
	

}
