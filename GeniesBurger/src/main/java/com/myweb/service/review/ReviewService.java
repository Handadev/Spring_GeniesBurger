package com.myweb.service.review;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myweb.domain.ReviewVO;
import com.myweb.persistence.review.ReviewDAORule;

@Service
public class ReviewService implements ReviewServiceRule {
	private static Logger logger = LoggerFactory.getLogger(ReviewService.class);

	@Inject
	private ReviewDAORule rdao;

	@Override
	public int ReviewAdd(ReviewVO rvo) {
		return rdao.insert(rvo);
	}

	@Override
	public List<ReviewVO> ReviewList(int pno) {
		return rdao.selectList(pno);
	}

	@Override
	public int reviewDel(int rno) {
		return rdao.delete(rno);
	}

	@Override
	public int reviewUp(int rno, String rcontent) {
		return rdao.update(rno, rcontent);
	}

	@Override
	public int ReviewCurrRno() {
		return rdao.selectOne();
	}

}
