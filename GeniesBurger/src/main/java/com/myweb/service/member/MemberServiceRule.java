package com.myweb.service.member;

import java.util.List;

import com.myweb.domain.MemberVO;

public interface MemberServiceRule {
   public int register(MemberVO mvo);
   public int checkEmail(String email);
   public List<MemberVO> getList();
   public MemberVO login(MemberVO mvo);
   public MemberVO detail(int mno);
   public int modify(MemberVO mvo);
   public int remove(int mno);
}