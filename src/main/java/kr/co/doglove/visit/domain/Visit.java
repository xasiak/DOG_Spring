package kr.co.doglove.visit.domain;

import java.sql.Date;

public class Visit {

	private String bookUserName;
	private String bookUserPhone;
	private String bookUserEmail;
	private String bookPoint;
	private Date bookDate;
	private String bookTime;
	private String bookConcern;
	private String bookUserHouse;
	private String bookUserHouseHold;
	
	public Visit() {}

	public Visit(String bookUserName, String bookUserPhone, String bookUserEmail, String bookPoint, Date bookDate,
			String bookTime, String bookConcern, String bookUserHouse, String bookUserHouseHold) {
		super();
		this.bookUserName = bookUserName;
		this.bookUserPhone = bookUserPhone;
		this.bookUserEmail = bookUserEmail;
		this.bookPoint = bookPoint;
		this.bookDate = bookDate;
		this.bookTime = bookTime;
		this.bookConcern = bookConcern;
		this.bookUserHouse = bookUserHouse;
		this.bookUserHouseHold = bookUserHouseHold;
	}

	public String getBookUserName() {
		return bookUserName;
	}

	public void setBookUserName(String bookUserName) {
		this.bookUserName = bookUserName;
	}

	public String getBookUserPhone() {
		return bookUserPhone;
	}

	public void setBookUserPhone(String bookUserPhone) {
		this.bookUserPhone = bookUserPhone;
	}

	public String getBookUserEmail() {
		return bookUserEmail;
	}

	public void setBookUserEmail(String bookUserEmail) {
		this.bookUserEmail = bookUserEmail;
	}

	public String getBookPoint() {
		return bookPoint;
	}

	public void setBookPoint(String bookPoint) {
		this.bookPoint = bookPoint;
	}

	public Date getBookDate() {
		return bookDate;
	}

	public void setBookDate(Date bookDate) {
		this.bookDate = bookDate;
	}

	public String getBookTime() {
		return bookTime;
	}

	public void setBookTime(String bookTime) {
		this.bookTime = bookTime;
	}

	public String getBookConcern() {
		return bookConcern;
	}

	public void setBookConcern(String bookConcern) {
		this.bookConcern = bookConcern;
	}

	public String getBookUserHouse() {
		return bookUserHouse;
	}

	public void setBookUserHouse(String bookUserHouse) {
		this.bookUserHouse = bookUserHouse;
	}

	public String getBookUserHouseHold() {
		return bookUserHouseHold;
	}

	public void setBookUserHouseHold(String bookUserHouseHold) {
		this.bookUserHouseHold = bookUserHouseHold;
	}

	@Override
	public String toString() {
		return "Book [bookUserName=" + bookUserName + ", bookUserPhone=" + bookUserPhone + ", bookUserEmail="
				+ bookUserEmail + ", bookPoint=" + bookPoint + ", bookDate=" + bookDate + ", bookTime=" + bookTime
				+ ", bookConcern=" + bookConcern + ", bookUserHouse=" + bookUserHouse + ", bookUserHouseHold="
				+ bookUserHouseHold + "]";
	}

	
}
