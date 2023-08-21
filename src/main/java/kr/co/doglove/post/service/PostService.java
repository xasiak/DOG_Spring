package kr.co.doglove.post.service;


import java.util.List;
import java.util.Map;

import kr.co.doglove.post.domain.PageInfo;
import kr.co.doglove.post.domain.Post;

public interface PostService {
	
	/**
	 * 게시물 전체 갯수 조회 Service
	 * @return
	 */
	int getListCount();

	/**
	 * 게시물 목록 조회 Service
	 * @param pInfo
	 * @return
	 */
	List<Post> selectPostList(PageInfo pInfo);
	
	/**
	 * 게시물 등록 Service
	 * @param post
	 * @return
	 */
	int insertPost(Post post);

	/**
	 * 검색된 게시물 전체 갯수 Service
	 * @param paramMap
	 * @return
	 */
	int getListCount(Map<String, String> paramMap);

	/**
	 * 게시물 조건에 따라 키워드로 검색 Service(동적쿼리)
	 * @param pInfo
	 * @param paramMap
	 * @return
	 */
	List<Post> searchPostByKeyword(PageInfo pInfo, Map<String, String> paramMap);
	
	/**
	 * 게시물 상세조회 Service
	 * @param postNo
	 * @return
	 */
	Post selectOneByNo(int postNo);
	

}
