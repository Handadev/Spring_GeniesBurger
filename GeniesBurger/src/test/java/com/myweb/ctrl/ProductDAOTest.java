package com.myweb.ctrl;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.myweb.domain.ProductVO;
import com.myweb.persistence.product.ProductDAO;
import com.myweb.persistence.product.ProductDAORule;
import com.myweb.service.product.ProductServiceRule;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ProductDAOTest {
	private static Logger logger = LoggerFactory.getLogger(ProductDAOTest.class);
	
	@Inject
	private ProductDAORule pdao;
	
	@Test
	public void productRegister() throws Exception {
		for (int i = 0; i < 30; i++) {
			ProductVO pvo = new ProductVO();
			pvo.setTitle("상품 이름"+i);
			pvo.setContent("상품 텍스트"+i);
			pvo.setPrice(10000);
			pvo.setCategory(1);
			pvo.setCalorie(100);
			pdao.insert(pvo);
			
		}
	}
	
//	@Test
//	public void productUpdate() throws Exception {
//			ProductVO pvo = new ProductVO();
//			pvo.setTitle("변경한 이름");
//			pvo.setContent("변경함");
//			pvo.setPrice(50000);
//			pvo.setCategory(4);
//			pvo.setPno(30);
//			pdao.update(pvo);
//	}

//	@Test
//	public void productList() throws Exception {
//		List<ProductVO> list = pdao.selectList();
//		
//	}
	
//	@Test
//	public void productDetail() throws Exception {
//		ProductVO pvo = pdao.selectOne(30);
//		logger.info("pvo3"+pvo);
//	}

//	@Test
//	public void productRemove() throws Exception {
//		pdao.delete(31);
//	}
}
