package kr.co.doglove.post.store.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.doglove.post.domain.PageInfo;
import kr.co.doglove.post.domain.Post;
import kr.co.doglove.post.store.PostStore;

@Repository
public class PostStoreLogic implements PostStore{

	@Override
	public int selectListCount(SqlSession sqlSession) {
		int result = sqlSession.selectOne("PostMapper.selectListCount");
		return result;
	}

	@Override
	public List<Post> selectPostList(SqlSession sqlSession, PageInfo pInfo) {
		int limit = pInfo.getRecordCountPerPage();	// 가져오는 행의 갯수
		int offset = (pInfo.getCurrentPage()-1)*limit;	// 
		RowBounds rowBounds = new RowBounds(offset,limit);
		List<Post> pList = sqlSession.selectList("PostMapper.selectPostList", null, rowBounds);
		return pList;
	}

	@Override
	public int insertPost(SqlSession sqlSession, Post post) {
		int result = sqlSession.insert("PostMapper.insertPost", post);
		return result;
	}

	@Override
	public int selectListCount(SqlSession sqlSession, Map<String, String> paramMap) {
		int result = sqlSession.selectOne("PostMapper.selectListByKeywordCount", paramMap);
		return result;
	}

	@Override
	public List<Post> searchPostByKeyword(SqlSession sqlSession, PageInfo pInfo, Map<String, String> paramMap) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Post> searchList = sqlSession.selectList("PostMapper.searchPostByKeyword", paramMap, rowBounds);
		return searchList;
	}

	@Override
	public Post selectOneByNo(SqlSession sqlSession, int postNo) {
		Post post = sqlSession.selectOne("PostMapper.selectOneByNo", postNo);
		return post;
	}

}
