package com.MajorCompany.RAUM.dto.SSB;

import java.sql.Timestamp;

public class UserDto {
	private int seq, Login_seq, Grade_seq;
	private String nickname, phone, birthday;
	private Timestamp createDate;
	
	public UserDto() {
		// TODO Auto-generated constructor stub
	}

	public UserDto(int seq, int login_seq, int grade_seq, String nickname, String phone, String birthday,
			Timestamp createDate) {
		super();
		this.seq = seq;
		Login_seq = login_seq;
		Grade_seq = grade_seq;
		this.nickname = nickname;
		this.phone = phone;
		this.birthday = birthday;
		this.createDate = createDate;
	}
	
	public UserDto(int seq, String nickname) {
		super();
		this.seq = seq;
		this.nickname = nickname;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getLogin_seq() {
		return Login_seq;
	}

	public void setLogin_seq(int login_seq) {
		Login_seq = login_seq;
	}

	public int getGrade_seq() {
		return Grade_seq;
	}

	public void setGrade_seq(int grade_seq) {
		Grade_seq = grade_seq;
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

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public Timestamp getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}
	
	
}
