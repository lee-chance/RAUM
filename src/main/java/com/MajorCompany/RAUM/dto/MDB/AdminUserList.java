package com.MajorCompany.RAUM.dto.MDB;

public class AdminUserList {
	
	public String name, phone, email, nickname;
	
	public AdminUserList() {
		// TODO Auto-generated constructor stub
	}

	public AdminUserList(String name, String phone, String email, String nickname) {
		super();
		this.name = name;
		this.nickname = nickname;
		this.phone = phone;
		this.email = email;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
	

}
