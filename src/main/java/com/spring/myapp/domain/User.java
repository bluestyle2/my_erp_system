package com.spring.myapp.domain;

import java.sql.Date;
import java.util.Map;

public class User {
	
	private String userId;
	private String userName;
	private String userPw;
	private int groupId;
	private String jobCode;
	private String profileImg;
	private String registDate;
	private String entryDate;
	
	 public User() {
	    }
	
	 public User(Map<String, Object> paramMap) {
	        this.userId = (String) paramMap.get("user_id");
	        this.userPw = (String) paramMap.get("user_pw");
	        this.userName = (String) paramMap.get("user_name");
	    }
	
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
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public int getGroupId() {
		return groupId;
	}
	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}
	public String getJobCode() {
		return jobCode;
	}
	public void setJobCode(String jobCode) {
		this.jobCode = jobCode;
	}
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	
	public String getRegistDate() {
		return registDate;
	}

	public void setRegistDate(String registDate) {
		this.registDate = registDate;
	}

	public String getEntryDate() {
		return entryDate;
	}
	public void setEntryDate(String entryDate) {
		this.entryDate = entryDate;
	}
		
}
