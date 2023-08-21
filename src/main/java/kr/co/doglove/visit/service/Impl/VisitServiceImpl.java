package kr.co.doglove.visit.service.Impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.doglove.visit.domain.Visit;
import kr.co.doglove.visit.service.VisitService;
import kr.co.doglove.visit.store.VisitStore;

@Service
public class VisitServiceImpl implements VisitService{
	
	@Autowired
	private VisitStore vStore;
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertBook(Visit visit) {
		int result = vStore.insertBook(sqlSession, visit);
		return result;
	}

	@Override
	public List<Visit> selectBookList(String userEmail) {
		List<Visit> vList = vStore.selectBookList(sqlSession, userEmail);
		return vList;
	}
	

}
