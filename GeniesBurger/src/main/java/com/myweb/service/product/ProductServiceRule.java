package com.myweb.service.product;

import java.util.List;

import com.myweb.domain.ProductPageVO;
import com.myweb.domain.ProductVO;

public interface ProductServiceRule {
	public int register(ProductVO pvo);
	public List<ProductVO> getList(ProductPageVO ppgvo); // 리스트 - 페이징,서치
	public ProductVO detail(int pno);
	public int modify(ProductVO pvo);
	public int remove(int pno);
	public int getCurrPno(); // 사진추가를 위한 현재 pno
	public int getTotalCount(ProductPageVO ppgvo); // 글의 전체 개수 구하기 - 페이징

}
