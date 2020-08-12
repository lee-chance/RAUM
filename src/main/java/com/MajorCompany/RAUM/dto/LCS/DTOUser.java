package com.MajorCompany.RAUM.dto.LCS;

import java.sql.Timestamp;

public class DTOUser {
	
	private String email;
	private String name;
	private String birth;
	private String password;
	private String phone;
	private String nickname;
	private String address;
	private int total_point;
	private Timestamp join_date;
	String checkMsg;
	String useEmail;
	
	public DTOUser() {
		// TODO Auto-generated constructor stub
	}

	public DTOUser(String email, String name, String birth, String password, String phone, String nickname,
			String address, int total_point, Timestamp join_date) {
		super();
		this.email = email;
		this.name = name;
		this.birth = birth;
		this.password = password;
		this.phone = phone;
		this.nickname = nickname;
		this.address = address;
		this.total_point = total_point;
		this.join_date = join_date;
	}

	public DTOUser(String email, String checkMsg, String useEmail) {
		super();
		this.email = email;
		this.checkMsg = checkMsg;
		this.useEmail = useEmail;
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

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getTotal_point() {
		return total_point;
	}

	public void setTotal_point(int total_point) {
		this.total_point = total_point;
	}

	public Timestamp getJoin_date() {
		return join_date;
	}

	public void setJoin_date(Timestamp join_date) {
		this.join_date = join_date;
	}

	public String getCheckMsg() {
		return checkMsg;
	}

	public void setCheckMsg(String checkMsg) {
		this.checkMsg = checkMsg;
	}

	public String getUseEmail() {
		return useEmail;
	}

	public void setUseEmail(String useEmail) {
		this.useEmail = useEmail;
	}
	
	
}
