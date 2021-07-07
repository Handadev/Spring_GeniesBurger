package com.myweb.persistence.productfiles;

import java.util.List;

import com.myweb.domain.ProductFileVO;

public interface ProductFileDAORule {
	public int insert(ProductFileVO pfvo);
	public List<ProductFileVO> selectList(int pno);
	public int delete(int pno);
	public List<ProductFileVO> selectList();
}
