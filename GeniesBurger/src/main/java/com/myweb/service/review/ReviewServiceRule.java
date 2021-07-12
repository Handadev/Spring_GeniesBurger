package com.myweb.service.review;

import java.util.List;

import com.myweb.domain.ReviewVO;
import com.myweb.domain.adCommentVO;

public interface ReviewServiceRule {
	public int ReviewAdd(ReviewVO rvo);

	public List<ReviewVO> ReviewList();

	public int reviewDel(int rno);

	public int reviewUp(int rno, String rcontent);

	public int ReviewCurrRno();

	public int adCommentAdd(int rno, String adComment);
	
	public int adCommentUp(int rno, String adComment);
}
