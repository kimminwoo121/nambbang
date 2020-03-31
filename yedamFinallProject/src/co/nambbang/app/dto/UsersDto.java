package co.nambbang.app.dto;

import java.util.Date;

public class UsersDto {
	private String userId;
	private String userName;
	private String userMail;
	private String userTelNo;
	private Date userBirthdy;
	private String userSexDSTN;
	private String userSttus;
	private Date userSRBDE;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserMail() {
		return userMail;
	}
	public void setUserMail(String userMail) {
		this.userMail = userMail;
	}
	public String getUserTelNo() {
		return userTelNo;
	}
	public void setUserTelNo(String userTelNo) {
		this.userTelNo = userTelNo;
	}
	public Date getUserBirthdy() {
		return userBirthdy;
	}
	public void setUserBirthdy(Date userBirthdy) {
		this.userBirthdy = userBirthdy;
	}
	public String getUserSexDSTN() {
		return userSexDSTN;
	}
	public void setUserSexDSTN(String userSexDSTN) {
		this.userSexDSTN = userSexDSTN;
	}
	public String getUserSttus() {
		return userSttus;
	}
	public void setUserSttus(String userSttus) {
		this.userSttus = userSttus;
	}
	public Date getUserSRBDE() {
		return userSRBDE;
	}
	public void setUserSRBDE(Date userSRBDE) {
		this.userSRBDE = userSRBDE;
	}
	@Override
	public String toString() {
		return "UsersDto [userId=" + userId + ", userName=" + userName + ", userMail=" + userMail + ", userTelNo="
				+ userTelNo + ", userBirthdy=" + userBirthdy + ", userSexDSTN=" + userSexDSTN + ", userSttus="
				+ userSttus + ", userSRBDE=" + userSRBDE + "]";
	}
	
	
	
}
