package com.myweb.service.review;

import java.util.List;

import com.myweb.domain.ReviewVO;

public interface ReviewServiceRule {
	public int ReviewAdd(ReviewVO rvo);

	public List<ReviewVO> ReviewList(int pno);

	public int reviewDel(int rno);

	public int reviewUp(int rno, String rcontent);

	public int ReviewCurrRno();
}
