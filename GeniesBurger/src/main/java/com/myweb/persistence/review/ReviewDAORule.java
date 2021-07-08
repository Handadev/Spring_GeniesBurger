package com.myweb.persistence.review;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.myweb.domain.ReviewVO;
import com.myweb.domain.adCommentVO;

public interface ReviewDAORule {

	public int insert(ReviewVO rvo);

	public int delete(int rno);

	public int update(int rno, String rcontent);

	public List<ReviewVO> selectList();

	public int selectOne();

	public int insertFile(ReviewVO rvo);

	public int adCommentInsert(adCommentVO advo);

	public List<adCommentVO> selectList(int rno);
}
