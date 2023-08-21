package kr.co.doglove.visit.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.doglove.visit.domain.Visit;

public interface VisitStore {
	
	/**
	 * 방문예약 Store
	 * @param session
	 * @param visit
	 * @return
	 */
	public int insertBook(SqlSession session, Visit visit);

	/**
	 * 방문예약리스트 Store
	 * @param session
	 * @param userEmail
	 * @return
	 */
	public List<Visit> selectBookList(SqlSession session, String userEmail);

}
