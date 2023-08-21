package kr.co.doglove.post.domain;

import java.sql.Date;

public class Post {
	private int postNo;
	private String postTitle;
	private String postContent;
	private String postWriter;
	private int postLike;
	private Date postDate;
	private Date updateDate;
	private int viewCount;
	private String PostFileName;
	private String PostFilePath;
	private long PostFileLength;
	
	public Post() {}
	
	
	public int getPostNo() {
		return postNo;
	}


	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}


	public String getPostTitle() {
		return postTitle;
	}


	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}


	public String getPostContent() {
		return postContent;
	}


	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}


	public String getPostWriter() {
		return postWriter;
	}


	public void setPostWriter(String postWriter) {
		this.postWriter = postWriter;
	}


	public int getPostLike() {
		return postLike;
	}


	public void setPostLike(int postLike) {
		this.postLike = postLike;
	}


	public Date getPostDate() {
		return postDate;
	}


	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}


	public Date getUpdateDate() {
		return updateDate;
	}


	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}


	public int getViewCount() {
		return viewCount;
	}


	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}


	public String getPostFileName() {
		return PostFileName;
	}


	public void setPostFileName(String postFileName) {
		PostFileName = postFileName;
	}


	public String getPostFilePath() {
		return PostFilePath;
	}


	public void setPostFilePath(String postFilePath) {
		PostFilePath = postFilePath;
	}


	public long getPostFileLength() {
		return PostFileLength;
	}


	public void setPostFileLength(long postFileLength) {
		PostFileLength = postFileLength;
	}


	@Override
	public String toString() {
		return "Post [postNo=" + postNo + ", postTitle=" + postTitle + ", postContent=" + postContent + ", postWriter="
				+ postWriter + ", postLike=" + postLike + ", postDate=" + postDate + ", updateDate=" + updateDate
				+ ", viewCount=" + viewCount + "]";
	}
	
}
