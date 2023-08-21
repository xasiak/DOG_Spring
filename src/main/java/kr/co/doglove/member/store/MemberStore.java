package kr.co.doglove.member.store;

import org.apache.ibatis.session.SqlSession;

import kr.co.doglove.member.domain.Member;

public interface MemberStore {
	
	/**
	 * 로그인 Store
	 * @param sqlSession
	 * @param member
	 * @return
	 */
	public Member memberLoginCheck(SqlSession sqlSession, Member member);
	
	/**
	 * 회원상세조회 Store
	 * @param sqlSession
	 * @param memberEmail
	 * @return
	 */
	public Member selectOneByEmail(SqlSession sqlSession, String memberEmail);

	/**
	 * 회원가입 Store
	 * @param sqlSession
	 * @param member
	 * @return
	 */
	public int insertMember(SqlSession sqlSession, Member member);

	/**
	 * 회원정보수정 Store
	 * @param sqlSession
	 * @param member
	 * @return
	 */
	public int updateMember(SqlSession sqlSession, Member member);

	/**
	 * 회원탈퇴 Store
	 * @param sqlSession
	 * @param memberEmail
	 * @return
	 */
	public int deleteMember(SqlSession sqlSession, String memberEmail);
}
