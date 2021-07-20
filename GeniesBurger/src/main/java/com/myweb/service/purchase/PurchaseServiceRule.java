package com.myweb.service.purchase;

import java.util.List;

import com.myweb.domain.MemberPageVO;
import com.myweb.domain.PurchaseVO;

public interface PurchaseServiceRule {
	public int register(PurchaseVO purvo);
	public List<PurchaseVO> getList(MemberPageVO mpgvo);
	public List<PurchaseVO> getList(MemberPageVO mpgvo, int mno);
	public int getTotalCount(MemberPageVO mpgvo);
	public int getTotalCount(MemberPageVO mpgvo, int mno);
	public List<PurchaseVO> getDateSalesList(String todayString);
}
