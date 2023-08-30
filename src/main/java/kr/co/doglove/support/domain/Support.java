package kr.co.doglove.support.domain;

public class Support {
	private String supportName;
	private String supportPhone;
	private String supportEmail;
	private String supportAddr;
	private String supportType;
	private String supportPaymentMethod;
	private String supportBank;
	private String supportDepositorName;
	private int supportAccount;
	private int supportBirth;
	private int supportPaymentDate;
	private int supportPaymentAmount;
	private String supportPersonalInfo;
	private String supportSelfClearing;
	
	public String getSupportName() {
		return supportName;
	}
	public void setSupportName(String supportName) {
		this.supportName = supportName;
	}
	public String getSupportPhone() {
		return supportPhone;
	}
	public void setSupportPhone(String supportPhone) {
		this.supportPhone = supportPhone;
	}
	public String getSupportEmail() {
		return supportEmail;
	}
	public void setSupportEmail(String supportEmail) {
		this.supportEmail = supportEmail;
	}
	public String getSupportAddr() {
		return supportAddr;
	}
	public void setSupportAddr(String supportAddr) {
		this.supportAddr = supportAddr;
	}
	public String getSupportType() {
		return supportType;
	}
	public void setSupportType(String supportType) {
		this.supportType = supportType;
	}
	public String getSupportPaymentMethod() {
		return supportPaymentMethod;
	}
	public void setSupportPaymentMethod(String supportPaymentMethod) {
		this.supportPaymentMethod = supportPaymentMethod;
	}
	public String getSupportBank() {
		return supportBank;
	}
	public void setSupportBank(String supportBank) {
		this.supportBank = supportBank;
	}
	public String getSupportDepositorName() {
		return supportDepositorName;
	}
	public void setSupportDepositorName(String supportDepositorName) {
		this.supportDepositorName = supportDepositorName;
	}
	public int getSupportAccount() {
		return supportAccount;
	}
	public void setSupportAccount(int supportAccount) {
		this.supportAccount = supportAccount;
	}
	public int getSupportBirth() {
		return supportBirth;
	}
	public void setSupportBirth(int supportBirth) {
		this.supportBirth = supportBirth;
	}
	public int getSupportPaymentDate() {
		return supportPaymentDate;
	}
	public void setSupportPaymentDate(int supportPaymentDate) {
		this.supportPaymentDate = supportPaymentDate;
	}
	public int getSupportPaymentAmount() {
		return supportPaymentAmount;
	}
	public void setSupportPaymentAmount(int supportPaymentAmount) {
		this.supportPaymentAmount = supportPaymentAmount;
	}
	public String getSupportPersonalInfo() {
		return supportPersonalInfo;
	}
	public void setSupportPersonalInfo(String supportPersonalInfo) {
		this.supportPersonalInfo = supportPersonalInfo;
	}
	public String getSupportSelfClearing() {
		return supportSelfClearing;
	}
	public void setSupportSelfClearing(String supportSelfClearing) {
		this.supportSelfClearing = supportSelfClearing;
	}
	@Override
	public String toString() {
		return "Support [supportName=" + supportName + ", supportPhone=" + supportPhone + ", supportEmail="
				+ supportEmail + ", supportAddr=" + supportAddr + ", supportType=" + supportType
				+ ", supportPaymentMethod=" + supportPaymentMethod + ", supportBank=" + supportBank
				+ ", supportDepositorName=" + supportDepositorName + ", supportAccount=" + supportAccount
				+ ", supportBirth=" + supportBirth + ", supportPaymentDate=" + supportPaymentDate
				+ ", supportPaymentAmount=" + supportPaymentAmount + ", supportPersonalInfo=" + supportPersonalInfo
				+ ", supportSelfClearing=" + supportSelfClearing + "]";
	}
	
	
}
