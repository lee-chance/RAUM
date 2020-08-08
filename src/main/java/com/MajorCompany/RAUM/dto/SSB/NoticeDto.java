package com.MajorCompany.RAUM.dto.SSB;

import java.security.Timestamp;

public class NoticeDto {
	
	private int seq, User_seq; 
	private String title, content, writeDate;
	
	public NoticeDto() {
		// TODO Auto-generated constructor stub
	}

	public NoticeDto(int seq, int User_seq, String title, String content, String writeDate) {
		super();
		this.seq = seq;
		this.User_seq = User_seq;
		this.title = title;
		this.content = content;
		this.writeDate = writeDate;
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

	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}


	
	

}
