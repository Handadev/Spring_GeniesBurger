package com.myweb.persistence.product;

import java.util.List;

import com.myweb.domain.ProductPageVO;
import com.myweb.domain.ProductVO;

public interface ProductDAORule {
	public int insert(ProductVO pvo); // 추가
//	public List<ProductVO> selectList(ProductPageVO pgvo); // 리스트 - 페이징,서치
	public List<ProductVO> selectList(); // 리스트
	public ProductVO selectOne(int pno); // detail
	public int update(ProductVO pvo); 
	public int delete(int pno);
	public int selectOne(); // 사진추가를 위한 현재 pno
	public int selectOne(ProductPageVO ppgvo); // 글의 전체 개수 구하기 - 페이징
	
	/**
	 * 상품 구매시 카운트 올리기 ns+"salesup" 
	 */
}
