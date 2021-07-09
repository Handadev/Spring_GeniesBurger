package com.myweb.persistence.member;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myweb.domain.MemberVO;
import com.myweb.domain.MemberPageVO;

@Repository
public class MemberDAO implements MemberDAORule {
   private static Logger logger = LoggerFactory.getLogger(MemberDAO.class);
   private final String NS = "MemberMapper.";
   
   @Inject
   private SqlSession sql;

   @Override
   public int insert(MemberVO mvo) {
      return sql.insert(NS+"reg", mvo);
   }

   @Override
   public int selectEmail(String email) {
      return sql.selectOne(NS+"check", email);
   }

   @Override
   public List<MemberVO> selectList(MemberPageVO mpgvo) {
      return sql.selectList(NS+"list", mpgvo);
   }

   @Override
   public MemberVO selectOne(MemberVO mvo) {
      return sql.selectOne(NS+"login", mvo);
   }

   @Override
   public MemberVO selectOne(int mno) {
      return sql.selectOne(NS+"detail", mno);
   }

   @Override
   public int update(MemberVO mvo) {
      return sql.update(NS+"mod", mvo);
   }

   @Override
   public int delete(int mno) {
      return sql.delete(NS+"del", mno);
   }

@Override
public int selectOne(MemberPageVO mpgvo) {
	return sql.selectOne(NS+"tc", mpgvo);
}

}