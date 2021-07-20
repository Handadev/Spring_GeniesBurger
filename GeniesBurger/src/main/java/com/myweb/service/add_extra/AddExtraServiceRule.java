package com.myweb.service.add_extra;


import java.util.List;

import com.myweb.domain.AddExtraVO;

public interface AddExtraServiceRule {
	public void register(AddExtraVO aevo);
	public int remove(int mno);
	public List<AddExtraVO> getList(int mno, int pno);
	public void removePno(int mno, int pno); // 주문 취소한 제품 AE만 지우기
}
