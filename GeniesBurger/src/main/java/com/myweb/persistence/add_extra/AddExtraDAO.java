package com.myweb.persistence.add_extra;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myweb.domain.AddExtraVO;

@Repository
public class AddExtraDAO implements AddExtraDAORule {
	private static Logger logger = LoggerFactory.getLogger(AddExtraDAO.class);
	private final String NS = "AddExtraMapper.";
	
	@Inject
	private SqlSession sql;
	
	@Override
	public void insert(AddExtraVO aevo) {
		sql.insert(NS+"reg", aevo);
	}

	@Override
	public int delete(int mno) {
		return sql.delete(NS+"del", mno);
	}

}
