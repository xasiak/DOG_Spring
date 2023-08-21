package kr.co.doglove.member.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.doglove.member.store.MemberStore;
import kr.co.doglove.member.domain.Member;
import kr.co.doglove.member.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberStore mStore;
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public Member selectCheckLogin(Member member) {
		Member mOne = mStore.memberLoginCheck(sqlSession, member);
		return mOne;
	}

	@Override
	public Member selectOneByEmail(String memberEmail) {
		Member member = mStore.selectOneByEmail(sqlSession, memberEmail);
		return member;
	}

	@Override
	public int registerMember(Member member) {
		int result = mStore.insertMember(sqlSession, member);
		return result;
	}

	@Override
	public int updateMember(Member member) {
		int result = mStore.updateMember(sqlSession, member);
		return result;
	}

	@Override
	public int deleteMember(String memberEmail) {
		int result = mStore.deleteMember(sqlSession, memberEmail);
		return result;
	}

}
