package com.myweb.service.product;

import java.util.List;

import com.myweb.domain.ProductCustomerPageVO;
import com.myweb.domain.ProductPageVO;
import com.myweb.domain.ProductStockVO;
import com.myweb.domain.ProductVO;
import com.myweb.domain.StockVO;

public interface ProductServiceRule {
	public int register(ProductVO pvo);
	public List<ProductVO> getList(ProductPageVO ppgvo); // 관리자 리스트
	public List<ProductVO> getList(ProductCustomerPageVO pcpvo); // 소비자 리스트 
	public ProductVO detail(int pno);
	public int modify(ProductVO pvo);
	public int remove(int pno);
	public int getCurrPno(); // 사진추가를 위한 현재 pno
	public int getTotalCount(ProductPageVO ppgvo); // 관리자 리스트 글의 개수 구하기
	public int getTotalCount(ProductCustomerPageVO pcpvo); // 소비자 리스트 글의 개수 구하기
	// 상품 등록시 재고 리스트 받아오기
	public List<StockVO> getList();

}
