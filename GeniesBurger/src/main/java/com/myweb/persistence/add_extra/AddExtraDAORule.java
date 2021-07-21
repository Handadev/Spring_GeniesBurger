package com.myweb.persistence.add_extra;


import java.util.List;

import com.myweb.domain.AddExtraVO;
import com.myweb.domain.CartVO;

public interface AddExtraDAORule {
	public void insert(AddExtraVO aevo);
	public int delete(int mno);
	public List<AddExtraVO> selectList(int mno, int pno); // 주문 취소시 add_extra 테이블에 정보가 있으면 지우기 위해 cartno없는 정보 가져옴
	public List<AddExtraVO> selectAddExtraList(CartVO cartvo); // 카트리스트 출력시 cartno와 연동되는 add_extra 정보 가져옴
	public void deletePno(int mno, int pno); // 주문 취소한 제품 AE만 지우기
	public int updateCartno(CartVO cartvo); // 최근 추가된 cartno mno pno 받아와서 tbl_AE cartno 컬럼 수정하기
}	
