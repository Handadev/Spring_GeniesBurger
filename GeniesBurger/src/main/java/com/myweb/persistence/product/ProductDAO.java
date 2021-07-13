package com.myweb.persistence.product;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myweb.domain.ProductAndFileDTO;
import com.myweb.domain.ProductCustomerPageVO;
import com.myweb.domain.ProductPageVO;
import com.myweb.domain.ProductVO;
import com.myweb.domain.StockVO;

@Repository
public class ProductDAO implements ProductDAORule {
	private static Logger logger = LoggerFactory.getLogger(ProductDAO.class);
	private final String ns = "ProductMapper.";
	
	@Inject
	private SqlSession sql;
	
	@Override
	public int insert(ProductVO pvo) {
		return sql.insert(ns+"reg", pvo);
	}

	@Override // 관리자 리스트
	public List<ProductVO> selectList(ProductPageVO ppgvo) {
		return sql.selectList(ns+"list", ppgvo);
	}
	
	@Override // 소비자 리스트
	public List<ProductVO> selectList(ProductCustomerPageVO pcpgvo) {
		return sql.selectList(ns+"listcustomer", pcpgvo);
	}
	
	@Override // 세트 메뉴구성을 위한 단품 리스트
	public List<ProductVO> selectList(ProductVO pvo) {
		return sql.selectList(ns+"singlemenu", pvo);
	}
	
	@Override // 소비자 - 단품 or 세트선택 화면리스트
	public List<ProductAndFileDTO> selectList(int pno) {
		return sql.selectList(ns+"selectmenu", pno);
	}
	
	@Override
	public ProductVO selectOne(int pno) {
		return sql.selectOne(ns+"detail", pno);
	}

	@Override
	public int update(ProductVO pvo) {
		return sql.update(ns+"mod", pvo);
	}

	@Override
	public int delete(int pno) {
		return sql.delete(ns+"del", pno);
	}

	@Override // 사진추가를 위한 현재 pno
	public int selectOne() {
		return sql.selectOne(ns+"curpno");
	}

	@Override // 관리자 리스트 글의 개수 구하기
	public int selectOne(ProductPageVO ppgvo) {
		return sql.selectOne(ns+"totalcount", ppgvo);
	}

	@Override // 소비자 리스트 글의 개수 구하기
	public int selectOne(ProductCustomerPageVO pcpgvo) {
		return sql.selectOne(ns+"totalcountcustomer", pcpgvo);
	}

	@Override // 상품 등록시 재고 리스트 받아오기
	public List<StockVO> selectList() {
		return sql.selectList(ns+"stocklist");
	}



	

	

	/**
	 * 상품 구매시 카운트 올리기 ns+"salesup" 
	 */
}
