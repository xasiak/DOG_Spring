package kr.co.doglove.post.service.impl;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.doglove.post.domain.PageInfo;
import kr.co.doglove.post.domain.Post;
import kr.co.doglove.post.service.PostService;
import kr.co.doglove.post.store.PostStore;

@Service
public class PostServiceImpl implements PostService{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private PostStore pStore;

	@Override
	public int getListCount() {
		int result = pStore.selectListCount(sqlSession);
		return result;
	}

	@Override
	public List<Post> selectPostList(PageInfo pInfo) {
		List<Post> pList = pStore.selectPostList(sqlSession, pInfo);
		return pList;
	}

	@Override
	public int insertPost(Post post) {
		int result = pStore.insertPost(sqlSession, post);
		return result;
	}

	@Override
	public int getListCount(Map<String, String> paramMap) {
		int result = pStore.selectListCount(sqlSession, paramMap);
		return result;
	}

	@Override
	public List<Post> searchPostByKeyword(PageInfo pInfo, Map<String, String> paramMap) {
		List<Post> searchList = pStore.searchPostByKeyword(sqlSession, pInfo, paramMap);
		return searchList;
	}

	@Override
	public Post selectOneByNo(int postNo) {
		Post post = pStore.selectOneByNo(sqlSession, postNo);
		return post;
	}

	@Override
	public int deletePost(int postNo) {
		int result = pStore.deletePost(sqlSession, postNo);
		return result;
	}

	@Override
	public int updatePost(Post post) {
		int result = pStore.updatePost(sqlSession, post);
		return result;
	}

	@Override
	public int updateViewCount(Post postView) {
		int result = pStore.updateViewCount(sqlSession, postView);
		return result;
	}

	
}
