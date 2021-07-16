package com.myweb.service.add_extra;


import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myweb.domain.AddExtraVO;
import com.myweb.persistence.add_extra.AddExtraDAORule;

@Service
public class AddExtraService implements AddExtraServiceRule {
	private static Logger logger = LoggerFactory.getLogger(AddExtraService.class);

	@Inject
	private AddExtraDAORule aedao;
	
	
	@Override
	public void register(AddExtraVO aevo) {
		aedao.insert(aevo);
	}

	@Override
	public int remove(int mno) {
		return aedao.delete(mno);
	}

}
