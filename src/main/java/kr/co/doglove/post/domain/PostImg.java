package kr.co.doglove.post.domain;

public class PostImg {
	private int postImgNo;
	private int postNo;
	private String PostImgName;
	private String PostImgRename;
	private String PostImgPath;
	private long PostImgLength;
	private int postImgOrder;
	public int getPostImgNo() {
		return postImgNo;
	}
	public void setPostImgNo(int postImgNo) {
		this.postImgNo = postImgNo;
	}
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public String getPostImgName() {
		return PostImgName;
	}
	public void setPostImgName(String postImgName) {
		PostImgName = postImgName;
	}
	public String getPostImgRename() {
		return PostImgRename;
	}
	public void setPostImgRename(String postImgRename) {
		PostImgRename = postImgRename;
	}
	public String getPostImgPath() {
		return PostImgPath;
	}
	public void setPostImgPath(String postImgPath) {
		PostImgPath = postImgPath;
	}
	public long getPostImgLength() {
		return PostImgLength;
	}
	public void setPostImgLength(long postImgLength) {
		PostImgLength = postImgLength;
	}
	public int getPostImgOrder() {
		return postImgOrder;
	}
	public void setPostImgOrder(int postImgOrder) {
		this.postImgOrder = postImgOrder;
	}
	@Override
	public String toString() {
		return "PostImg [postImgNo=" + postImgNo + ", postNo=" + postNo + ", PostImgName=" + PostImgName
				+ ", PostImgRename=" + PostImgRename + ", PostImgPath=" + PostImgPath + ", PostImgLength="
				+ PostImgLength + ", postImgOrder=" + postImgOrder + "]";
	}
	
	
}
