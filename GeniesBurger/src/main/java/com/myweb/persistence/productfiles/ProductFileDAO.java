package com.myweb.persistence.productfiles;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myweb.domain.ProductFileVO;

@Repository
public class ProductFileDAO implements ProductFileDAORule {
	private static Logger logger = LoggerFactory.getLogger(ProductFileDAO.class);
	private final String ns = "ProductFileMapper.";
	
	@Inject
	private SqlSession sql;
	
	@Override
	public int insert(ProductFileVO pfvo) {
		return sql.insert(ns+"reg", pfvo);
	}

	@Override
	public List<ProductFileVO> selectList(int pno) {
		return sql.selectList(ns+"list", pno);
	}

	@Override // 파일 스위퍼용 전체 리스트
	public List<ProductFileVO> selectList() {
		return sql.selectList(ns+"allList");
	}
	
	@Override
	public int delete(int pno) {
		return sql.delete(ns+"del", pno);
	}


}
