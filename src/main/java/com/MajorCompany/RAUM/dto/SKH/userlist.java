package com.MajorCompany.RAUM.dto.SKH;

public class userlist {
	
	private String email;
	private String nickname;
	private String createdate;
	private String address;
	private String phone;
	private String point;
	private String password;
	
	public userlist() {
		// TODO Auto-generated constructor stub
	}

	public userlist(String email, String nickname, String createdate, String address, String phone, String point,
			String password) {
		super();
		this.email = email;
		this.nickname = nickname;
		this.createdate = createdate;
		this.address = address;
		this.phone = phone;
		this.point = point;
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getCreatedate() {
		return createdate;
	}

	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPoint() {
		return point;
	}

	public void setPoint(String point) {
		this.point = point;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
