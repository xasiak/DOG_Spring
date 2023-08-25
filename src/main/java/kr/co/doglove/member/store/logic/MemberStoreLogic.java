package kr.co.doglove.member.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.doglove.member.domain.Member;
import kr.co.doglove.member.store.MemberStore;

@Repository
public class MemberStoreLogic implements MemberStore{

	@Override
	public Member memberLoginCheck(SqlSession sqlSession, Member member) {
		Member mOne = sqlSession.selectOne("MemberMapper.selectMemberLogin", member);
		return mOne;
	}

	@Override
	public Member selectOneByEmail(SqlSession sqlSession, String memberEmail) {
		Member member = sqlSession.selectOne("MemberMapper.selectOneByEmail", memberEmail);
		return member;
	}

	@Override
	public int insertMember(SqlSession sqlSession, Member member) {
		int result = sqlSession.insert("MemberMapper.insertMember", member);
		return result;
	}

	@Override
	public int updateMember(SqlSession sqlSession, Member member) {
		int result = sqlSession.update("MemberMapper.updateMember", member);
		return result;
	}

	@Override
	public int deleteMember(SqlSession sqlSession, String memberEmail) {
		int result = sqlSession.delete("MemberMapper.deleteMember", memberEmail);
				return result;
	}

	@Override
	public int EmailCheck(SqlSession sqlSession, String memberEmail) {
		int result = sqlSession.selectOne("MemberMapper.emailCheck", memberEmail);
		return result;
	}

}
