package com.myweb.persistence.add_extra;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myweb.domain.AddExtraVO;
import com.myweb.domain.CartVO;

@Repository
public class AddExtraDAO implements AddExtraDAORule {
	private static Logger logger = LoggerFactory.getLogger(AddExtraDAO.class);
	private final String NS = "AddExtraMapper.";
	
	@Inject
	private SqlSession sql;
	
	@Override
	public void insert(AddExtraVO aevo) {
		sql.insert(NS+"reg", aevo);
	}
	
	@Override
	public int delete(int mno) {
		return sql.delete(NS+"del", mno);
	}

	@Override // 주문 취소시 add_extra 테이블에 정보가 있으면 지우기 위해 cartno없는 정보 가져옴
	public List<AddExtraVO> selectList(int mno, int pno) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("mno", mno);
		map.put("pno", pno);
		return sql.selectList(NS+"list", map);
	}
	
	@Override // 카트리스트 출력시 cartno와 연동되는 add_extra 정보 가져옴
	public List<AddExtraVO> selectAddExtraList(CartVO cartvo) {
		return sql.selectList(NS+"addExtraCartList", cartvo);
	}
	
	@Override // 주문 취소한 제품 AE만 지우기
	public void deletePno(int mno, int pno) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("mno", mno);
		map.put("pno", pno);
		sql.delete(NS+"delPno", map);
	}

	@Override // 최근 추가된 cartno mno pno 받아와서 tbl_AE cartno 컬럼 수정하기
	public int updateCartno(CartVO cartvo) {
		return sql.update(NS+"updateCartno", cartvo);
	}

	


}