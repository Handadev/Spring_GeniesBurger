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
import com.myweb.domain.adCommentVO;

@Component
public class ReviewDAO implements ReviewDAORule {
	private static Logger logger = LoggerFactory.getLogger(ReviewDAO.class);
	private final String NS = "ReviewMapper.";

	@Inject
	private SqlSession sql;

	@Override
	public int insert(ReviewVO rvo) {
		return sql.insert(NS + "add", rvo);
	}

	@Override
	public List<ReviewVO> selectList() {
		return sql.selectList(NS + "list");
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

	@Override
	public int adCommentInsert(adCommentVO advo) {
		return sql.insert(NS + "adComm", advo);
	}

	@Override
	public List<adCommentVO> selectList(int rno) {
		return sql.selectList(NS + "adList", rno);
	}

}
