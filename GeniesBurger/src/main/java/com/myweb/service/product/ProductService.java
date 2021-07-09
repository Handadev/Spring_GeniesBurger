package com.myweb.service.product;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myweb.domain.ProductCustomerPageVO;
import com.myweb.domain.ProductFileVO;
import com.myweb.domain.ProductPageVO;
import com.myweb.domain.ProductVO;
import com.myweb.persistence.product.ProductDAORule;
import com.myweb.persistence.productfile.ProductFileDAORule;

@Service
public class ProductService implements ProductServiceRule {
	private static Logger logger = LoggerFactory.getLogger(ProductService.class);

	@Inject
	private ProductDAORule pdao;
	
	@Inject
	private ProductFileDAORule pfdao;
	
	@Override
	public int register(ProductVO pvo) {
		return pdao.insert(pvo);
	}
	
	@Override // 관리자 상품 리스트
	public List<ProductVO> getList(ProductPageVO ppgvo) {
		return pdao.selectList(ppgvo);
	}

	@Override // 소비자 상품 리스트
	public List<ProductVO> getList(ProductCustomerPageVO pcpgvo) {
		return pdao.selectList(pcpgvo);
	}
	
	@Override
	public ProductVO detail(int pno) {
		ProductVO pvo = new ProductVO();
		pvo = pdao.selectOne(pno);
		if (pvo != null) {
			List<ProductFileVO> list = pfdao.selectList(pno);
			pvo.setFlist(list);
		}
		return pvo;
	}

	@Override
	public int modify(ProductVO pvo) {
		return pdao.update(pvo);
	}

	@Override 
	public int remove(int pno) {
		int isDel = pdao.delete(pno);
		if (isDel > 0) {
			isDel = pfdao.delete(pno);
		}
		return isDel;
	}

	@Override
	public int getCurrPno() {
		return pdao.selectOne();
	}

	@Override // 관리자 리스트 글의 개수 구하기
	public int getTotalCount(ProductPageVO ppgvo) {
		return pdao.selectOne(ppgvo);
	}

	@Override // 소비자 리스트 글의 개수 구하기
	public int getTotalCount(ProductCustomerPageVO pcpgvo) {
		return pdao.selectOne(pcpgvo);
	}


}
