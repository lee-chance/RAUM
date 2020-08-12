package com.MajorCompany.RAUM.dto.SSB;

import java.security.Timestamp;

public class NoticeQDto {
	private int seq, User_seq;
	private String title, content, type;
	
	public NoticeQDto() {
		// TODO Auto-generated constructor stub
	}

	public NoticeQDto(int seq, int user_seq, String title, String content, String type) {
		super();
		this.seq = seq;
		User_seq = user_seq;
		this.title = title;
		this.content = content;
		this.type = type;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getUser_seq() {
		return User_seq;
	}

	public void setUser_seq(int user_seq) {
		User_seq = user_seq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	
	
	
}
