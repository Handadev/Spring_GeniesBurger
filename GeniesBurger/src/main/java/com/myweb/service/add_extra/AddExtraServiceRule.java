package com.myweb.service.add_extra;


import java.util.List;

import com.myweb.domain.AddExtraVO;

public interface AddExtraServiceRule {
	public void register(AddExtraVO aevo);
	public int remove(int cartno);  // 주문 성공시 해당 add_extra 삭제 
	public List<AddExtraVO> getList(int mno, int pno); // 주문 취소시 add_extra 테이블에 정보가 있으면 지우기 위해 cartno없는 정보 가져옴
	public void removePno(int mno, int pno); // 주문 취소한 제품 AE만 지우기
}