package com.MajorCompany.RAUM.dto.SSB;

public class LoginDto {
	private int seq;
	private String email, password;
	
	public LoginDto() {
		// TODO Auto-generated constructor stub
	}

	public LoginDto(int seq, String email, String password) {
		super();
		this.seq = seq;
		this.email = email;
		this.password = password;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
