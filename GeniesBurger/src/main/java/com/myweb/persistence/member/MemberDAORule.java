package com.myweb.persistence.member;

import java.util.List;

import com.myweb.domain.MemberVO;

public interface MemberDAORule {
   public int insert(MemberVO mvo);
   public int selectEmail(String email);
   public List<MemberVO> selectList();
   public MemberVO selectOne(MemberVO mvo);
   public MemberVO selectOne(int mno);
   public int update(MemberVO mvo);
   public int delete(int mno);
}