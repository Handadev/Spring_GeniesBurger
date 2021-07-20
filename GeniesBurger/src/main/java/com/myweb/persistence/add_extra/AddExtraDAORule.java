package com.myweb.persistence.add_extra;


import java.util.List;

import com.myweb.domain.AddExtraVO;

public interface AddExtraDAORule {
	public void insert(AddExtraVO aevo);
	public int delete(int mno);
	public List<AddExtraVO> selectList(int mno, int pno);
	public void deletePno(int mno, int pno); // 주문 취소한 제품 AE만 지우기
}	
