package kr.co.doglove.post.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.co.doglove.post.domain.PageInfo;
import kr.co.doglove.post.domain.Post;

public interface PostStore {

	/**
	 * 게시물 갯수 조회 Store
	 * @param sqlSession
	 * @return
	 */
	int selectListCount(SqlSession sqlSession);

	/**
	 * 게시물 목록 조회 Store
	 * @param sqlSession
	 * @param pInfo
	 * @return
	 */
	List<Post> selectPostList(SqlSession sqlSession, PageInfo pInfo);

	/**
	 *  게시물 등록 Store
	 * @param sqlSession
	 * @param post
	 * @return
	 */
	int insertPost(SqlSession sqlSession, Post post);

	/**
	 * 검색된 게시물 전체 갯수 Store
	 * @param sqlSession
	 * @param paramMap
	 * @return
	 */
	int selectListCount(SqlSession sqlSession, Map<String, String> paramMap);

	/**
	 * 게시물 조건에 따라 키워드로 검색 Store(동적쿼리)
	 * @param sqlSession
	 * @param pInfo
	 * @param paramMap
	 * @return
	 */
	List<Post> searchPostByKeyword(SqlSession sqlSession, PageInfo pInfo, Map<String, String> paramMap);

	/**
	 * 게시물 상세 조회 Store
	 * @param sqlSession
	 * @param postNo
	 * @return
	 */
	Post selectOneByNo(SqlSession sqlSession, int postNo);
	
}
