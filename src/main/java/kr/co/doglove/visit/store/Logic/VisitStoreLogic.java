package kr.co.doglove.visit.store.Logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.doglove.visit.domain.Visit;
import kr.co.doglove.visit.store.VisitStore;

@Repository
public class VisitStoreLogic implements VisitStore{

	@Override
	public int insertBook(SqlSession sqlSession, Visit visit) {
		int result = sqlSession.insert("VisitMapper.insertBook", visit);
		return result;
	}

	@Override
	public List<Visit> selectBookList(SqlSession sqlSession, String userEmail) {
		List<Visit> vList = sqlSession.selectList("VisitMapper.selectBookList", userEmail);
		return vList;
	}

}
