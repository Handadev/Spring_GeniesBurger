package com.myweb.persistence.purchase;

import java.util.List;

import com.myweb.domain.MemberPageVO;
import com.myweb.domain.PurchaseVO;

public interface PurchaseDAORule {
	public int insert(PurchaseVO purVO);
	public List<PurchaseVO> selectList(MemberPageVO mpgvo);
	public List<PurchaseVO> selectList(MemberPageVO mpgvo, int mno);
	public int getTotalCount(MemberPageVO mpgvo);
	public int getTotalCount(MemberPageVO mpgvo, int mno);
	public List<PurchaseVO> selectDateSalesList(String todayString);
}
