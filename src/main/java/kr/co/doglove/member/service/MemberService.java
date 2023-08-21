package kr.co.doglove.member.service;

import kr.co.doglove.member.domain.Member;

public interface MemberService {
		
	/**
	 * 로그인 Service
	 * @param member
	 * @return
	 */
	public Member selectCheckLogin(Member member);
	
	/**
	 * 회원상세조회 Service
	 * @param memberEmail
	 * @return
	 */
	public Member selectOneByEmail(String memberEmail);

	/**
	 * 회원가입 Service
	 * @param member
	 * @return
	 */
	public int registerMember(Member member);

	/**
	 * 회원정보수정 Service
	 * @param member
	 * @return
	 */
	public int updateMember(Member member);

	/**
	 * 회원탈퇴 Service
	 * @param memberEmail
	 * @return
	 */
	public int deleteMember(String memberEmail);

}
