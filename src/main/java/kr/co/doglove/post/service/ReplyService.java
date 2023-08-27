package kr.co.doglove.post.service;

import java.util.List;


import kr.co.doglove.post.domain.Reply;

public interface ReplyService {

	/**
	 * 게시글 댓글 등록 Service
	 * @param reply
	 * @return
	 */
	int insertReply(Reply reply);

	/**
	 * 게시글 댓글 수정 Service
	 * @param reply
	 * @return
	 */
	int updateReply(Reply reply);

	/**
	 * 댓글 전체 조회 Service
	 * @return
	 */
	List<Reply> selectReplyList(int refPostNo);

}
