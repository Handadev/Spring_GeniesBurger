package com.myweb.persistence.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.myweb.domain.ReviewVO;

@Component
public class ReviewDAO implements ReviewDAORule {
	private static Logger logger = LoggerFactory.getLogger(ReviewDAO.class);
	private final String NS = "ReviewMapper.";

	@Inject
	SqlSession sql;

	@Override
	public int insert(ReviewVO rvo) {
		return sql.insert(NS + "add", rvo);
	}

	@Override
	public List<ReviewVO> selectList(int pno) {
		return sql.selectList(NS + "list", pno);
	}

	@Override
	public int delete(int rno) {
		return sql.delete(NS + "del", rno);
	}

	@Override
	public int update(int rno, String rcontent) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rno", rno);
		map.put("rcontent", rcontent);
		return sql.delete(NS + "up", map);
	}

	@Override
	public int selectOne() {
		return sql.selectOne(NS + "curr");
	}

	@Override
	public int insertFile(ReviewVO rvo) {
		return sql.update(NS + "upImg", rvo);
	}

}
