package com.MajorCompany.RAUM.dto.JTY;

public class JTYDto {
	
	String email;
	String checkMsg;
	String useEmail;
	
	public JTYDto() {
		// TODO Auto-generated constructor stub
	}
	
	
	public JTYDto(String email, String checkMsg, String useEmail) {
		super();
		this.email = email;
		this.checkMsg = checkMsg;
		this.useEmail = useEmail;
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


	int seq;
	public JTYDto(String email) {
		super();
		this.email = email;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	

	
	
}
