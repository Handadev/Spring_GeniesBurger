package com.myweb.persistence.review;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.myweb.domain.ReviewVO;

public interface ReviewDAORule {

	public int insert(ReviewVO rvo);

	public int delete(int rno);

	public int update(int rno, String rcontent);

	public List<ReviewVO> selectList(int pno);

	public int selectOne();

	public int insertFile(ReviewVO rvo);
}
