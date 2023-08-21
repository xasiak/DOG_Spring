package kr.co.doglove.visit.service;

import java.util.List;

import kr.co.doglove.visit.domain.Visit;

public interface VisitService {
	
	/**
	 * 방문예약 Service
	 * @param visit
	 * @return
	 */
	public int insertBook(Visit visit);

	/**
	 * 방문예약리스트 Service
	 * @param userEmail
	 * @return
	 */
	public List<Visit> selectBookList(String userEmail);
}
