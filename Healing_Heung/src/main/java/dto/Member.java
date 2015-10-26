package dto;

import java.util.Date;

public class Member {
	private String memberId;
	private String memberPassword;
	private String memberPasswordidentify;
	private String memberEmail;
	private String memberPhone;
	private String memberName;
	private Date memberRegDate;
	private Date memberBirth;

	private String memberBirthString;
		
	public Member() {
		super();
		
	}
	public Member(String memberId, String memberPassword, String memberEmail, String memberPhone, String memberName,
			Date memberRegDate, Date memberBirth) {
		super();
		this.memberId = memberId;
		this.memberPassword = memberPassword;
		this.memberEmail = memberEmail;
		this.memberPhone = memberPhone;
		this.memberName = memberName;
		this.memberRegDate = memberRegDate;
		this.memberBirth = memberBirth;
	}
	public Member(String memberId, String memberPassword, String memberName, Date memberBirth, String memberEmail, String memberPhone
			) {
		super();
		this.memberId = memberId;
		this.memberPassword = memberPassword;
		this.memberEmail = memberEmail;
		this.memberName = memberName;
		this.memberPhone = memberPhone;
		this.memberBirth = memberBirth;
	}
	
	public Member(String memberId, String memberPassword, String memberEmail, String memberPhone
			
			) {
		super();
		this.memberId = memberId;
		this.memberPassword = memberPassword;
		this.memberEmail = memberEmail;
		this.memberPhone = memberPhone;
	}
	public Member(String memberName,String memberEmail,String memberPhone
			) {
		super();
		this.memberName = memberName;
		this.memberEmail = memberEmail;
		this.memberPhone = memberPhone;
	}
	
	
	
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPassword() {
		return memberPassword;
	}
	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public Date getMemberRegDate() {
		return memberRegDate;
	}
	public void setMemberRegDate(Date memberRegDate) {
		this.memberRegDate = memberRegDate;
	}
	public Date getMemberBirth() {
		return memberBirth;
	}
	public void setMemberBirth(Date memberBirth) {
		this.memberBirth = memberBirth;
	}
	public String getMemberPasswordidentify() {
		return memberPasswordidentify;
	}
	public void setMemberPasswordidentify(String memberPasswordidentify) {
		this.memberPasswordidentify = memberPasswordidentify;
	}
	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", memberPassword=" + memberPassword + ", memberPasswordidentify="
				+ memberPasswordidentify + ", memberEmail=" + memberEmail + ", memberPhone=" + memberPhone
				+ ", memberName=" + memberName + ", memberRegDate=" + memberRegDate + ", memberBirth=" + memberBirth + "]";
	}
	public String getMemberBirthString() {
		return memberBirthString;
	}
	public void setMemberBirthString(String memberBirthString) {
		this.memberBirthString = memberBirthString;
	}
	
	
	
	
}
