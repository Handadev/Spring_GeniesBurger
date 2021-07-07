package com.myweb.persistence.product;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myweb.domain.ProductPageVO;
import com.myweb.domain.ProductVO;

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

//	@Override // 리스트 - 페이징,서치
//	public List<ProductVO> selectList(ProductPageVO pgvo) {
//		return sql.selectList(ns+"list", pgvo);
//	}
	
	@Override
	public List<ProductVO> selectList() {
		return sql.selectList(ns+"list");
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

	@Override // 글의 전체 개수 구하기 - 페이징
	public int selectOne(ProductPageVO ppgvo) {
		return sql.selectOne(ns+"totalcount", ppgvo);
	}

	/**
	 * 상품 구매시 카운트 올리기 ns+"salesup" 
	 */
}
