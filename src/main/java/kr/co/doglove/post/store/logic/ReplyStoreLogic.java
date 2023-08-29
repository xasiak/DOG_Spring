package kr.co.doglove.post.store.logic;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.doglove.post.domain.Reply;
import kr.co.doglove.post.store.ReplyStore;

@Repository
public class ReplyStoreLogic implements ReplyStore{

	
	
	@Override
	public int insertReply(SqlSession sqlSession, Reply reply) {
		int result = sqlSession.insert("ReplyMapper.insertReply", reply);
		return result;
	}

	@Override
	public List<Reply> selectReplyList(SqlSession sqlSession, int refPostNo) {
		List<Reply> rList = sqlSession.selectList("ReplyMapper.selectReplyList", refPostNo);
		return rList;
	}

	@Override
	public int updateReply(SqlSession sqlSession, Reply reply) {
		int result = sqlSession.update("ReplyMapper.updateReply", reply);
		return result;
	}

	@Override
	public int deleteReply(SqlSession sqlSession, Reply reply) {
		int result = sqlSession.delete("ReplyMapper.deleteReply, reply");
		return result;
	}

}











