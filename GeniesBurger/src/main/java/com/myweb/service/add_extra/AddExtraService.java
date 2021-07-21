package com.myweb.service.add_extra;


import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myweb.domain.AddExtraVO;
import com.myweb.persistence.add_extra.AddExtraDAORule;

@Service
public class AddExtraService implements AddExtraServiceRule {
	private static Logger logger = LoggerFactory.getLogger(AddExtraService.class);

	@Inject
	private AddExtraDAORule aedao;
	
	
	@Override
	public void register(AddExtraVO aevo) {
		aedao.insert(aevo);
	}

	@Override
	public int remove(int mno) {
		return aedao.delete(mno);
	}

	@Override // 주문 취소시 add_extra 테이블에 정보가 있으면 지우기 위해서 일단 테이블 정보 가져옴
	public List<AddExtraVO> getList(int mno, int pno) {
		return aedao.selectList(mno, pno);
	}

	@Override // 주문 취소한 제품 AE만 지우기
	public void removePno(int mno, int pno) {
		aedao.deletePno(mno, pno);
	}

}